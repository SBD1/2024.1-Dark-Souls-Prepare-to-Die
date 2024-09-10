import psycopg2
import random
import json

class DarkSoulsGame:
    def __init__(self):
        try:
            self.conn = psycopg2.connect(
                dbname="DarkSoulsGame",
                user="postgres",
                password="postgres",
                host="localhost"
            )
            self.cur = self.conn.cursor()
        except psycopg2.DatabaseError as e:
            print(f"Error connecting to the database: {e}")
            raise

        self.player = None
        self.current_position = None
        self.previous_position = None
        self.path_stack = []
        self.initialize_game_world()

    def initialize_game_world(self):
        try:
            self.cur.execute("SELECT COUNT(*) FROM Region")
            if self.cur.fetchone()[0] == 0:
                regions = [
                    ("Northern Undead Asylum", "The starting area of the game, a decrepit asylum."),
                    ("Firelink Shrine", "A central bonfire area connecting various parts of Lordran."),
                ]
                self.cur.executemany(
                    "INSERT INTO Region (nome, description) VALUES (%s, %s)", regions
                )

                self.cur.execute(
                    "INSERT INTO RegionGraphNode (region_description, region_id) VALUES (%s, (SELECT id FROM Region WHERE nome = %s)) RETURNING position",
                    ("Northern Undead Asylum Bonfire", "Northern Undead Asylum"),
                )
                northern_undead_asylum_pos = self.cur.fetchone()[0]

                self.cur.execute(
                    "INSERT INTO RegionGraphNode (region_description, region_id) VALUES (%s, (SELECT id FROM Region WHERE nome = %s)) RETURNING position",
                    ("Firelink Shrine Bonfire", "Firelink Shrine"),
                )
                firelink_shrine_pos = self.cur.fetchone()[0]

                self.cur.execute(
                    "INSERT INTO RegionGraphEdge (origin_node, destination_node) VALUES (%s, %s)",
                    (northern_undead_asylum_pos, firelink_shrine_pos),
                )
                self.cur.execute(
                    "INSERT INTO RegionGraphEdge (origin_node, destination_node) VALUES (%s, %s)",
                    (firelink_shrine_pos, northern_undead_asylum_pos),
                )

                bonfires = [
                    (1, True, True, True, northern_undead_asylum_pos),
                    (1, True, True, True, firelink_shrine_pos),
                ]
                self.cur.executemany(
                    "INSERT INTO Bonfire (kindle_level, bonfire_active, warp_ok, bonfire_reset_status, region_graph_node_position) VALUES (%s, %s, %s, %s, %s)",
                    bonfires,
                )

                self.conn.commit()
                print("Game world initialized successfully.")
        except psycopg2.DatabaseError as e:
            print(f"Error initializing the game world: {e}")
            self.conn.rollback()


    def create_character(self, name, class_name):
        try:
            self.cur.execute("SELECT * FROM Class WHERE nome = %s", (class_name,))
            class_data = self.cur.fetchone()

            if not class_data:
                print(f"Invalid class name. Please choose a valid class.")
                return

            self.cur.execute("""
            INSERT INTO Personagem (nome, tipo, hp_total, stamina_total, poise_resistance)
            VALUES (%s, 'PC', %s, %s, 50) RETURNING id
            """, (name, class_data[3] * 10, class_data[6] * 5))
            personagem_id = self.cur.fetchone()[0]

            self.cur.execute("""
            INSERT INTO PC (personagem_id, class_id, vitality, attunement, endurance, strength, dexterity, intelligence, faith, humanity, equip_load, attunement_slot, position, pc_level, hp_atual, stamina_atual)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, 0, 50, 1, 
            (SELECT position FROM RegionGraphNode WHERE position = 1),
            %s, %s, %s) RETURNING id, position
            """, (personagem_id, class_data[0], class_data[3], class_data[4], class_data[6], class_data[7], class_data[5], class_data[8], class_data[9], class_data[2], class_data[3] * 10, class_data[6] * 5))

            result = self.cur.fetchone()
            self.player = result[0]
            self.current_position = result[1]
            self.previous_position = result[1]
            self.conn.commit()
            self.starting_position = self.current_position  
            self.path_stack.append(self.current_position)
            print(f"Character {name} created successfully!")
            self.save_character()
        except psycopg2.DatabaseError as e:
            print(f"Error creating character: {e}")
            self.conn.rollback()

    def save_character(self):
        try:
            character_data = {
                'player_id': self.player,
                'current_position': self.current_position,
                'previous_position': self.previous_position,
            }
            with open(f"character_{self.player}.json", "w") as f:
                json.dump(character_data, f)
            print(f"Character saved successfully!")
        except Exception as e:
            print(f"Error saving character: {e}")

    def load_character(self):
        try:
            self.cur.execute("SELECT id, nome FROM Personagem WHERE tipo = 'PC'")
            characters = self.cur.fetchall()

            if not characters:
                print("No playable characters available to load.")
                return False

            print("\nAvailable playable characters:")
            for i, character in enumerate(characters):
                print(f"{i + 1}: {character[1]} (ID: {character[0]})")

            while True:
                char_choice = input(f"Choose a character to load (1-{len(characters)}): ")
                if char_choice.isdigit() and 1 <= int(char_choice) <= len(characters):
                    self.player = characters[int(char_choice) - 1][0]
                    return self._load_character_data()
                print("Invalid choice.")
        except psycopg2.DatabaseError as e:
            print(f"Error loading character: {e}")
            return False


    def _load_character_data(self):
        try:
            with open(f"character_{self.player}.json", "r") as f:
                character_data = json.load(f)

            self.current_position = character_data['current_position']
            self.previous_position = character_data['previous_position']
            print(f"Loaded character.")
            return True
        except FileNotFoundError:
            print(f"No saved character found.")
            return False

    def describe_location(self):
        self.cur.execute("""
        SELECT rgn.region_description, r.nome, r.description
        FROM RegionGraphNode rgn
        JOIN Region r ON r.id = rgn.region_id
        WHERE rgn.position = %s
        """, (self.current_position,))
        location_data = self.cur.fetchone()

        if location_data:
            print(f"\nYou are in {location_data[1]}.")
            print(f"Location: {location_data[0]}")
            print(f"Description: {location_data[2]}")
        else:
            print("You are in an unknown location.")

    def get_possible_moves(self):
        
        self.cur.execute("""
        SELECT rge.destination_node, rgn.region_description, r.nome
        FROM RegionGraphEdge rge
        JOIN RegionGraphNode rgn ON rgn.position = rge.destination_node
        JOIN Region r ON r.id = rgn.region_id
        WHERE rge.origin_node = %s
        """, (self.current_position,))
    
        result = self.cur.fetchall()
        
        return result

    def move(self):
        possible_moves = self.get_possible_moves()

        if not possible_moves:
            print("\nThere are no available connections to move.")
            return

        print("\nPossible moves:")
        for i, move in enumerate(possible_moves):
            print(f"{i + 1}: {move[2]} - {move[1]}")
        print(f"{len(possible_moves) + 1}: Stay here")
        
        if self.path_stack and self.current_position != self.starting_position:
            print(f"{len(possible_moves) + 2}: Go back")
        else:
            print(f"{len(possible_moves) + 2}: Stay here")
        
        choice = input(f"Enter your choice (1-{len(possible_moves) + 2}): ")
        if choice.isdigit() and 1 <= int(choice) <= len(possible_moves) + 2:
            choice = int(choice)
        else:
            print("Invalid choice. Try again.")
            return

        if choice == len(possible_moves) + 2 and self.path_stack and self.current_position != self.starting_position:  
            self.go_back()
            return

        if choice == len(possible_moves) + 1:  
            print("You decide to stay here.")
            return

        self.path_stack.append(self.current_position)
        new_position = possible_moves[choice - 1][0]
        self.previous_position = self.current_position
        self.current_position = new_position
        print(f"Moved to {possible_moves[choice - 1][1]}.")
        self.describe_location()


    def go_back(self):
        if self.path_stack:
            self.current_position = self.path_stack.pop()
            print(f"Returned to previous position.")
            self.describe_location()
        else:
            print("No previous position to return to.")
    
    def rest_at_bonfire(self):
        self.cur.execute("SELECT * FROM Bonfire WHERE region_graph_node_position = %s", (self.current_position,))
        bonfire = self.cur.fetchone()
        if bonfire:
            self.hp = self.vitality * 10
            self.stamina = self.endurance * 5
            print("You rested at the bonfire. Your HP and stamina have been restored.")
            self.level_up()
        else:
            print("There is no bonfire here to rest at.")
    
    def level_up(self):
        while True:
            print("\nChoose a stat to level up:")
            print("1. Vitality")
            print("2. Attunement")
            print("3. Endurance")
            print("4. Strength")
            print("5. Dexterity")
            print("6. Intelligence")
            print("7. Faith")
            print("8. Exit")
            choice = input("Enter your choice (1-8): ")
            if choice == '8':
                break
            elif choice in ['1', '2', '3', '4', '5', '6', '7']:
                stat = ['vitality', 'attunement', 'endurance', 'strength', 'dexterity', 'intelligence', 'faith'][int(choice) - 1]
                setattr(self, stat, getattr(self, stat) + 1)
                print(f"{stat.capitalize()} increased to {getattr(self, stat)}!")
                self.cur.execute(f"UPDATE PC SET {stat} = %s WHERE id = %s", (getattr(self, stat), self.player))
                self.conn.commit()
            else:
                print("Invalid choice. Try again.")
    
    def show_stats(self):
        try:
            self.cur.execute("""
        SELECT p.nome, p.hp_total, p.stamina_total, p.poise_resistance,
               pc.class_id, pc.gift, pc.vitality, pc.attunement, pc.endurance,
               pc.strength, pc.dexterity, pc.intelligence, pc.faith, pc.humanity,
               pc.equip_load, pc.attunement_slot, pc.pc_level, pc.hp_atual, pc.stamina_atual
        FROM Personagem p
        JOIN PC pc ON p.id = pc.personagem_id
        WHERE pc.id = %s
        """, (self.player,))

            result = self.cur.fetchone()
            if result:
                (nome, hp_total, stamina_total, poise_resistance,
                class_id, gift, vitality, attunement, endurance,
                strength, dexterity, intelligence, faith, humanity,
                equip_load, attunement_slot, pc_level, hp_atual, stamina_atual) = result

                print(f"Name: {nome}")
                print(f"HP Total: {hp_total}")
                print(f"Stamina Total: {stamina_total}")
                print(f"Poise Resistance: {poise_resistance}")
                print(f"Class ID: {class_id}")
                print(f"Gift: {gift}")
                print(f"Vitality: {vitality}")
                print(f"Attunement: {attunement}")
                print(f"Endurance: {endurance}")
                print(f"Strength: {strength}")
                print(f"Dexterity: {dexterity}")
                print(f"Intelligence: {intelligence}")
                print(f"Faith: {faith}")
                print(f"Humanity: {humanity}")
                print(f"Equip Load: {equip_load}")
                print(f"Attunement Slot: {attunement_slot}")
                print(f"PC Level: {pc_level}")
                print(f"HP Atual: {hp_atual}")
                print(f"Stamina Atual: {stamina_atual}")
            else:
                print("Error: Character not found.")
        except psycopg2.DatabaseError as e:
            print(f"Error showing stats: {e}")
    
    def manage_inventory(self):
        try:
            self.cur.execute("""
                SELECT i.nome, i.tipo, ii.quantity
                FROM InventoryItem ii
                JOIN Item i ON ii.item_instance_id = i.id
                WHERE ii.inventory_id = (
                    SELECT id
                    FROM Inventory
                    WHERE personagem_id = %s
                )
                """, (self.player,))

            items = self.cur.fetchall()

            if items:
                print("\nYour Inventory:")
                for item in items:
                    print(f"- {item[0]} ({item[1]}) x{item[2]}")
            else:
                print("Your inventory is empty.")

            print("\n--- Inventory Management ---")
            print("1. Use an item")
            print("2. Discard an item")
            print("3. Back to main menu")
            
            choice = input("Enter your choice (1-3): ")

            if choice == '1':
                self.use_item()
            elif choice == '2':
                self.discard_item()
            elif choice == '3':
                return
            else:
                print("Invalid choice. Returning to main menu.")
                return

        except psycopg2.DatabaseError as e:
            print(f"Error managing inventory: {e}")

    def use_item(self):
        try:

            self.cur.execute("""
                SELECT i.id, i.nome, i.tipo, ii.quantity
                FROM InventoryItem ii
                JOIN Item i ON ii.item_instance_id = i.id
                WHERE ii.inventory_id = (
                    SELECT id
                    FROM Inventory
                    WHERE personagem_id = %s
                )
                """, (self.player,))

            items = self.cur.fetchall()

            if not items:
                print("Your inventory is empty. No items to use.")
                return

            print("\nItems available to use:")
            for i, item in enumerate(items):
                print(f"{i + 1}: {item[1]} ({item[2]}) x{item[3]}")

            choice = input(f"Enter the number of the item to use (1-{len(items)}): ")
            if choice.isdigit() and 1 <= int(choice) <= len(items):
                item_id = items[int(choice) - 1][0]
                self.cur.execute("""
                    UPDATE InventoryItem
                    SET quantity = quantity - 1
                    WHERE inventory_id = (
                        SELECT id
                        FROM Inventory
                        WHERE personagem_id = %s
                    ) AND item_instance_id = %s
                """, (self.player, item_id))
                self.conn.commit()
                print(f"You used {items[int(choice) - 1][1]}.")
            else:
                print("Invalid choice.")

        except psycopg2.DatabaseError as e:
            print(f"Error using item: {e}")

    def discard_item(self):
        try:
            
            self.cur.execute("""
                SELECT i.id, i.nome, i.tipo, ii.quantity
                FROM InventoryItem ii
                JOIN Item i ON ii.item_instance_id = i.id
                WHERE ii.inventory_id = (
                    SELECT id
                    FROM Inventory
                    WHERE personagem_id = %s
                )
                """, (self.player,))

            items = self.cur.fetchall()

            if not items:
                print("Your inventory is empty. No items to discard.")
                return

            print("\nItems available to discard:")
            for i, item in enumerate(items):
                print(f"{i + 1}: {item[1]} ({item[2]}) x{item[3]}")

            choice = input(f"Enter the number of the item to discard (1-{len(items)}): ")
            if choice.isdigit() and 1 <= int(choice) <= len(items):
                item_id = items[int(choice) - 1][0]
                self.cur.execute("""
                    DELETE FROM InventoryItem
                    WHERE inventory_id = (
                        SELECT id
                        FROM Inventory
                        WHERE personagem_id = %s
                    ) AND item_instance_id = %s
                """, (self.player, item_id))
                self.conn.commit()
                print(f"You discarded {items[int(choice) - 1][1]}.")
            else:
                print("Invalid choice.")

        except psycopg2.DatabaseError as e:
            print(f"Error discarding item: {e}")


            
    def find_items(self):
        self.cur.execute("""
        SELECT i.id, i.nome, i.tipo
        FROM Chest c
        JOIN Item i ON c.item_id = i.id
        WHERE c.position = %s
        """, (self.current_position,))
        items = self.cur.fetchall()

        if items:
            print("\nYou found the following items:")
            for item in items:
                print(f"- {item[1]} ({item[2]})")
                self.add_item_to_inventory(item[0], item[1], item[2])
        else:
            print("You didn't find any items here.")
            
    def add_item_to_inventory(self, item_id, item_name, item_type):
        self.cur.execute("""
        INSERT INTO InventoryItem (inventory_id, item_instance_id, item_tipo, quantity)
        VALUES (
            (SELECT id FROM Inventory WHERE personagem_id = %s),
            %s,
            %s,
            1
        )
        ON CONFLICT (inventory_id, item_instance_id, item_tipo) 
        DO UPDATE SET quantity = InventoryItem.quantity + 1
        """, (self.player, item_id, item_type))
        self.conn.commit()
        print(f"Added {item_name} to your inventory.")
    
    def equip_item(self):
        self.cur.execute("""
        SELECT ii.id, i.nome, i.tipo
        FROM InventoryItem ii
        JOIN Item i ON ii.item_instance_id = i.id
        WHERE ii.inventory_id = (SELECT id FROM Inventory WHERE personagem_id = %s)
        AND i.equip = true
        """, (self.player,))
        equippable_items = self.cur.fetchall()

        if not equippable_items:
            print("You don't have any equippable items in your inventory.")
            return

        print("\nEquippable items:")
        for i, item in enumerate(equippable_items):
            print(f"{i + 1}: {item[1]} ({item[2]})")

        choice = input(f"Enter the number of the item to equip (1-{len(equippable_items)}): ")
        if choice.isdigit() and 1 <= int(choice) <= len(equippable_items):
            item_id, item_name, item_type = equippable_items[int(choice) - 1]
            self.equip_specific_item(item_id, item_name, item_type)
        else:
            print("Invalid choice.")
    
    def equip_specific_item(self, item_id, item_name, item_type):
        if item_type == 'Weapon':
            self.cur.execute("""
            UPDATE Weapon SET equipped = true
            WHERE inventory_item_id = %s
            """, (item_id,))
        elif item_type == 'Armor':
            self.cur.execute("""
            UPDATE Armor SET equipped = true
            WHERE inventory_item_id = %s
            """, (item_id,))
        elif item_type == 'Ring':
            self.cur.execute("""
            UPDATE Ring SET equipped = true
            WHERE inventory_item_id = %s
            """, (item_id,))
        else:
            print(f"Cannot equip item of type {item_type}")
            return

        self.conn.commit()
        print(f"Equipped {item_name}")

    
    def close(self):
        self.cur.close()
        self.conn.close()
        print("Database connection closed.")

    def check_for_enemies(self):
        self.cur.execute("""
        SELECT p.nome, n.hp_atual, n.stamina_atual
        FROM NPC n
        JOIN Personagem p ON n.personagem_id = p.id
        WHERE n.position = %s AND n.tipo = 'Enemy'
        """, (self.current_position,))
        enemies = self.cur.fetchall()

        if enemies:
            print("\nYou encounter the following enemies:")
            for i, enemy in enumerate(enemies):
                print(f"{i + 1}: {enemy[0]} (HP: {enemy[1]}, Stamina: {enemy[2]})")
            return enemies
        else:
            print("There are no enemies here.")
            return []
    
    def loot_enemy(self, enemy_name):
        self.cur.execute("SELECT id FROM Item ORDER BY RANDOM() LIMIT 1")
        item_id = self.cur.fetchone()[0]
        self.cur.execute("INSERT INTO Inventory (personagem_id) VALUES (%s) RETURNING id", (self.player,))
        inventory_id = self.cur.fetchone()[0]
        self.cur.execute("INSERT INTO InventoryItem (inventory_id, item_instance_id, quantity) VALUES (%s, %s, 1)", (inventory_id, item_id))
        self.conn.commit()
        self.cur.execute("SELECT nome FROM Item WHERE id = %s", (item_id,))
        item_name = self.cur.fetchone()[0]
        print(f"You found: {item_name}")
        
    def battle(self, enemy):
        enemy_name, enemy_hp, enemy_stamina = enemy
        print(f"\nYou engage in battle with {enemy_name}!")

        while True:
            print("\nYour turn:")
            print("1: Attack")
            print("2: Defend")
            print("3: Use Item")
            print("4: Run")

            choice = input("Enter your choice (1-4): ")

            if choice == '1':
                damage = random.randint(10, 20)
                enemy_hp -= damage
                print(f"You deal {damage} damage to {enemy_name}.")
            elif choice == '2':
                print("You defend, reducing incoming damage.")
            elif choice == '3':
                self.use_item_in_battle()
            elif choice == '4':
                if random.random() < 0.5:
                    print("You successfully run away!")
                    return True
                else:
                    print("You failed to run away!")
            else:
                print("Invalid choice. Skipping turn.")

            if enemy_hp <= 0:
                print(f"You defeated {enemy_name}!")
                self.loot_enemy(enemy_name)
                return True

            print(f"\n{enemy_name}'s turn:")
            enemy_damage = random.randint(5, 15)
            print(f"{enemy_name} attacks you for {enemy_damage} damage.")
            
        if self.hp <= 0:
            print("You have died. Game Over.")
            return False
        else:
            print(f"You have defeated {enemy[0]}!")
            self.gain_experience()
            self.loot_enemy()
            return True

        return False
    
    def gain_experience(self):
        exp_gain = random.randint(50, 100)
        self.level += 1
        print(f"You gained {exp_gain} experience and leveled up to level {self.level}!")
        self.cur.execute("UPDATE PC SET pc_level = %s WHERE id = %s", (self.level, self.player))
        self.conn.commit()
    
    def use_item_in_battle(self):
        self.cur.execute("""
        SELECT ii.id, i.nome, i.tipo, ii.quantity
        FROM InventoryItem ii
        JOIN Item i ON ii.item_instance_id = i.id
        WHERE ii.inventory_id = (SELECT id FROM Inventory WHERE personagem_id = %s)
        AND i.tipo = 'Consumable'
        """, (self.player,))
        consumables = self.cur.fetchall()

        if not consumables:
            print("You don't have any consumable items.")
            return

        print("\nConsumable items:")
        for i, item in enumerate(consumables):
            print(f"{i + 1}: {item[1]} (Quantity: {item[3]})")

        choice = input(f"Enter the number of the item to use (1-{len(consumables)}): ")
        if choice.isdigit() and 1 <= int(choice) <= len(consumables):
            item_id, item_name, _, quantity = consumables[int(choice) - 1]
            self.use_consumable(item_id, item_name)
        else:
            print("Invalid choice.")

    def use_consumable(self, item_id, item_name):
        self.cur.execute("""
        UPDATE InventoryItem
        SET quantity = quantity - 1
        WHERE id = %s
        """, (item_id,))
        self.conn.commit()
        print(f"You used {item_name}.")
        

    def main_loop(self):
        self.describe_location()
        while True:
            print("\n--- Main Menu ---")
            print("1. Move")
            print("2. Check for enemies")
            print("3. Rest at bonfire")
            print("4. Show stats")
            print("5. Manage inventory")
            print("6. Find items")
            print("7. Equip item")
            print("8. Save and Quit")
            choice = input("Enter your choice (1-8): ")

            if choice == '1':
                self.move()
            elif choice == '2':
                enemies = self.check_for_enemies()
                if enemies:
                    print(f"{len(enemies) + 1}: Run away")
                    enemy_choice = input(f"Enter the number of the enemy you want to battle, or {len(enemies) + 1} to run: ")
                    if enemy_choice == str(len(enemies) + 1):
                        print("You run away from the enemies.")
                    elif enemy_choice.isdigit() and 1 <= int(enemy_choice) <= len(enemies):
                        if not self.battle(enemies[int(enemy_choice) - 1]):
                            break
                    else:
                        print("Invalid choice. No battle initiated.")
            elif choice == '3':
                self.rest_at_bonfire()
            elif choice == '4':
                self.show_stats()
            elif choice == '5':
                self.manage_inventory()
            elif choice == '6':
                self.find_items()
            elif choice == '7':
                self.equip_item()
            elif choice == '8':
                self.save_character()
                print("Character saved. Thanks for playing!")
                break
            else:
                print("Invalid choice. Try again.")

if __name__ == "__main__":
    game = DarkSoulsGame()
    print("Welcome to the Dark Souls Text Adventure!")
    while True:
        print("1: Create a new character")
        print("2: Load an existing character")
        choice = input("Choose an option (1-2): ")
        if choice == '1':
            name = input("Enter your character's name: ")
            game.cur.execute("SELECT nome FROM Class")
            classes = [cls[0] for cls in game.cur.fetchall()]
            print("Available classes:")
            for i, cls in enumerate(classes):
                print(f"{i + 1}: {cls}")
            class_choice = input(f"Choose your class (1-{len(classes)}): ")
            game.create_character(name, classes[int(class_choice) - 1])
            break
        elif choice == '2':
            if game.load_character():
                break
        else:
            print("Invalid choice. Please enter 1 or 2.")
    
    if game.player:
        game.main_loop()

    game.close()
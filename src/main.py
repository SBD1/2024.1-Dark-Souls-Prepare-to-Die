import psycopg2
import random

class DarkSoulsGame:
    def __init__(self):
        self.conn = psycopg2.connect(
            dbname="DarkSoulsGame",
            user="postgres",
            password="postgres",
            host="localhost"
        )
        self.cur = self.conn.cursor()
        self.player = None
        self.current_position = None

    def create_character(self, name, class_name):
        self.cur.execute("SELECT * FROM Class WHERE nome = %s", (class_name,))
        class_data = self.cur.fetchone()
        if not class_data:
            print("Invalid class name.")
            return
        
        self.cur.execute("""
        INSERT INTO Personagem (nome, tipo, hp_total, stamina_total, poise_resistance)
        VALUES (%s, 'PC', %s, %s, 50) RETURNING id
        """, (name, class_data[3] * 10, class_data[6] * 5))
        personagem_id = self.cur.fetchone()[0]
        
        self.cur.execute("""
        INSERT INTO PC (personagem_id, class_id, vitality, attunement, endurance, strength, dexterity, intelligence, faith, humanity, equip_load, attunement_slot, position, pc_level, hp_atual, stamina_atual)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, 0, 50, 1, 
        (SELECT position FROM RegionGraphNode WHERE region_description LIKE '%%Northern Undead Asylum%%' LIMIT 1),
        %s, %s, %s) RETURNING id
        """, (personagem_id, class_data[0], class_data[3], class_data[4], class_data[6], class_data[7], class_data[5], class_data[8], class_data[9], class_data[2], class_data[3] * 10, class_data[6] * 5))
        
        self.player = self.cur.fetchone()[0]
        self.conn.commit()
        print(f"Character {name} created successfully!")
        self.load_character()

    def load_character(self):
        self.cur.execute("""
        SELECT p.nome, pc.vitality, pc.attunement, pc.endurance, pc.strength, pc.dexterity, pc.intelligence, pc.faith, pc.humanity, pc.equip_load, pc.attunement_slot, pc.position, pc.pc_level, pc.hp_atual, pc.stamina_atual
        FROM PC pc
        JOIN Personagem p ON p.id = pc.personagem_id
        WHERE pc.id = %s
        """, (self.player,))
        player_data = self.cur.fetchone()
        self.player_name = player_data[0]
        self.vitality, self.attunement, self.endurance, self.strength, self.dexterity, self.intelligence, self.faith, self.humanity, self.equip_load, self.attunement_slot, self.current_position, self.level, self.hp, self.stamina = player_data[1:]
        print(f"Loaded character: {self.player_name}")

    def show_stats(self):
        print(f"\n--- {self.player_name}'s Stats ---")
        print(f"Level: {self.level}")
        print(f"HP: {self.hp}")
        print(f"Stamina: {self.stamina}")
        print(f"Vitality: {self.vitality}")
        print(f"Attunement: {self.attunement}")
        print(f"Endurance: {self.endurance}")
        print(f"Strength: {self.strength}")
        print(f"Dexterity: {self.dexterity}")
        print(f"Intelligence: {self.intelligence}")
        print(f"Faith: {self.faith}")
        print(f"Humanity: {self.humanity}")
        print(f"Equip Load: {self.equip_load}")
        print(f"Attunement Slots: {self.attunement_slot}")

    def move(self, direction):
        self.cur.execute("""
        SELECT destination_node 
        FROM RegionGraphEdge 
        WHERE origin_node = %s
        """, (self.current_position,))
        possible_moves = [row[0] for row in self.cur.fetchall()]
        
        if not possible_moves:
            print("You can't move anywhere from here.")
            return
        
        if direction == 'random':
            new_position = random.choice(possible_moves)
        elif direction.isdigit() and int(direction) < len(possible_moves):
            new_position = possible_moves[int(direction)]
        else:
            print("Invalid move. Try again.")
            return
        
        self.current_position = new_position
        self.cur.execute("UPDATE PC SET position = %s WHERE id = %s", (self.current_position, self.player))
        self.conn.commit()
        self.describe_location()

    def describe_location(self):
        self.cur.execute("""
        SELECT r.nome, r.description
        FROM RegionGraphNode rgn
        JOIN Region r ON r.id = rgn.region_id
        WHERE rgn.position = %s
        """, (self.current_position,))
        region_data = self.cur.fetchone()
        print(f"\nYou are in {region_data[0]}.")
        print(region_data[1])
        
        self.cur.execute("""
        SELECT destination_node 
        FROM RegionGraphEdge 
        WHERE origin_node = %s
        """, (self.current_position,))
        possible_moves = [row[0] for row in self.cur.fetchall()]
        print("You can move to:")
        for i, move in enumerate(possible_moves):
            self.cur.execute("SELECT region_description FROM RegionGraphNode WHERE position = %s", (move,))
            print(f"{i}: {self.cur.fetchone()[0]}")

    def check_for_enemies(self):
        self.cur.execute("""
        SELECT p.nome, n.hp, n.stamina_atual
        FROM NPC n
        JOIN Personagem p ON p.id = n.personagem_id
        WHERE n.position = %s
        """, (self.current_position,))
        enemies = self.cur.fetchall()
        if enemies:
            print("\nYou encounter the following enemies:")
            for i, enemy in enumerate(enemies):
                print(f"{i}: {enemy[0]} (HP: {enemy[1]}, Stamina: {enemy[2]})")
            return enemies
        else:
            print("There are no enemies here.")
            return None

    def battle(self, enemy):
        print(f"\nBattle with {enemy[0]} begins!")
        enemy_hp = enemy[1]
        while enemy_hp > 0 and self.hp > 0:
            print(f"\nYour HP: {self.hp}, Enemy HP: {enemy_hp}")
            action = input("Do you want to attack (a) or heal (h)? ").lower()
            if action == 'a':
                damage = random.randint(10, 20)
                enemy_hp -= damage
                print(f"You deal {damage} damage to the enemy.")
            elif action == 'h':
                heal = random.randint(20, 40)
                self.hp = min(self.hp + heal, self.vitality * 10)
                print(f"You heal for {heal} HP.")
            else:
                print("Invalid action. Turn skipped.")
            
            if enemy_hp > 0:
                enemy_damage = random.randint(5, 15)
                self.hp -= enemy_damage
                print(f"The enemy deals {enemy_damage} damage to you.")
        
        if self.hp <= 0:
            print("You have died. Game Over.")
            return False
        else:
            print(f"You have defeated {enemy[0]}!")
            self.gain_experience()
            self.loot_enemy()
            return True

    def gain_experience(self):
        exp_gain = random.randint(50, 100)
        self.level += 1
        print(f"You gained {exp_gain} experience and leveled up to level {self.level}!")
        self.cur.execute("UPDATE PC SET pc_level = %s WHERE id = %s", (self.level, self.player))
        self.conn.commit()

    def loot_enemy(self):
        self.cur.execute("SELECT id FROM Item ORDER BY RANDOM() LIMIT 1")
        item_id = self.cur.fetchone()[0]
        self.cur.execute("INSERT INTO Inventory (personagem_id) VALUES (%s) RETURNING id", (self.player,))
        inventory_id = self.cur.fetchone()[0]
        self.cur.execute("INSERT INTO InventoryItem (inventory_id, item_instance_id, quantity) VALUES (%s, %s, 1)", (inventory_id, item_id))
        self.conn.commit()
        self.cur.execute("SELECT nome FROM Item WHERE id = %s", (item_id,))
        item_name = self.cur.fetchone()[0]
        print(f"You found: {item_name}")

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

    def show_inventory(self):
        self.cur.execute("""
        SELECT i.nome, ii.quantity
        FROM InventoryItem ii
        JOIN Item i ON i.id = ii.item_instance_id
        JOIN Inventory inv ON inv.id = ii.inventory_id
        WHERE inv.personagem_id = %s
        """, (self.player,))
        inventory = self.cur.fetchall()
        print("\n--- Inventory ---")
        for item in inventory:
            print(f"{item[0]}: {item[1]}")

    def main_loop(self):
        while True:
            print("\n--- Main Menu ---")
            print("1. Move")
            print("2. Check for enemies")
            print("3. Rest at bonfire")
            print("4. Show stats")
            print("5. Show inventory")
            print("6. Quit")
            choice = input("Enter your choice (1-6): ")
            
            if choice == '1':
                self.describe_location()
                direction = input("Enter the number of the location you want to move to, or 'random': ")
                self.move(direction)
            elif choice == '2':
                enemies = self.check_for_enemies()
                if enemies:
                    enemy_choice = input("Enter the number of the enemy you want to battle, or 'run': ")
                    if enemy_choice.lower() == 'run':
                        print("You run away from the enemies.")
                    elif enemy_choice.isdigit() and int(enemy_choice) < len(enemies):
                        if not self.battle(enemies[int(enemy_choice)]):
                            break
                    else:
                        print("Invalid choice. No battle initiated.")
            elif choice == '3':
                self.rest_at_bonfire()
            elif choice == '4':
                self.show_stats()
            elif choice == '5':
                self.show_inventory()
            elif choice == '6':
                print("Thanks for playing!")
                break
            else:
                print("Invalid choice. Try again.")

if __name__ == "__main__":
    game = DarkSoulsGame()
    print("Welcome to the Dark Souls Text Adventure!")
    while True:
        choice = input("Do you want to create a new character (n) or load an existing one (l)? ").lower()
        if choice == 'n':
            name = input("Enter your character's name: ")
            class_name = input("Enter your character's class: ")
            game.create_character(name, class_name)
            break
        elif choice == 'l':
            game.player = int(input("Enter your character's ID: "))
            game.load_character()
            break
        else:
            print("Invalid choice. Try again.")
    
    game.main_loop()
    game.conn.close()
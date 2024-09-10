-- Tabela Personagem
CREATE TABLE Personagem (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    hp_total INT NOT NULL,
    stamina_total INT NOT NULL,
    poise_resistance INT NOT NULL
);

-- Tabela Region
CREATE TABLE Region (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    description TEXT
);

-- Tabela RegionGraphNode
CREATE TABLE RegionGraphNode (
    position INTEGER PRIMARY KEY, 
    region_description TEXT,
    region_id INT REFERENCES Region(id) ON DELETE CASCADE
);

-- Tabela Class
CREATE TABLE Class (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    base_level INT,
    base_vit INT,
    base_dex INT,
    base_att INT,
    base_end INT,
    base_str INT,
    base_int INT,
    base_fai INT
);

-- Tabela Item
CREATE TABLE Item (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    equip BOOLEAN,
    tipo VARCHAR(50) NOT NULL,
    soul_valor INT,
    can_sell BOOLEAN
);

-- Tabela Inventory
CREATE TABLE Inventory (
    id SERIAL PRIMARY KEY,
    personagem_id INT REFERENCES Personagem(id) ON DELETE CASCADE
);

-- Tabela InventoryItem
CREATE TABLE InventoryItem (
    id SERIAL PRIMARY KEY,
    inventory_id INT REFERENCES Inventory(id) ON DELETE CASCADE,
    item_instance_id INT,
    item_tipo VARCHAR(50),
    quantity INT,
    UNIQUE (inventory_id, item_instance_id, item_tipo)
);

-- Tabela Bonfire
CREATE TABLE Bonfire (
    id SERIAL PRIMARY KEY,
    kindle_level INT NOT NULL,
    bonfire_active BOOLEAN NOT NULL,
    warp_ok BOOLEAN NOT NULL,
    bonfire_reset_status BOOLEAN NOT NULL,
    region_graph_node_position INT,
    FOREIGN KEY (region_graph_node_position) REFERENCES RegionGraphNode(position) ON DELETE SET NULL
);

-- Tabela PC
CREATE TABLE PC (
    id SERIAL PRIMARY KEY,
    personagem_id INT REFERENCES Personagem(id) ON DELETE CASCADE,
    class_id INT REFERENCES Class(id),
    gift VARCHAR(50),
    vitality INT,
    attunement INT,
    endurance INT,
    strength INT,
    dexterity INT,
    intelligence INT,
    faith INT,
    humanity INT,
    equip_load INT,
    attunement_slot INT,
    position INT REFERENCES RegionGraphNode(position),
    pc_level INT,
    hp_atual INT,
    stamina_atual INT
);

-- Tabela NPC
CREATE TABLE NPC (
    id SERIAL PRIMARY KEY,
    personagem_id INT REFERENCES Personagem(id) ON DELETE CASCADE,
    weakness VARCHAR(100),
    resistance VARCHAR(100),
    tipo VARCHAR(50) NOT NULL,
    hp INT NOT NULL,
    respawn BOOLEAN,
    position INT REFERENCES RegionGraphNode(position),
    hp_atual INT,
    stamina_atual INT
);

-- Tabela Chest
CREATE TABLE Chest (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    personagem_id INT REFERENCES Personagem(id) ON DELETE CASCADE,
    position INT REFERENCES RegionGraphNode(position)
);

-- Tabela RegionGraphEdge
CREATE TABLE RegionGraphEdge (
    edge SERIAL PRIMARY KEY,
    origin_node INT REFERENCES RegionGraphNode(position) ON DELETE CASCADE,
    destination_node INT REFERENCES RegionGraphNode(position) ON DELETE CASCADE
);

-- Tabelas específicas de Item
CREATE TABLE Armor (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    equipped BOOLEAN,
    tipo VARCHAR(50) NOT NULL,
    defense_valor INT,
    defense_tipo VARCHAR(50),
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE Weapon (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    damage INT,
    attack_recovery INT,
    poise INT,
    stamina_cost INT,
    attack_tipo VARCHAR(50),
    attack_speed INT,
    weapon_tipo VARCHAR(50),
    scaling VARCHAR(50),
    upgrade_level INT,
    upgrade_status VARCHAR(50),
    equipped BOOLEAN,
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE Consumable (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    effect VARCHAR(100),
    duration INT,
    valor INT,
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE Ore (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    upgrade VARCHAR(50),
    tipo VARCHAR(50),
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE Magic (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    tipo VARCHAR(50) NOT NULL,
    stamina_cost INT,
    quantity INT,
    equipped BOOLEAN,
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE MagicEffect (
    id SERIAL PRIMARY KEY,
    magic_id INT REFERENCES Magic(id) ON DELETE CASCADE,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE AttributeEffect (
    id SERIAL PRIMARY KEY,
    magic_effect_id INT REFERENCES MagicEffect(id) ON DELETE CASCADE,
    nome VARCHAR(100) NOT NULL,
    valor INT,
    duration INT
);

CREATE TABLE Ring (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    is_broken BOOLEAN,
    equipped BOOLEAN,
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE RingEffect (
    id SERIAL PRIMARY KEY,
    ring_id INT REFERENCES Ring(id) ON DELETE CASCADE,
    attribute VARCHAR(100),
    valor INT
);

CREATE TABLE Ember (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    blacksmith VARCHAR(100),
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE Projectile (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    tipo VARCHAR(50) NOT NULL,
    damage INT,
    effect VARCHAR(100),
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE KeyItem (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    is_used BOOLEAN,
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE KeyBonfireItem (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    active BOOLEAN,
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE Soul (
    id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    inventory_item_id INT REFERENCES InventoryItem(id)
);

CREATE TABLE SoulBoss (
    id SERIAL PRIMARY KEY,
    soul_id INT REFERENCES Soul(id) ON DELETE CASCADE,
    boss VARCHAR(100)
);

-- Tabela EquipmentRequirement
CREATE TABLE EquipmentRequirement (
    item_id INT REFERENCES Item(id) ON DELETE CASCADE,
    min_value INT,
    stat_tipo VARCHAR(50),
    PRIMARY KEY (item_id, stat_tipo)
);

-- Tabela Quest
CREATE TABLE Quest (
    id SERIAL PRIMARY KEY,
    personagem_id INT REFERENCES Personagem(id) ON DELETE CASCADE,
    nome VARCHAR(100) NOT NULL
);

-- Tabela QuestInstance
CREATE TABLE QuestInstance (
    id SERIAL PRIMARY KEY,
    personagem_id INT REFERENCES Personagem(id) ON DELETE CASCADE,
    quest_id INT REFERENCES Quest(id) ON DELETE CASCADE,
    quest_state VARCHAR(50),
    count INT,
    dialogue TEXT
);

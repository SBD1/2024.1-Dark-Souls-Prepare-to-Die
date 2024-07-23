# Entidades e Relacionamentos

## Entidades e Atributos

### Creature

- **Atributos**:
  - id (PK)
  - creature_name
  - creature_type
  - creature_hp
  - creature_stamina
  - creature_level
  - poise_resistance

### PC

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - class
  - gift
  - pc_vitality
  - pc_attunement
  - pc_endurance
  - pc_strength
  - pc_dexterity
  - pc_intelligence
  - pc_faith
  - pc_humanity
  - pc_equip_load
  - pc_attunement_slot

### NPC

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - npc_weakness
  - npc_resistance
  - npc_type
  - npc_hp
  - respawn

### Region

- **Atributos**:
  - id (PK)
  - region_name
  - region_description

### RegionCoordinate

- **Atributos**:
  - id (PK)
  - region_x
  - region_y
  - region_description
  - region_id (FK)

### RegionLink

- **Atributos**:
  - id (PK)
  - id_origin (FK)
  - id_destination (FK)
  - link_type

### Item

- **Atributos**:
  - id (PK)
  - item_name
  - equip
  - type

### UpgradeType

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - upgrade_type_name

### Armor

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - equipped
  - armor_type
  - armor_defense

### Weapon

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - weapon_damage
  - recovery
  - weapon_poise
  - stamina_cost
  - attack_type
  - attack_speed
  - weapon_type
  - scaling
  - upgrade_level
  - upgrade_status
  - equipped

### Magic

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - magic_type
  - stamina_cost
  - quantity
  - equipped

### Magic_Effect

- **Atributos**:
  - id (PK)
  - id_magic (FK)
  - effect_type

### AttributeEffect

- **Atributos**:
  - id (PK)
  - id_magic_effect (FK)
  - attribute
  - value
  - duration

### Consumable

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - consumable_effect
  - duration
  - value

### Ore

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - ore_upgrade
  - ore_type

### Ring

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - is_broken

### Ring_Effect

- **Atributos**:
  - id (PK)
  - id_ring (FK)
  - attribute
  - value

### Ember

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - blacksmith

### Projectile

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - projectile_type
  - projectile_damage
  - projectile_effect

### KeyItem

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - is_used

### KeyBonfireItem

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - active

### Inventory

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - id_item (FK)
  - quantity

### Class

- **Atributos**:
  - id (PK)
  - class_name
  - base_level
  - base_vit
  - base_dex
  - base_att
  - base_end
  - base_str
  - base_int
  - base_fai

### EquipmentRequirement

- **Atributos**:
  - id_item (PK, FK)
  - min_value
  - stat_type

### Quest

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - quest_name

### QuestInstance

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - id_quest (FK)
  - state
  - count
  - dialogue

## Relacionamentos

- **PC e Creature**: Um para Um (Cada PC é um Creature).
- **NPC e Creature**: Um para Um (Cada NPC é um Creature).
- **Region e RegionCoordinate**: Um para Muitos (Cada região pode ter múltiplas coordenadas).
- **RegionCoordinate e RegionLink**: Muitos para Muitos (Coordenadas podem estar ligadas a outras coordenadas).
- **Item e UpgradeType, Armor, Weapon, Magic, Consumable, Ore, Ring, Ember, Projectile, KeyItem, KeyBonfireItem**: Um para Um (Cada item pode ser um UpgradeType, Armor, Weapon, Magic, etc.).
- **Magic e Magic_Effect**: Um para Muitos (Cada magia pode ter múltiplos efeitos).
- **Magic_Effect e AttributeEffect**: Um para Muitos (Cada efeito mágico pode ter múltiplos efeitos de atributo).
- **Inventory e Creature, Item**: Muitos para Muitos (Cada criatura pode ter múltiplos itens e cada item pode estar em múltiplas criaturas).
- **Class e PC**: Um para Muitos (Cada classe pode ter múltiplos PCs).
- **Quest e Creature**: Muitos para Muitos (Cada criatura pode ter múltiplas quests e cada quest pode estar associada a múltiplas criaturas).
- **QuestInstance e Quest, Creature**: Muitos para Um (Cada instância de quest é associada a uma quest e a uma criatura).

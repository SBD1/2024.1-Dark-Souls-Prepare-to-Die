# Modelo Entidade-Relacionamento (MER)

## Entidades e Atributos

## Personagem
- **id** (PK)
- nome
- tipo
- hp_total
- stamina_total
- poise_resistance

## PC
- **id** (PK)
- personagem_id (FK) - Referência a Personagem(id)
- class_id (FK) - Referência a Class(id)
- gift
- vitality
- attunement
- endurance
- strength
- dexterity
- intelligence
- faith
- humanity
- equip_load
- attunement_slot
- position (FK) - Referência a RegionGraphNode(position)
- pc_level
- hp_atual
- stamina_atual

## NPC
- **id** (PK)
- personagem_id (FK) - Referência a Personagem(id)
- weakness
- resistance
- tipo
- hp
- respawn
- position (FK) - Referência a RegionGraphNode(position)
- hp_atual
- stamina_atual

## Chest
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- personagem_id (FK) - Referência a Personagem(id)
- position (FK) - Referência a RegionGraphNode(position)

## Region
- **id** (PK)
- nome
- description

## RegionGraphNode
- **position** (PK)
- region_description
- region_id (FK) - Referência a Region(id)

## RegionGraphEdge
- **edge** (PK)
- origin_node (FK) - Referência a RegionGraphNode(position)
- destination_node (FK) - Referência a RegionGraphNode(position)

## Item
- **id** (PK)
- nome
- equip
- tipo
- soul_valor
- can_sell

## Armor
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- equipped
- tipo
- defense_valor
- defense_tipo
- inventory_item_id (FK) - Referência a InventoryItem(id)

## Weapon
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- damage
- attack_recovery
- poise
- stamina_cost
- attack_tipo
- attack_speed
- weapon_tipo
- scaling
- upgrade_level
- upgrade_status
- equipped
- inventory_item_id (FK) - Referência a InventoryItem(id)

## Consumable
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- effect
- duration
- valor
- inventory_item_id (FK) - Referência a InventoryItem(id)

## Ore
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- upgrade
- tipo
- inventory_item_id (FK) - Referência a InventoryItem(id)

## Magic
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- tipo
- stamina_cost
- quantity
- equipped
- inventory_item_id (FK) - Referência a InventoryItem(id)

## MagicEffect
- **id** (PK)
- magic_id (FK) - Referência a Magic(id)
- tipo

## AttributeEffect
- **id** (PK)
- magic_effect_id (FK) - Referência a MagicEffect(id)
- nome
- valor
- duration

## Ring
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- is_broken
- equipped
- inventory_item_id (FK) - Referência a InventoryItem(id)

## RingEffect
- **id** (PK)
- ring_id (FK) - Referência a Ring(id)
- attribute
- valor

## Ember
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- blacksmith
- inventory_item_id (FK) - Referência a InventoryItem(id)

## Projectile
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- tipo
- damage
- effect
- inventory_item_id (FK) - Referência a InventoryItem(id)

## KeyItem
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- is_used
- inventory_item_id (FK) - Referência a InventoryItem(id)

## KeyBonfireItem
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- active
- inventory_item_id (FK) - Referência a InventoryItem(id)

## Soul
- **id** (PK)
- item_id (FK) - Referência a Item(id)
- inventory_item_id (FK) - Referência a InventoryItem(id)

## SoulBoss
- **id** (PK)
- soul_id (FK) - Referência a Soul(id)
- boss

## InventoryItem
- **id** (PK)
- inventory_id (FK) - Referência a Inventory(id)
- item_instance_id
- item_tipo
- quantity
- UNIQUE (inventory_id, item_instance_id, item_tipo)

## Inventory
- **id** (PK)
- personagem_id (FK) - Referência a Personagem(id)

## Class
- **id** (PK)
- nome
- base_level
- base_vit
- base_dex
- base_att
- base_end
- base_str
- base_int
- base_fai

## EquipmentRequirement
- item_id (FK) - Referência a Item(id)
- min_value
- stat_tipo
- PRIMARY KEY (item_id, stat_tipo)

## Quest
- **id** (PK)
- personagem_id (FK) - Referência a Personagem(id)
- nome

## QuestInstance
- **id** (PK)
- personagem_id (FK) - Referência a Personagem(id)
- quest_id (FK) - Referência a Quest(id)
- quest_state
- count
- dialogue

## Bonfire
- **id** (PK)
- kindle_level
- bonfire_active
- warp_ok
- bonfire_reset_status
- region_graph_node_position (FK) - Referência a RegionGraphNode(position)

# Modelo Entidade-Relacionamento (MER)

## Relacionamentos

- **Personagem**
  - **1:N** com **PC** (`Personagem.id` → `PC.personagem_id`)
  - **1:N** com **NPC** (`Personagem.id` → `NPC.personagem_id`)
  - **1:N** com **Chest** (`Personagem.id` → `Chest.personagem_id`)
  - **1:N** com **Quest** (`Personagem.id` → `Quest.personagem_id`)
  - **1:N** com **QuestInstance** (`Personagem.id` → `QuestInstance.personagem_id`)
  - **1:N** com **Inventory** (`Personagem.id` → `Inventory.personagem_id`)

- **PC**
  - **N:1** com **Class** (`PC.class_id` → `Class.id`)
  - **N:1** com **RegionGraphNode** (`PC.position` → `RegionGraphNode.position`)

- **NPC**
  - **N:1** com **RegionGraphNode** (`NPC.position` → `RegionGraphNode.position`)

- **Chest**
  - **N:1** com **Item** (`Chest.item_id` → `Item.id`)
  - **N:1** com **RegionGraphNode** (`Chest.position` → `RegionGraphNode.position`)

- **RegionGraphNode**
  - **1:N** com **RegionGraphEdge** (`RegionGraphNode.position` → `RegionGraphEdge.origin_node`)
  - **1:N** com **RegionGraphEdge** (`RegionGraphNode.position` → `RegionGraphEdge.destination_node`)
  - **1:N** com **Bonfire** (`RegionGraphNode.position` → `Bonfire.region_graph_node_position`)

- **Item**
  - **1:N** com **Armor** (`Item.id` → `Armor.item_id`)
  - **1:N** com **Weapon** (`Item.id` → `Weapon.item_id`)
  - **1:N** com **Consumable** (`Item.id` → `Consumable.item_id`)
  - **1:N** com **Ore** (`Item.id` → `Ore.item_id`)
  - **1:N** com **Magic** (`Item.id` → `Magic.item_id`)
  - **1:N** com **Ring** (`Item.id` → `Ring.item_id`)
  - **1:N** com **Ember** (`Item.id` → `Ember.item_id`)
  - **1:N** com **Projectile** (`Item.id` → `Projectile.item_id`)
  - **1:N** com **KeyItem** (`Item.id` → `KeyItem.item_id`)
  - **1:N** com **KeyBonfireItem** (`Item.id` → `KeyBonfireItem.item_id`)
  - **1:N** com **Soul** (`Item.id` → `Soul.item_id`)

- **Magic**
  - **1:N** com **MagicEffect** (`Magic.id` → `MagicEffect.magic_id`)

- **MagicEffect**
  - **1:N** com **AttributeEffect** (`MagicEffect.id` → `AttributeEffect.magic_effect_id`)

- **Ring**
  - **1:N** com **RingEffect** (`Ring.id` → `RingEffect.ring_id`)

- **InventoryItem**
  - **N:1** com **Inventory** (`InventoryItem.inventory_id` → `Inventory.id`)
  - **N:1** com **Item** (`InventoryItem.item_instance_id` → `Item.id`)

- **Quest**
  - **N:1** com **Personagem** (`Quest.personagem_id` → `Personagem.id`)

- **QuestInstance**
  - **N:1** com **Quest** (`QuestInstance.quest_id` → `Quest.id`)
  - **N:1** com **Personagem** (`QuestInstance.personagem_id` → `Personagem.id`)

- **Bonfire**
  - **N:1** com **RegionGraphNode** (`Bonfire.region_graph_node_position` → `RegionGraphNode.position`)

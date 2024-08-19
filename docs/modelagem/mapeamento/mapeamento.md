# Mapeamento das Tabelas e Relacionamentos

## Personagem
- **id** (PK)
- nome
- tipo
- hp_total
- stamina_total
- poise_resistance

**Relacionamentos:**
- **1:N** com **PC** (`Personagem.id` → `PC.personagem_id`)
- **1:N** com **NPC** (`Personagem.id` → `NPC.personagem_id`)
- **1:N** com **Chest** (`Personagem.id` → `Chest.personagem_id`)
- **1:N** com **Quest** (`Personagem.id` → `Quest.personagem_id`)
- **1:N** com **QuestInstance** (`Personagem.id` → `QuestInstance.personagem_id`)
- **1:N** com **Inventory** (`Personagem.id` → `Inventory.personagem_id`)

## PC
- **id** (PK)
- personagem_id (FK) - Referência a `Personagem.id`
- class_id (FK) - Referência a `Class.id`
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
- position (FK) - Referência a `RegionGraphNode.position`
- pc_level
- hp_atual
- stamina_atual

**Relacionamentos:**
- **N:1** com **Class** (`PC.class_id` → `Class.id`)
- **N:1** com **RegionGraphNode** (`PC.position` → `RegionGraphNode.position`)

## NPC
- **id** (PK)
- personagem_id (FK) - Referência a `Personagem.id`
- weakness
- resistance
- tipo
- hp
- respawn
- position (FK) - Referência a `RegionGraphNode.position`
- hp_atual
- stamina_atual

**Relacionamentos:**
- **N:1** com **RegionGraphNode** (`NPC.position` → `RegionGraphNode.position`)

## Chest
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- personagem_id (FK) - Referência a `Personagem.id`
- position (FK) - Referência a `RegionGraphNode.position`

**Relacionamentos:**
- **N:1** com **Item** (`Chest.item_id` → `Item.id`)
- **N:1** com **RegionGraphNode** (`Chest.position` → `RegionGraphNode.position`)

## Region
- **id** (PK)
- nome
- description

**Relacionamentos:**
- **1:N** com **RegionGraphNode** (`Region.id` → `RegionGraphNode.region_id`)

## RegionGraphNode
- **position** (PK)
- region_description
- region_id (FK) - Referência a `Region.id`

**Relacionamentos:**
- **1:N** com **RegionGraphEdge** (origem `RegionGraphNode.position` → destino `RegionGraphEdge.origin_node`)
- **1:N** com **RegionGraphEdge** (origem `RegionGraphNode.position` → destino `RegionGraphEdge.destination_node`)
- **1:N** com **Bonfire** (`RegionGraphNode.position` → `Bonfire.region_graph_node_position`)

## RegionGraphEdge
- **edge** (PK)
- origin_node (FK) - Referência a `RegionGraphNode.position`
- destination_node (FK) - Referência a `RegionGraphNode.position`

**Relacionamentos:**
- **N:1** com **RegionGraphNode** (`RegionGraphEdge.origin_node` → `RegionGraphNode.position`)
- **N:1** com **RegionGraphNode** (`RegionGraphEdge.destination_node` → `RegionGraphNode.position`)

## Item
- **id** (PK)
- nome
- equip
- tipo
- soul_valor
- can_sell

**Relacionamentos:**
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

## Armor
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- equipped
- tipo
- defense_valor
- defense_tipo
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Armor.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Armor.inventory_item_id` → `InventoryItem.id`)

## Weapon
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
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
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Weapon.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Weapon.inventory_item_id` → `InventoryItem.id`)

## Consumable
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- effect
- duration
- valor
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Consumable.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Consumable.inventory_item_id` → `InventoryItem.id`)

## Ore
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- upgrade
- tipo
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Ore.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Ore.inventory_item_id` → `InventoryItem.id`)

## Magic
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- tipo
- stamina_cost
- quantity
- equipped
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Magic.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Magic.inventory_item_id` → `InventoryItem.id`)

## MagicEffect
- **id** (PK)
- magic_id (FK) - Referência a `Magic.id`
- tipo

**Relacionamentos:**
- **N:1** com **Magic** (`MagicEffect.magic_id` → `Magic.id`)

## AttributeEffect
- **id** (PK)
- magic_effect_id (FK) - Referência a `MagicEffect.id`
- nome
- valor
- duration

**Relacionamentos:**
- **N:1** com **MagicEffect** (`AttributeEffect.magic_effect_id` → `MagicEffect.id`)

## Ring
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- is_broken
- equipped
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Ring.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Ring.inventory_item_id` → `InventoryItem.id`)

## RingEffect
- **id** (PK)
- ring_id (FK) - Referência a `Ring.id`
- attribute
- valor

**Relacionamentos:**
- **N:1** com **Ring** (`RingEffect.ring_id` → `Ring.id`)

## Ember
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- blacksmith
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Ember.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Ember.inventory_item_id` → `InventoryItem.id`)

## Projectile
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- tipo
- damage
- effect
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Projectile.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Projectile.inventory_item_id` → `InventoryItem.id`)

## KeyItem
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- is_used
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`KeyItem.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`KeyItem.inventory_item_id` → `InventoryItem.id`)

## KeyBonfireItem
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- active
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`KeyBonfireItem.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`KeyBonfireItem.inventory_item_id` → `InventoryItem.id`)

## Soul
- **id** (PK)
- item_id (FK) - Referência a `Item.id`
- inventory_item_id (FK) - Referência a `InventoryItem.id`

**Relacionamentos:**
- **N:1** com **Item** (`Soul.item_id` → `Item.id`)
- **N:1** com **InventoryItem** (`Soul.inventory_item_id` → `InventoryItem.id`)

## SoulBoss
- **id** (PK)
- soul_id (FK) - Referência a `Soul.id`
- boss

**Relacionamentos:**
- **N:1** com **Soul** (`SoulBoss.soul_id` → `Soul.id`)

## InventoryItem
- **id** (PK)
- inventory_id (FK) - Referência a `Inventory.id`
- item_instance_id
- item_tipo
- quantity

**Relacionamentos:**
- **N:1** com **Inventory** (`InventoryItem.inventory_id` → `Inventory.id`)
- **N:1** com **Item** (`InventoryItem.item_instance_id` → `Item.id`)

## Inventory
- **id** (PK)
- personagem_id (FK) - Referência a `Personagem.id`

**Relacionamentos:**
- **1:N** com **InventoryItem** (`Inventory.id` → `InventoryItem.inventory_id`)

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
- **item_id** (FK) - Referência a `Item.id`
- min_value
- stat_tipo

**Relacionamentos:**
- **N:1** com **Item** (`EquipmentRequirement.item_id` → `Item.id`)

## Quest
- **id** (PK)
- personagem_id (FK) - Referência a `Personagem.id`
- nome

**Relacionamentos:**
- **N:1** com **Personagem** (`Quest.personagem_id` → `Personagem.id`)

## QuestInstance
- **id** (PK)
- personagem_id (FK) - Referência a `Personagem.id`
- quest_id (FK) - Referência a `Quest.id`
- quest_state
- count
- dialogue

**Relacionamentos:**
- **N:1** com **Quest** (`QuestInstance.quest_id` → `Quest.id`)
- **N:1** com **Personagem** (`QuestInstance.personagem_id` → `Personagem.id`)

## Bonfire
- **id** (PK)
- kindle_level
- bonfire_active
- warp_ok
- bonfire_reset_status
- region_graph_node_position (FK) - Referência a `RegionGraphNode.position`

**Relacionamentos:**
- **N:1** com **RegionGraphNode** (`Bonfire.region_graph_node_position` → `RegionGraphNode.position`)

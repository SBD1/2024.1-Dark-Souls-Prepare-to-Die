# Mapeamento de Entidades e Relacionamentos

## 1. Entidade: Creature

- **Atributos**:
  - id (PK)
  - creature_name
  - creature_type
  - creature_hp
  - creature_stamina
  - creature_level
  - poise_resistance

- **Relacionamentos**:
  - PC: 1 (Uma criatura pode ser um PC. Cada PC é uma instância de Creature.)
  - NPC: 1 (Uma criatura pode ser um NPC. Cada NPC é uma instância de Creature.)
  - Inventory: 1 (Uma criatura pode ter vários itens em seu inventário.)
  - Quest: 1 (Uma criatura pode estar associada a várias missões.)
  - QuestInstance: 1 (Uma criatura pode ter várias instâncias de missões.)

## 2. Entidade: PC

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

- **Relacionamentos**:
  - Creature: N:1 (Cada PC refere-se a uma criatura.)

## 3. Entidade: NPC

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - npc_weakness
  - npc_resistance
  - npc_type
  - npc_hp
  - respawn

- **Relacionamentos**:
  - Creature: N:1 (Cada NPC refere-se a uma criatura.)

## 4. Entidade: Region

- **Atributos**:
  - id (PK)
  - region_name
  - region_description

- **Relacionamentos**:
  - RegionCoordinate: 1 (Uma região pode ter várias coordenadas.)

## 5. Entidade: RegionCoordinate

- **Atributos**:
  - id (PK)
  - region_x
  - region_y
  - region_description
  - region_id (FK)

- **Relacionamentos**:
  - Region: N:1 (Cada coordenada refere-se a uma região.)
  - RegionLink: N (Coordenadas podem estar ligadas a outras coordenadas.)

## 6. Entidade: RegionLink

- **Atributos**:
  - id (PK)
  - id_origin (FK)
  - id_destination (FK)
  - link_type

- **Relacionamentos**:
  - RegionCoordinate: N:1 (Cada link refere-se a duas coordenadas, origem e destino.)

## 7. Entidade: Item

- **Atributos**:
  - id (PK)
  - item_name
  - equip
  - type

- **Relacionamentos**:
  - UpgradeType: 1 (Cada item pode ter múltiplos tipos de upgrade.)
  - Armor: 1:1 (Cada item pode ser uma armadura.)
  - Weapon: 1:1 (Cada item pode ser uma arma.)
  - Magic: 1:1 (Cada item pode ser uma magia.)
  - Consumable: 1:1 (Cada item pode ser um consumível.)
  - Ore: 1:1 (Cada item pode ser um minério.)
  - Ring: 1:1 (Cada item pode ser um anel.)
  - Ember: 1:1 (Cada item pode ser uma brasa.)
  - Projectile: 1:1 (Cada item pode ser um projétil.)
  - KeyItem: 1:1 (Cada item pode ser um item chave.)
  - KeyBonfireItem: 1:1 (Cada item pode ser um item chave de fogueira.)
  - Inventory: 1 (Cada item pode estar em múltiplos inventários.)

## 8. Entidade: UpgradeType

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - upgrade_type_name

- **Relacionamentos**:
  - Item: N:1 (Cada tipo de upgrade refere-se a um item.)

## 9. Entidade: Armor

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - equipped
  - armor_type
  - armor_defense

- **Relacionamentos**:
  - Item: N:1 (Cada armadura refere-se a um item.)

## 10. Entidade: Weapon

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

- **Relacionamentos**:
  - Item: N:1 (Cada arma refere-se a um item.)

## 11. Entidade: Magic

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - magic_type
  - stamina_cost
  - quantity
  - equipped

- **Relacionamentos**:
  - Item: N:1 (Cada magia refere-se a um item.)
  - Magic_Effect: 1 (Cada magia pode ter múltiplos efeitos mágicos.)

## 12. Entidade: Magic_Effect

- **Atributos**:
  - id (PK)
  - id_magic (FK)
  - effect_type

- **Relacionamentos**:
  - Magic: N:1 (Cada efeito mágico refere-se a uma magia.)
  - AttributeEffect: 1 (Cada efeito mágico pode ter múltiplos efeitos de atributos.)

## 13. Entidade: AttributeEffect

- **Atributos**:
  - id (PK)
  - id_magic_effect (FK)
  - attribute
  - value
  - duration

- **Relacionamentos**:
  - Magic_Effect: N:1 (Cada efeito de atributo refere-se a um efeito mágico.)

## 14. Entidade: Consumable

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - consumable_effect
  - duration
  - value

- **Relacionamentos**:
  - Item: N:1 (Cada consumível refere-se a um item.)

## 15. Entidade: Ore

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - ore_upgrade
  - ore_type

- **Relacionamentos**:
  - Item: N:1 (Cada minério refere-se a um item.)

## 16. Entidade: Ring

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - is_broken

- **Relacionamentos**:
  - Item: N:1 (Cada anel refere-se a um item.)
  - Ring_Effect: 1 (Cada anel pode ter múltiplos efeitos.)

## 17. Entidade: Ring_Effect

- **Atributos**:
  - id (PK)
  - id_ring (FK)
  - attribute
  - value

- **Relacionamentos**:
  - Ring: N:1 (Cada efeito de anel refere-se a um anel.)

## 18. Entidade: Ember

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - blacksmith

- **Relacionamentos**:
  - Item: N:1 (Cada brasa refere-se a um item.)

## 19. Entidade: Projectile

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - projectile_type
  - projectile_damage
  - projectile_effect

- **Relacionamentos**:
  - Item: N:1 (Cada projétil refere-se a um item.)

## 20. Entidade: KeyItem

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - is_used

- **Relacionamentos**:
  - Item: N:1 (Cada item chave refere-se a um item.)

## 21. Entidade: KeyBonfireItem

- **Atributos**:
  - id (PK)
  - id_item (FK)
  - active

- **Relacionamentos**:
  - Item: N:1 (Cada item chave de fogueira refere-se a um item.)

## 22. Entidade: Inventory

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - id_item (FK)
  - quantity

- **Relacionamentos**:
  - Creature: N:1 (Cada inventário refere-se a uma criatura.)
  - Item: N:1 (Cada inventário refere-se a um item.)

## 23. Entidade: Class

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

- **Relacionamentos**:
  - PC: 1 (Cada classe pode ter múltiplos PCs.)

## 24. Entidade: EquipmentRequirement

- **Atributos**:
  - id_item (PK, FK)
  - min_value
  - stat_type

- **Relacionamentos**:
  - Item: N:1 (Cada requisito de equipamento refere-se a um item.)

## 25. Entidade: Quest

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - quest_name

- **Relacionamentos**:
  - Creature: N:1 (Cada missão refere-se a uma criatura.)

## 26. Entidade: QuestInstance

- **Atributos**:
  - id (PK)
  - id_creature (FK)
  - id_quest (FK)
  - state
  - count
  - dialogue

- **Relacionamentos**:
  - Creature: N:1 (Cada instância de missão refere-se a uma criatura.)
  - Quest: N:1 (Cada instância de missão refere-se a uma missão.)

Entidades 

Personagem = id(pk), nome, tipo, hp, stamina, poise_resistance
    PC = id(pk), personagem_id(fk), class_id(fk), gift, vitality, attunement, endurance, strenght, dexterity,intelligence,faith,humanity,equip_load, attunement_slot, position(fk),pc_level
    NPC = id(pk), personagem_id(fk), weakness, resistance, tipo, hp, respawn, position(fk)
	Chest = id(pk), item_id(fk), personagem_id(fk), position(fk)
Region = id(pk), nome, description
RegionGraphNode = position(pk), region_description, region_id(fk)
RegionGraphEdge = edge(pk), origin_node(fk), destination_node(fk)
Item = id(pk), nome, equip, tipo, soul_valor, can_sell, 
	Armor = id(pk), item_id(fk), equipped, tipo, defense_valor, defense_tipo,inventory_item_id
	Weapon = id(pk), item_id(fk), damage, attack_recovery,poise,stamina_cost, attack_tipo, attack_speed, weapon_tipo, scaling, upgrade_level, upgrade_status, equipped, inventory_item_id
	Consumable = id(pk), item_id(fk), effect, duration, valor,inventory_item_id
	Ore = id(pk), item_id(fk), upgrade, tipo, inventory_item_id
	Magic = id(PK), item_id(fk), tipo, stamina_cost, quantity, equipped,inventory_item_id
		MagicEffect = id(pk), magic_id(fk), tipo
			AttributeEffect = id(pk), magic_effect_id(fk), nome, valor, duration
	Ring = id(pk), item_id(fk), is_broken, equipped,inventory_item_id
		RingEffect = id(pk), ring_id(fk), attribute, valor
	Ember = id(pk), item_id(fk), blacksmith,inventory_item_id
	Projectile = id(pk), item_id(fk), tipo, damage, effect,inventory_item_id
	KeyItem = id(pk), item_id(fk), is_used,inventory_item_id
	KeyBonfireItem = id(pk), item_id(fk), active,inventory_item_id
    Soul = id(pk), item_id(fk),inventory_item_id
        SoulBoss = id(pk), soul_id(fk), boss
InventoryItem = id(pk),inventory_id(fk), item_instance_id(fk), item_tipo, quantity,UNIQUE (inventory_id, item_instance_id, item_type)
Inventory = id(pk), personagem_id(fk)
Class = id(pk), nome, base_level, base_vit, base_dex, base_att, base_end,base_str,base_int, base_fai
EquipmentRequirement = item_id(pk,fk), min_value, stat_tipo
Quest = id(pk), personagem_id(fk),nome
QuestInstance = id(pk), personagem_id(fk), quest_id(fk), quest_state, count, dialogue



## Relacionamentos
Um Personagem pode referir-se a um ou vários NPC. Um NPC refere-se somente a um Personagem.
Um PC refere-se a somente um personagem e um personagem refere-se a somente um PC.
Um Chest refere-se a somente um personagem e um personagem pode referir-se a um ou vários Chests;
Um NPC,PC e Chest podem estar em somente um RegionGraphNode. Um RegionGraphNode pode ter vários personagens.
Uma Region pode ter um ou varios RegionGraphNode. Um RegionGraphNode pode estar em somente uma Region
Um RegionGraphNode pode possuir um ou varios RegionGraphEdge. Um RegionGraphEdge necessita de dois Node.
Um Item pode ter várias instâncias específicas, como Armor ou Weapon. Cada instância específica refere-se a um único Item.
Um Inventory pode conter várias instâncias de itens diferentes (ex: Armor, Weapon), mas cada instância de item pode estar em apenas um Inventory.
Cada instância específica de item (Armor, Weapon, etc.) pode estar em um inventário específico.
Magic pode ter um ou vários MagicEffect. Um MagicEffect pode referir-se a nenhum ou vários Magic.
Um MagicEffect pode ter um ou vários AttributeEffect. Um AttributeEffect pode referir-se a nenhum ou vários MagicEffect.
Um Ring pode ter um ou vários RingEffect. Um RingEffect pode referir-se a nenhum ou vários Ring.
Um Soul pode ter nenhum ou um SoulBoss. Um SoulBoss refere-se somente a um Soul.
Um Item pode estar em somente um Inventory. Um Inventory pode ter nenhum ou vários Item.
Um Inventory pode estar em somente um Personagem. Um personagem pode ter um ou mais Inventory.
Um PC tem somente um Class. Um Class pode estar atrelado a nenhum ou vários PC
Um Item pode ter nenhum ou vários EquipRequirement. Um EquipRequirement pode referir-se a nenhum ou vários Item.
Uma Quest pode referir-se a um ou vários Personagem. Um Personagem pode referir-se a nenhuma ou várias Quest.
Uma QuestInstance refere-se a somente uma Quest.Um Quest pode ter nenhuma ou várias QuestInstance.
Uma QuestInstance pode referir-se a um ou a varios Personagem.Um Personagem pode estar em nenhuma ou várias QuestInstance.
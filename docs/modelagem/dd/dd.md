# Dicionário de Dados

## Creature

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada criatura.            |
| creature_name          | VARCHAR(255)       | Nome da criatura.                                 |
| creature_type          | VARCHAR(50)        | Tipo da criatura.         |
| creature_hp            | INT                | Pontos de vida da criatura.                        |
| creature_stamina       | INT                | Estamina da criatura.                             |
| creature_level         | INT                | Nível da criatura.                                |
| poise_resistance       | FLOAT              | Resistência da criatura a quebra de postura.              |

## PC

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada personagem jogável. |
| id_creature            | INT                | Referência à tabela Creature.                     |
| class                  | VARCHAR(50)        | Classe do personagem (e.g., guerreiro, mago).     |
| gift                   | VARCHAR(50)        | Presente inicial do personagem.                   |
| pc_vitality            | INT                | Vitalidade do personagem.                         |
| pc_attunement          | INT                | Aptidão do personagem para magia.                 |
| pc_endurance           | INT                | Endurance do personagem.                          |
| pc_strength            | INT                | Força do personagem.                              |
| pc_dexterity           | INT                | Destreza do personagem.                           |
| pc_intelligence        | INT                | Inteligência do personagem.                       |
| pc_faith               | INT                | Fé do personagem.                                |
| pc_humanity            | INT                | Humanidade do personagem.                         |
| pc_equip_load          | FLOAT              | Carga de equipamento do personagem.               |
| pc_attunement_slot     | INT                | Número de slots para atunes do personagem.        |

## NPC

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada NPC.                |
| id_creature            | INT                | Referência à tabela Creature.                     |
| npc_weakness           | VARCHAR(50)        | Fraqueza do NPC.                                  |
| npc_resistance         | VARCHAR(50)        | Resistência do NPC.                               |
| npc_type               | VARCHAR(50)        | Tipo de NPC.                                      |
| npc_hp                 | INT                | Pontos de vida do NPC.                            |
| respawn                | BOOLEAN            | Indica se o NPC respawn (volta a aparecer).       |

## Region

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada região.             |
| region_name            | VARCHAR(255)       | Nome da região.                                   |
| region_description     | TEXT               | Descrição detalhada da região.                    |

## RegionCoordinate

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada coordenada da região.|
| region_x               | INT                | Coordenada X da região.                           |
| region_y               | INT                | Coordenada Y da região.                           |
| region_description     | TEXT               | Descrição da coordenada da região.                |
| region_id              | INT                | Referência à tabela Region.                       |

## RegionLink

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada link de região.     |
| id_origin              | INT                | Coordenada de origem (referência à RegionCoordinate). |
| id_destination         | INT                | Coordenada de destino (referência à RegionCoordinate). |
| link_type              | VARCHAR(50)        | Tipo de link entre as coordenadas.                |

## Item

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada item.               |
| item_name              | VARCHAR(255)       | Nome do item.                                     |
| equip                  | BOOLEAN            | Indica se o item pode ser equipado.               |
| type                   | VARCHAR(50)        | Tipo do item (e.g., arma, armadura).              |

## UpgradeType

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada tipo de upgrade.    |
| id_item                | INT                | Referência à tabela Item.                         |
| upgrade_type_name      | VARCHAR(50)        | Nome do tipo de upgrade.                          |

## Armor

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada armadura.           |
| id_item                | INT                | Referência à tabela Item.                         |
| equipped               | BOOLEAN            | Indica se a armadura está equipada.               |
| armor_type             | VARCHAR(50)        | Tipo de armadura (e.g., elmo, peitoral).      |
| armor_defense          | FLOAT              | Defesa da armadura.                               |

## Weapon

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada arma.               |
| id_item                | INT                | Referência à tabela Item.                         |
| weapon_damage          | FLOAT              | Dano da arma.                                     |
| recovery               | FLOAT              | Tempo de recuperação da arma.                     |
| weapon_poise           | FLOAT              | Dano em postura da arma.                                    |
| stamina_cost           | FLOAT              | Custo de estamina para usar a arma.               |
| attack_type            | VARCHAR(50)        | Tipo de ataque da arma.                           |
| attack_speed           | FLOAT              | Velocidade do ataque da arma.                     |
| weapon_type            | VARCHAR(50)        | Tipo da arma (e.g., espada, machado).             |
| scaling                | VARCHAR(50)        | Escalamento da arma (e.g., força, destreza).      |
| upgrade_level          | INT                | Nível de upgrade da arma.                         |
| upgrade_status         | VARCHAR(50)        | Status do upgrade da arma.                        |
| equipped               | BOOLEAN            | Indica se a arma está equipada.                  |

## Magic

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada magia.              |
| id_item                | INT                | Referência à tabela Item.                         |
| magic_type             | VARCHAR(50)        | Tipo de magia.                                    |
| stamina_cost           | FLOAT              | Custo de estamina para usar a magia.              |
| quantity               | INT                | Quantidade de magia disponível.                  |
| equipped               | BOOLEAN            | Indica se a magia está equipada.                 |

## Magic_Effect

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada efeito mágico.      |
| id_magic               | INT                | Referência à tabela Magic.                        |
| effect_type            | VARCHAR(50)        | Tipo de efeito mágico.                            |

## AttributeEffect

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada efeito de atributo. |
| id_magic_effect        | INT                | Referência à tabela Magic_Effect.                 |
| attribute              | VARCHAR(50)        | Atributo afetado (e.g., força, inteligência).      |
| value                  | FLOAT              | Valor do efeito no atributo.                      |
| duration               | INT                | Duração do efeito em segundos.                    |

## Consumable

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada consumível.         |
| id_item                | INT                | Referência à tabela Item.                         |
| consumable_effect      | VARCHAR(255)       | Efeito do consumível.                             |
| duration               | INT                | Duração do efeito do consumível.                  |
| value                  | FLOAT              | Valor do efeito do consumível.                    |

## Ore

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada minério.            |
| id_item                | INT                | Referência à tabela Item.                         |
| ore_upgrade            | VARCHAR(50)        | Tipo de upgrade de minério.                       |
| ore_type               | VARCHAR(50)        | Tipo de minério.                                  |

## Ring

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada anel.               |
| id_item                | INT                | Referência à tabela Item.                         |
| is_broken              | BOOLEAN            | Indica se o anel está quebrado.                   |

## Ring_Effect

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada efeito de anel.     |
| id_ring                | INT                | Referência à tabela Ring.                         |
| attribute              | VARCHAR(50)        | Atributo afetado pelo anel.                        |
| value                  | FLOAT              | Valor do efeito no atributo.                      |

## Ember

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada brasa.              |
| id_item                | INT                | Referência à tabela Item.                         |
| blacksmith             | VARCHAR(50)        | Ferreiro associado à brasa.                       |

## Projectile

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada projétil.           |
| id_item                | INT                | Referência à tabela Item.                         |
| projectile_type        | VARCHAR(50)        | Tipo de projétil (e.g., flecha, boma).            |
| projectile_damage      | FLOAT              | Dano do projétil.                                 |
| projectile_effect      | VARCHAR(255)       | Efeito do projétil.                               |

## KeyItem

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada item chave.         |
| id_item                | INT                | Referência à tabela Item.                         |
| is_used                | BOOLEAN            | Indica se o item chave foi usado.                 |

## KeyBonfireItem

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada item chave de fogueira. |
| id_item                | INT                | Referência à tabela Item.                         |
| active                 | BOOLEAN            | Indica se o item chave de fogueira está ativo.    |

## Inventory

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada item no inventário.  |
| id_creature            | INT                | Referência à tabela Creature.                     |
| id_item                | INT                | Referência à tabela Item.                         |
| quantity               | INT                | Quantidade do item no inventário.                 |

## Class

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada classe.             |
| class_name             | VARCHAR(50)        | Nome da classe.                                  |
| base_level             | INT                | Nível base da classe.                             |
| base_vit               | INT                | Vitalidade base da classe.                        |
| base_dex               | INT                | Destreza base da classe.                          |
| base_att               | INT                | Aptidão base da classe.                           |
| base_end               | INT                | Endurance base da classe.                         |
| base_str               | INT                | Força base da classe.                             |
| base_int               | INT                | Inteligência base da classe.                      |
| base_fai               | INT                | Fé base da classe.                               |

## EquipmentRequirement

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id_item                | INT                | Referência à tabela Item.                         |
| min_value              | INT                | Valor mínimo necessário para o equipamento.      |
| stat_type              | VARCHAR(50)        | Tipo de atributo necessário (e.g., força, destreza). |

## Quest

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada missão.             |
| id_creature            | INT                | Referência à tabela Creature.                     |
| quest_name             | VARCHAR(255)       | Nome da missão.                                   |

## QuestInstance

| **Campo**              | **Tipo**           | **Descrição**                                      |
|------------------------|--------------------|----------------------------------------------------|
| id                     | INT                | Identificador único para cada instância de missão.|
| id_creature            | INT                | Referência à tabela Creature.                     |
| id_quest               | INT                | Referência à tabela Quest.                        |
| state                  | VARCHAR(50)        | Estado da missão (e.g., completada, em andamento).|
| count                  | INT                | Contagem de progresso da missão.                  |
| dialogue               | TEXT               | Diálogo associado à missão.                       |

# Dicionário de Dados

## Tabela: Personagem

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do personagem                        |
| nome              | VARCHAR   | NOT NULL, até 100 caracteres   | Nome do personagem                                       |
| tipo              | VARCHAR   | NOT NULL, até 50 caracteres    | Tipo do personagem (e.g., PC, NPC)                       |
| hp_total          | INT       | NOT NULL                      | Vida total do personagem                                 |
| stamina_total     | INT       | NOT NULL                      | Stamina total do personagem                              |
| poise_resistance  | INT       | NOT NULL                      | Resistência ao poise do personagem                       |

## Tabela: PC

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do PC                                |
| personagem_id     | INT       | FOREIGN KEY REFERENCES Personagem(id), NOT NULL, ON DELETE CASCADE | Referência ao personagem associado  |
| class_id          | INT       | FOREIGN KEY REFERENCES Class(id) | Referência à classe do PC                                |
| gift              | VARCHAR   | Até 50 caracteres             | Presente inicial do PC                                   |
| vitality          | INT       |                               | Atributo de vitalidade                                   |
| attunement        | INT       |                               | Atributo de ajuste de magias                             |
| endurance         | INT       |                               | Atributo de resistência                                  |
| strength          | INT       |                               | Atributo de força                                        |
| dexterity         | INT       |                               | Atributo de destreza                                     |
| intelligence      | INT       |                               | Atributo de inteligência                                 |
| faith             | INT       |                               | Atributo de fé                                           |
| humanity          | INT       |                               | Quantidade de humanidade                                 |
| equip_load        | INT       |                               | Carga de equipamento                                     |
| attunement_slot   | INT       |                               | Quantidade de slots de ajuste de magias                  |
| position          | INT       | FOREIGN KEY REFERENCES RegionGraphNode(position) | Referência à posição do PC no gráfico de regiões         |
| pc_level          | INT       |                               | Nível do PC                                              |
| hp_atual          | INT       |                               | Vida atual do PC                                         |
| stamina_atual     | INT       |                               | Stamina atual do PC                                      |

## Tabela: NPC

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do NPC                               |
| personagem_id     | INT       | FOREIGN KEY REFERENCES Personagem(id), NOT NULL, ON DELETE CASCADE | Referência ao personagem associado  |
| weakness          | VARCHAR   | Até 100 caracteres            | Fraquezas do NPC                                         |
| resistance        | VARCHAR   | Até 100 caracteres            | Resistências do NPC                                      |
| tipo              | VARCHAR   | NOT NULL, até 50 caracteres    | Tipo do NPC (e.g., inimigo, aliado)                      |
| hp                | INT       | NOT NULL                      | Vida total do NPC                                        |
| respawn           | BOOLEAN   |                               | Indicador de respawn do NPC                              |
| position          | INT       | FOREIGN KEY REFERENCES RegionGraphNode(position) | Referência à posição do NPC no gráfico de regiões        |
| hp_atual          | INT       |                               | Vida atual do NPC                                        |
| stamina_atual     | INT       |                               | Stamina atual do NPC                                     |

## Tabela: Chest

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do baú                               |
| item_id           | INT       | FOREIGN KEY REFERENCES Item(id), NOT NULL, ON DELETE CASCADE | Referência ao item contido no baú                        |
| personagem_id     | INT       | FOREIGN KEY REFERENCES Personagem(id), NOT NULL, ON DELETE CASCADE | Referência ao personagem associado  |
| position          | INT       | FOREIGN KEY REFERENCES RegionGraphNode(position) | Referência à posição do baú no gráfico de regiões        |

## Tabela: Region

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único da região                            |
| nome              | VARCHAR   | NOT NULL, até 100 caracteres   | Nome da região                                           |
| description       | TEXT      |                               | Descrição da região                                      |

## Tabela: RegionGraphNode

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| position          | SERIAL    | PRIMARY KEY                   | Identificador único da posição no gráfico de regiões     |
| region_description| TEXT      |                               | Descrição da região associada                            |
| region_id         | INT       | FOREIGN KEY REFERENCES Region(id), ON DELETE CASCADE | Referência à região associada                            |

## Tabela: RegionGraphEdge

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| edge              | SERIAL    | PRIMARY KEY                   | Identificador único da aresta no gráfico de regiões      |
| origin_node       | INT       | FOREIGN KEY REFERENCES RegionGraphNode(position), ON DELETE CASCADE | Referência ao nó de origem  |
| destination_node  | INT       | FOREIGN KEY REFERENCES RegionGraphNode(position), ON DELETE CASCADE | Referência ao nó de destino  |

## Tabela: Item

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do item                              |
| nome              | VARCHAR   | NOT NULL, até 100 caracteres   | Nome do item                                             |
| equip             | BOOLEAN   |                               | Indica se o item pode ser equipado                       |
| tipo              | VARCHAR   | NOT NULL, até 50 caracteres    | Tipo do item (e.g., arma, armadura, consumível)          |
| soul_valor        | INT       |                               | Valor em almas do item                                   |
| can_sell          | BOOLEAN   |                               | Indica se o item pode ser vendido                        |

## Tabelas específicas de Item

### Tabela: Armor

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único da armadura                          |
| item_id           | INT       | FOREIGN KEY REFERENCES Item(id), NOT NULL, ON DELETE CASCADE | Referência ao item associado                             |
| equipped          | BOOLEAN   |                               | Indica se a armadura está equipada                       |
| tipo              | VARCHAR   | NOT NULL, até 50 caracteres    | Tipo da armadura (e.g., leve, média, pesada)             |
| defense_valor     | INT       |                               | Valor de defesa da armadura                              |
| defense_tipo      | VARCHAR   | Até 50 caracteres             | Tipo de defesa da armadura (e.g., física, mágica)        |
| inventory_item_id | INT       | FOREIGN KEY REFERENCES InventoryItem(id) | Referência ao item de inventário associado  |

### Tabela: Weapon

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único da arma                              |
| item_id           | INT       | FOREIGN KEY REFERENCES Item(id), NOT NULL, ON DELETE CASCADE | Referência ao item associado                             |
| damage            | INT       |                               | Dano causado pela arma                                   |
| attack_recovery   | INT       |                               | Tempo de recuperação do ataque                           |
| poise             | INT       |                               | Poise da arma                                            |
| stamina_cost      | INT       |                               | Custo de stamina por ataque                              |
| attack_tipo       | VARCHAR   | Até 50 caracteres             | Tipo de ataque (e.g., corte, perfuração)                 |
| attack_speed      | INT       |                               | Velocidade do ataque                                     |
| weapon_tipo       | VARCHAR   | Até 50 caracteres             | Tipo de arma (e.g., espada, machado)                     |
| scaling           | VARCHAR   | Até 50 caracteres             | Escalonamento do dano com atributos                      |
| upgrade_level     | INT       |                               | Nível de upgrade da arma                                 |
| upgrade_status    | VARCHAR   | Até 50 caracteres             | Status de upgrade da arma                                |
| equipped          | BOOLEAN   |                               | Indica se a arma está equipada                           |
| inventory_item_id | INT       | FOREIGN KEY REFERENCES InventoryItem(id) | Referência ao item de inventário associado  |

### Tabela: Consumable

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do consumível                        |
| item_id           | INT       | FOREIGN KEY REFERENCES Item(id), NOT NULL, ON DELETE CASCADE | Referência ao item associado                             |
| equipped          | BOOLEAN   |                               | Indica se o consumível está equipado                     |
| efeito            | VARCHAR   | Até 100 caracteres            | Efeito do consumível                                     |
| qtd               | INT       | NOT NULL                      | Quantidade do consumível                                 |
| inventory_item_id | INT       | FOREIGN KEY REFERENCES InventoryItem(id) | Referência ao item de inventário associado  |

## Tabela: Inventory

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do inventário                        |
| nome              | VARCHAR   | NOT NULL, até 100 caracteres   | Nome do inventário                                       |

## Tabela: InventoryItem

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único do item de inventário                |
| inventory_id      | INT       | FOREIGN KEY REFERENCES Inventory(id), NOT NULL, ON DELETE CASCADE | Referência ao inventário associado                       |
| item_id           | INT       | FOREIGN KEY REFERENCES Item(id), NOT NULL, ON DELETE CASCADE | Referência ao item associado                             |
| equipped          | BOOLEAN   |                               | Indica se o item está equipado                           |
| qtd               | INT       | NOT NULL                      | Quantidade do item no inventário                         |

## Tabela: Bonfire

| Campo (Atributo)  | Tipo      | Restrição                     | Descrição                                               |
|-------------------|-----------|-------------------------------|---------------------------------------------------------|
| id                | SERIAL    | PRIMARY KEY                   | Identificador único da fogueira                          |
| kindle_level      | INT       |                               | Nível de acendimento da fogueira                         |
| bonfire_active    | BOOLEAN   |                               | Indica se a fogueira está ativa                          |
| warp_ok           | BOOLEAN   |                               | Indica se é possível usar warp para essa fogueira        |
| bonfire_reset_status | BOOLEAN |                               | Indica se a fogueira foi reiniciada                      |
| regiongraphnode_position | INT | FOREIGN KEY REFERENCES RegionGraphNode(position) | Referência à posição da fogueira no gráfico de regiões |

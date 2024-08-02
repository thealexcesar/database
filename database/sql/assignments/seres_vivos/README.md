# Exercício Avaliativo - Banco de Dados - Catálogo de Seres Vivos

## Modelagem
- [X] **Entidades**: Abstrair e criar tabelas para representar corretamente as necessidades que o exercício exige
- [X] **Atributos**: Incluir atributos detalhados como nome científico, nome comum, descrição, status de conservação, localização geográfica (geometry), data e hora de observações, tipo de interação ecológica, etc.
- [X] **Relacionamentos**: Estabelecer relações hierárquicas entre os níveis taxonômicos e relações complexas como ocorrência de espécies em habitats, doenças que acometem espécies e interações ecológicas.
- [X] **Tipos de Dados**: Utilizar tipos de dados adequados como geometry para localização geográfica, timestamp para data e hora.

## Funcionalidades
- [X] **Consultas**: Realizar consultas para obter informações sobre a distribuição geográfica de espécies, a riqueza de espécies em um habitat, as doenças que acometem uma espécie específica, entre outras.
- [X] **Triggers**: Implementar triggers para automatizar tarefas como atualizar o status de conservação de uma espécie quando a população diminui abaixo de um determinado limite, registrar o histórico de alterações nos dados e gerar alertas para espécies ameaçadas.
- [X] **Views**: Criar views para facilitar a visualização de dados complexos, como a lista de espécies endêmicas de um país ou a riqueza de espécies em um bioma.
- [X] **Funções**: Desenvolver funções personalizadas para realizar cálculos complexos, como a diversidade de espécies em uma área ou a distância entre dois pontos geográficos.

## Considerações
- [X] **Normalização**: Aplicar as regras de normalização para garantir a integridade dos dados.
- [ ] **Índices**: Criar índices adequados, incluindo índices espaciais, para otimizar as consultas.
- [X] **Constraints**: Utilizar constraints para garantir a consistência dos dados.
- [ ] **Documentação**: Gerar uma documentação completa do banco de dados, incluindo diagramas ER e descrições detalhadas das tabelas, colunas e relacionamentos.

## Consultas Necessárias
### Distribuição Geográfica e Ecologia
- [X] Quais espécies de aves migratórias passam pela Amazônia brasileira?
- [X] Qual a densidade populacional de onças-pintadas em áreas protegidas do Cerrado?
- [X] Quais espécies de plantas são endêmicas da Mata Atlântica e estão ameaçadas de extinção?

### Doenças e Saúde Animal
- [X] Quais doenças acometem principalmente primatas em áreas de desmatamento?
- [X] Qual a taxa de mortalidade por determinada doença em uma espécie específica?

### Evolução e Filogenia
- [X] Quais são os gêneros mais diversos da família Felidae?

### Monitoramento e Conservação
- [X] Qual a evolução da população de uma espécie ao longo dos anos?
- [X] Quais são as áreas prioritárias para conservação de uma determinada espécie?

## Casos de Uso para Guia do Projeto
- [ ] **Biólogo Estudando a Impacto do Desmatamento em Primatas**:
  - [ ] Observou uma diminuição drástica na população de macacos bugios em áreas de floresta fragmentada.
  - [ ] Consulta: "Quais doenças emergentes estão associadas a primatas em áreas de desmatamento e qual a taxa de mortalidade dessas doenças?"

- [ ] **Bióloga Estudando a Distribuição Geográfica de Uma Espécie Invasora**:
  - [ ] Identificou uma nova população de uma espécie de peixe exótico em um rio de uma bacia hidrográfica antes não registrada.
  - [ ] Consulta: "Quais outras espécies nativas coexistem com essa espécie invasora e quais as possíveis interações ecológicas?"

- [ ] **Biólogo Conservacionista Analisando o Status de Conservação de Répteis**:
  - [ ] Notou uma diminuição nas populações de diversas espécies de serpentes em uma região de caatinga.
  - [ ] Consulta: "Quais espécies de serpentes da caatinga estão listadas como vulneráveis ou em perigo de extinção e quais as principais ameaças a essas espécies?"

- [ ] **Biólogo Evolutivo Estudando a Diversificação de Aves**:
  - [ ] Hipótese: As aves de uma determinada família se diversificaram mais rapidamente em áreas montanhosas.
  - [ ] Consulta: "Qual o número de espécies por gênero em uma determinada família de aves em diferentes altitudes?"

- [ ] **Biólogo Molecular Estudando a Diversidade Genética de Uma Espécie**:
  - [ ] Objetivo: Comparar a diversidade genética de populações isoladas de uma espécie de mamífero.
  - [ ] Consulta: "Qual a média de diversidade genética para cada população de uma determinada espécie?"

- [ ] **Estudando a Relação entre Mudanças Climáticas e Distribuição de Espécies**:
  - [ ] Hipótese: Espécies de alta montanha estão migrando para altitudes menores devido ao aquecimento global.
  - [ ] Consulta: "Qual a mudança média na altitude das populações de uma espécie de ave de montanha nos últimos 50 anos?"

- [ ] **Analisando a Eficácia de Áreas Protegidas**:
  - [ ] Questão: As áreas protegidas estão sendo eficazes em proteger espécies ameaçadas?
  - [ ] Consulta: "Qual a taxa de declínio populacional de espécies ameaçadas dentro e fora de áreas protegidas?"

- [ ] **Investigando a Coevolução entre Plantas e Polinizadores**:
  - [ ] Hipótese: Plantas e seus polinizadores coevoluíram, desenvolvendo características morfológicas complementares.
  - [ ] Consulta: "Qual a relação entre o tamanho da corola de uma flor e o comprimento da probóscide de seus polinizadores?"

- [ ] **Analisando a Diversidade Microbiana em Diferentes Ambientes**:
  - [ ] Objetivo: Comparar a diversidade de bactérias em solos de diferentes tipos de floresta.
  - [ ] Consulta: "Qual a riqueza de espécies bacterianas em solos de mata atlântica e amazônica?"

- [ ] **Estudando o Impacto de Pesticidas na Fauna Aquática**:
  - [ ] Questão: Quais são os efeitos de diferentes pesticidas na abundância de invertebrados aquáticos?
  - [ ] Consulta: "Qual a redução na abundância de macroinvertebrados em rios próximos a áreas agrícolas?"


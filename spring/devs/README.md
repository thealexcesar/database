# Documentação da API de Gerenciamento de Mutantes

## Introdução

Este projeto é uma API desenvolvida para gerenciar mutantes em um ambiente seguro, utilizando o D.E.V.S. (Dispositivo Eletrônico de Vigilância e Segurança). A API permite o controle de entrada e saída dos mutantes na escola, cálculo de inimigos derrotados, e determina se um mutante deve ou não ser alistado na organização E.S.P.A.D.A.

## Funcionalidades Principais

### 1. Criar Mutante

- **Endpoint:** `POST /mutants`
- **Descrição:** Cria um novo registro de mutante.
- **Parâmetros:**
    - `name`: Nome do mutante (obrigatório).
    - `power`: Poder do mutante (obrigatório).
    - `age`: Idade do mutante (obrigatório).
    - `enemiesDefeated`: Número de inimigos derrotados pelo mutante (obrigatório).
    - `onSchoolGrounds`: Booleano indicando se o mutante está na escola.
- **Resposta:** Retorna o mutante criado com seu ID.

### 2. Listar Todos os Mutantes

- **Endpoint:** `GET /mutants`
- **Descrição:** Lista todos os mutantes registrados.
- **Parâmetros:**
    - `page`: Número da página para paginação (opcional).
    - `size`: Tamanho da página (opcional).
    - `sortBy`: Campo para ordenar os resultados (opcional).
- **Resposta:** Retorna uma lista paginada de mutantes.

### 3. Listar Mutantes na Escola

- **Endpoint:** `GET /mutants/onschool`
- **Descrição:** Lista todos os mutantes que estão atualmente na escola.
- **Parâmetros:**
    - `page`: Número da página para paginação (opcional).
    - `size`: Tamanho da página (opcional).
    - `sortBy`: Campo para ordenar os resultados (opcional).
- **Resposta:** Retorna uma lista paginada de mutantes que estão na escola.

### 4. Contar Mutantes na Escola

- **Endpoint:** `GET /mutants/onschool/count`
- **Descrição:** Retorna o número total de mutantes que estão atualmente na escola.
- **Resposta:** Retorna o número total de mutantes na escola.

### 5. Entrada de Mutante na Escola

- **Endpoint:** `POST /mutants/{id}/enter-school`
- **Descrição:** Registra a entrada de um mutante na escola após autenticação.
- **Parâmetros:**
    - `id`: ID do mutante.
    - `password`: Senha baseada no enigma Jaobsob (obrigatória).
- **Resposta:** Retorna uma mensagem de sucesso ou erro de autenticação.

### 6. Saída de Mutante da Escola

- **Endpoint:** `POST /mutants/{id}/exit-school`
- **Descrição:** Registra a saída de um mutante da escola.
- **Parâmetros:**
    - `id`: ID do mutante.
- **Resposta:** Retorna uma mensagem de sucesso.

### 7. Verificar Alistamento na E.S.P.A.D.A.

- **Endpoint:** `GET /mutants/should-enlist/{id}`
- **Descrição:** Verifica se o mutante deve ser alistado na organização E.S.P.A.D.A.
- **Parâmetros:**
    - `id`: ID do mutante.
- **Resposta:** Retorna um booleano indicando se o mutante deve ser alistado.

### 8. Calcular Inimigos Derrotados

- **Endpoint:** `GET /mutants/{id}/enemies-defeated`
- **Descrição:** Calcula e retorna a quantidade de alienígenas e demônios derrotados pelo mutante.
- **Parâmetros:**
    - `id`: ID do mutante.
- **Resposta:** Retorna uma string com a quantidade de alienígenas e demônios derrotados.

---

## Alunos

- [**Alex Cesar**](https://github.com/thealexcesar)
- [**Filipe Simões**](https://github.com/Filipeasl)
- [**Murilo**](https://github.com/donutsguy)

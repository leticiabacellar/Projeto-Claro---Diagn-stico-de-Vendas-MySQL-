### 🧠 Projeto SQL – Diagnóstico de Vendas (MySQL)

Este projeto tem como objetivo analisar o desempenho comercial de um negócio ao longo dos anos, utilizando um banco de dados criado no MySQL para armazenar, consultar e diagnosticar métricas essenciais relacionadas a cliques no WhatsApp, engajamento e vendas realizadas.

A análise foi construída para identificar tendências, comparar comportamentos entre anos, medir taxas de conversão e fornecer insights estratégicos para a tomada de decisão.

---

### 📊 Objetivo do Projeto

1. Criar um banco de dados relacional simples e funcional para registrar métricas mensais de performance.

2. Armazenar dados reais de 2020 a 2022.

Realizar análises SQL que respondem perguntas-chave de negócio, como:

- As vendas estão crescendo ao longo do tempo?

- Existe correlação entre cliques, engajamento e vendas?

- Qual é a taxa de conversão por mês e por ano?

Construir consultas SQL profissionais que poderiam ser usadas em análises de BI ou automações de relatórios.

---

### 🧱 Estrutura do Banco de Dados

O banco Projeto Claro contém a tabela Realizado, responsável por armazenar todas as informações históricas.

Tabela: Realizado

| Coluna             | Tipo           | Descrição                               |
|--------------------|----------------|-------------------------------------------|
| id                 | INT (PK, AI)   | Identificador único do registro           |
| ano                | INT            | Ano da medição                            |
| mes                | VARCHAR(10)    | Mês/Ano (ex.: jan/20)                     |
| cliques_whatsapp   | INT            | Quantidade de cliques no WhatsApp         |
| engajados          | INT            | Usuários que interagiram ativamente       |
| vendas             | INT            | Total de vendas no período                |


A granularidade dos dados é mensal, possibilitando uma análise temporal detalhada.


---

### 📥 Inserção dos Dados

O projeto inclui dados hipotéticos dos anos:

- 2020
- 2021
- 2022

Eles compõem um histórico que permite avaliar evolução, quedas, picos de interação e impacto nas vendas.

--- 


### 📊 Consultas Analíticas Disponíveis

O projeto fornece três análises principais:

## 1️⃣ Tendência de Vendas ao Longo do Tempo

Mostra a evolução das vendas mês a mês.


```sql
SELECT 
    ano, mes, SUM(vendas) AS vendas_totais
FROM 
    Realizado
GROUP BY 
    ano, mes
ORDER BY 
    ano, mes;

```


## 2️⃣ Relação Entre Cliques, Engajamento e Vendas

Compara os três principais indicadores do funil digital.

```sql
SELECT 
    ano, mes, 
    SUM(cliques_whatsapp) AS total_cliques,
    SUM(engajados) AS total_engajados,
    SUM(vendas) AS total_vendas
FROM 
    Realizado
GROUP BY 
    ano, mes
ORDER BY 
    ano, mes;

```

## 3️⃣ Taxas de Conversão

Calcula:

Conversão de cliques → vendas

Conversão de engajados → vendas

```sql
SELECT 
    ano, mes,
    SUM(vendas) AS total_vendas,
    SUM(cliques_whatsapp) AS total_cliques,
    ROUND((SUM(vendas) / SUM(cliques_whatsapp)) * 100, 2) AS taxa_conversao_cliques,
    SUM(engajados) AS total_engajados,
    ROUND((SUM(vendas) / SUM(engajados)) * 100, 2) AS taxa_conversao_engajados
FROM 
    Realizado
GROUP BY 
    ano, mes
ORDER BY 
    ano, mes;

```


### 💾 Principais Inserções de Dados

Foram inseridos dados de:

Março a novembro de 2020

Janeiro a dezembro de 2021

Janeiro e fevereiro de 2022

Essas informações possibilitam entender o comportamento em períodos críticos e sazonais.

---

### 🔍 Consultas e Métricas Criadas
1️⃣ Tendência de vendas ao longo dos anos

Consulta que consolida e ordena as vendas por ano e mês, permitindo visualizar evolução:

SELECT 
    ano, mes, SUM(vendas) AS vendas_totais
FROM Realizado
GROUP BY ano, mes
ORDER BY ano, mes;

2️⃣ Relação entre cliques, engajamento e vendas

Consulta para analisar correlação entre as métricas:

SELECT 
    ano, mes, 
    SUM(cliques_whatsapp) AS total_cliques,
    SUM(engajados) AS total_engajados,
    SUM(vendas) AS total_vendas
FROM Realizado
GROUP BY ano, mes
ORDER BY ano, mes;

3️⃣ Cálculo de taxa de conversão

Mede o quão eficiente foi o funil entre cliques → engajados → vendas:

SELECT 
    ano, mes,
    SUM(vendas) AS total_vendas,
    SUM(cliques_whatsapp) AS total_cliques,
    ROUND((SUM(vendas) / SUM(cliques_whatsapp)) * 100, 2) AS taxa_conversao_cliques,
    SUM(engajados) AS total_engajados,
    ROUND((SUM(vendas) / SUM(engajados)) * 100, 2) AS taxa_conversao_engajados
FROM Realizado
GROUP BY ano, mes
ORDER BY ano, mes;


Essa consulta é especialmente útil para diagnóstico de eficiência do canal de vendas.

---

### 🔎 O que este projeto demonstra

- Habilidade prática em DDL (criação de banco e tabela)

- Manipulação de dados com DML

- Construção de consultas analíticas

- Organização, limpeza e padronização de dados

- Capacidade de transformar dados brutos em informações acionáveis

- Entendimento de métricas de marketing e vendas

---

### 🚀 Próximos passos

1. Conectar o banco ao Power BI para criar dashboards.

2. Expandir as análises incluindo ano de 2023+.

3. Criar stored procedures para automatizar relatórios.

4. Implementar validações de dados e tabelas auxiliares.

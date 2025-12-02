-- Criação do banco de dados

CREATE DATABASE diagnostico_vendas;
USE diagnostico_vendas;

-- Criação da tabela para armazenar os dados 

CREATE TABLE Realizado (
id INT AUTO_INCREMENT PRIMARY KEY,
ano INT NOT NULL,
mes VARCHAR(10) NOT NULL,
cliques_whatsapp INT,
engajados INT,
vendas INT
);

-- Inserção dos dados para 2020

INSERT INTO Realizado (ano, mes, cliques_whatsapp, engajados, vendas) VALUES
(2020, 'jan/20', NULL, NULL, NULL),
(2020, 'fev/20', NULL, NULL, NULL),
(2020, 'mar/20', 85000, 59500, 19040),
(2020, 'abr/20', 84500, 60840, 20686),
(2020, 'mai/20', 79000, 60040, 21014),
(2020, 'jun/20', 79000, 60040, 22215),
(2020, 'jul/20', 76000, 60800, 22496),
(2020, 'ago/20', 70000, 59500, 22610),
(2020, 'set/20', 65000, 56550, 22620),
(2020, 'out/20', 67000, 58290, 24482),
(2020, 'nov/20', 65000, 57200, 25168);

-- Inserção dos dados para 2021

INSERT INTO Realizado (ano, mes, cliques_whatsapp, engajados, vendas) VALUES
(2021, 'jan/21', 113000, 99440, 43754),
(2021, 'fev/21', 109610, 97553, 43899),
(2021, 'mar/21', 101700, 91530, 43934),
(2021, 'abr/21', 96050, 86445, 44087),
(2021, 'mai/21', 95485, 85937, 44687),
(2021, 'jun/21', 89270, 80343, 44992),
(2021, 'jul/21', 89270, 80343, 45796),
(2021, 'ago/21', 85880, 77292, 46375),
(2021, 'set/21', 79100, 71190, 46985),
(2021, 'out/21', 73450, 66105, 47596),
(2021, 'nov/21', 75710, 68139, 49060),
(2021, 'dez/21', 73450, 66105, 49579);

-- Inserção dos dados para 2022

INSERT INTO Realizado (ano, mes, cliques_whatsapp, engajados, vendas) VALUES
(2022, 'jan/22', 127690, 114921, 86191),
(2022, 'fev/22', 120571, 72343, 53534);

-- Consulta para verificar os dados inseridos

SELECT * FROM Realizado;

-- 1: Identificar a tendência de vendas ao longo dos meses e anos

SELECT 
    ano, mes, SUM(vendas) AS vendas_totais
FROM 
    Realizado
GROUP BY 
    ano, mes
ORDER BY 
    ano, mes;
    
-- 2: Comparar a relação entre cliques no WhatsApp, engajamento e vendas

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

-- 3: Calcular a taxa de conversão de cliques para vendas

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


CREATE DATABASE pet_caree;

CREATE TABLE ownerss (
    id SERIAL PRIMARY KEY,
    email VARCHAR(100),
    nome VARCHAR(100),		
    telefone VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE petss (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    tipo VARCHAR(100),
    raca VARCHAR(100),
    pelo VARCHAR(100),
    tutor_id INT REFERENCES owners(id) ON DELETE CASCADE 
);



CREATE TABLE foodss (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(100),
    quantidade_em_estoque INT, 
    preco NUMERIC(10, 2),
    validade DATE,
    fornecedor VARCHAR(100)
);

CREATE TABLE immunizationss (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(100),
    estoque INT, 
    aplicador VARCHAR(100),
    seringas INT, 
    descricao VARCHAR(365)
);

CREATE TABLE toyss (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(100),
    estoque INT,
    categoria_animal VARCHAR(100),
    preco NUMERIC(10, 2),
    descricao VARCHAR(100)
);

CREATE TABLE pet_vaccinee (
    pet_id INT REFERENCES pets(id) ON DELETE CASCADE,
    vaccine_id INT REFERENCES immunizations(id) ON DELETE CASCADE,
    data_aplicacao DATE, 
    PRIMARY KEY (pet_id, vaccine_id)
);

CREATE TABLE pet_foodd (
    pet_id INT REFERENCES pets(id) ON DELETE CASCADE,
    food_id INT REFERENCES foods(id) ON DELETE CASCADE,
    quantidade_consumida INT,
    PRIMARY KEY (pet_id, food_id)
);



INSERT INTO owners (email, nome, telefone, endereco) VALUES
('joao.pereira@email.com', 'João Pereira', '11987654321', 'Rua das Palmeiras, 10'),
('maria.oliveira@email.com', 'Maria Oliveira', '21987654322', 'Avenida Paulista, 500'),
('carlos.santos@email.com', 'Carlos Santos', '31987654323', 'Praça do Centro, 15');


INSERT INTO petss (nome, tipo, raca, pelo, tutor_id) VALUES
('Spike', 'Cachorro', 'Pastor Alemão', 'Curto', 1),
('Luna', 'Gato', 'Siamês', 'Curto', 2),
('Thor', 'Cachorro', 'Golden Retriever', 'Longo', 3);

INSERT INTO foodss (tipo, quantidade_em_estoque, preco, validade, fornecedor) VALUES
('Ração Premium para Cães', 100, 149.90, '2024-12-15', 'DogMaster Distribuidora'),
('Ração para Gatos Filhotes', 50, 69.90, '2024-09-10', 'CatCare Ltda'),
('Ração Diet para Cachorros', 80, 99.90, '2024-07-20', 'HealthyPet Alimentos');

INSERT INTO immunizationss (tipo, estoque, aplicador, seringas, descricao) VALUES
('Antirrábica', 30, 'Dr. João Mendes', 40, 'Proteção contra a raiva. Dose única.'),
('Vacina Polivalente V10', 20, 'Dra. Luiza Ferreira', 25, 'Proteção contra múltiplas doenças virais.'),
('Vacina Tripla para Gatos', 15, 'Dr. Pedro Lima', 20, 'Proteção contra doenças respiratórias e virais.');


INSERT INTO toyss (tipo, estoque, categoria_animal, preco, descricao) VALUES
('Corda resistente', 30, 'Cachorro', 34.90, 'Brinquedo para brincadeiras interativas.'),
('Ratinho de Pelúcia', 25, 'Gato', 19.90, 'Brinquedo macio e divertido para gatos.'),
('Disco Frisbee', 20, 'Cachorro', 24.90, 'Disco leve e fácil de pegar.');


INSERT INTO pet_vaccinee (pet_id, vaccine_id, data_aplicacao) VALUES
(1, 1, '2023-11-30'),
(2, 3, '2023-10-15'),
(3, 2, '2023-09-05');

INSERT INTO pet_foodd (pet_id, food_id, quantidade_consumida) VALUES
(1, 1, 12),
(2, 2, 7),
(3, 3, 10);
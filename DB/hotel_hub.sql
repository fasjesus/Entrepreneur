CREATE DATABASE IF NOT EXISTS hotel_hub; 

USE hotel_hub;

CREATE TABLE CLIENTE (
    id_cliente INT NOT NULL,
    user_name VARCHAR(255),
	nome_completo VARCHAR(100),
	cpf VARCHAR(20) UNIQUE,
	idade INTEGER,
	senha VARCHAR(100),
	email VARCHAR(100),
	PRIMARY KEY(id_cliente)
);

CREATE TABLE HOTEL (
    id_hotel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    telefone_hotel  VARCHAR (15) NOT NULL,
    estado_hotel  VARCHAR (15) NOT NULL,
    cidade_hotel VARCHAR (15) NOT NULL,
    endereco_hotel VARCHAR(50) NOT NULL
);

CREATE TABLE VALOR (
    id_valor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL
);

CREATE TABLE QUARTO (
    id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_hotel INT NOT NULL,
    fk_id_valor INT NOT NULL,
    numeroQuarto VARCHAR(10) NOT NULL,
    tipoQuarto VARCHAR(50) NOT NULL, 
    Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (fK_id_hotel) REFERENCES HOTEL(id_hotel) ON DELETE CASCADE,
    FOREIGN KEY (fK_id_valor) REFERENCES VALOR(id_valor) ON DELETE CASCADE
);

CREATE TABLE METODO_PAGAMENTO (
    id_metodo_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipoPagamento VARCHAR(10)
);

CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    fK_id_cliente INT NOT NULL,
    fK_id_quarto INT NOT NULL,
    fk_metodo_pagamento INT NOT NULL,
    dataCheckIn DATE NOT NULL,
    dataCheckOut DATE NOT NULL,
    FOREIGN KEY (fK_id_quarto) REFERENCES QUARTO(id_quarto) ON DELETE CASCADE,
    FOREIGN KEY (fK_id_cliente) REFERENCES CLIENTE(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (fk_metodo_pagamento) REFERENCES METODO_PAGAMENTO(id_metodo_pagamento) ON DELETE CASCADE
);
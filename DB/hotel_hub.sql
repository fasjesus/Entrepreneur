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
    telefone VARCHAR(100),
	PRIMARY KEY(id_cliente)
);

CREATE TABLE HOTEL (
    id_hotel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_hotel VARCHAR (15) NOT NULL,
    telefone_hotel  VARCHAR (15) NOT NULL,
    estado_hotel  VARCHAR (15) NOT NULL,
    cidade_hotel VARCHAR (15) NOT NULL,
    endereco_hotel VARCHAR(50) NOT NULL
);

CREATE TABLE QUARTO (
    id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_hotel INT NOT NULL,
    numeroQuarto VARCHAR(10) NOT NULL,
    tipoQuarto VARCHAR(50) NOT NULL, 
    statusQuarto VARCHAR(20) NOT NULL,
    valor_quarto DECIMAL,
    FOREIGN KEY (fK_id_hotel) REFERENCES HOTEL(id_hotel) ON DELETE CASCADE
);

CREATE TABLE METODO_PAGAMENTO (
    id_metodo_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipoPagamento VARCHAR(10)
);

CREATE TABLE RESERVA (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    fK_id_cliente INT NOT NULL,
    fK_id_quarto INT NOT NULL,
    dataCheckIn DATE NOT NULL,
    dataCheckOut DATE NOT NULL,
    statusReserva VARCHAR(20) NOT NULL,
    FOREIGN KEY (fK_id_quarto) REFERENCES QUARTO(id_quarto) ON DELETE CASCADE,
    FOREIGN KEY (fK_id_cliente) REFERENCES CLIENTE(id_cliente) ON DELETE CASCADE
);

CREATE TABLE PAGAMENTO_RECEBIMENTO (
	id_fatura INT PRIMARY KEY AUTO_INCREMENT,
    fK_reserva INT NOT NULL,
    fK_metodo_pagamento INT NOT NULL,
    data_emissao DATE NOT NULL,
    valor_fatura DECIMAL,
    FOREIGN KEY (fK_reserva) REFERENCES RESERVA(id_reserva) ON DELETE CASCADE,
    FOREIGN KEY (fk_metodo_pagamento) REFERENCES METODO_PAGAMENTO(id_metodo_pagamento) ON DELETE CASCADE
)
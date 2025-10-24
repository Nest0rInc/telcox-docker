CREATE DATABASE IF NOT EXISTS TelcoX_BSS CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE TelcoX_BSS;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identificacion VARCHAR(13) NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    nombre_completo VARCHAR(200),
    es_activo BOOLEAN DEFAULT TRUE,
    INDEX idx_identificacion (identificacion)
) ENGINE=InnoDB;

CREATE TABLE contratos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL,
    cliente_id INT NOT NULL,
    es_activo BOOLEAN DEFAULT TRUE,
    INDEX idx_codigo (codigo),
    INDEX idx_cliente_id (cliente_id),
    CONSTRAINT fk_contratos_cliente FOREIGN KEY (cliente_id)
        REFERENCES clientes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE planes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    es_activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE contrato_planes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contrato_id INT NOT NULL,
    plan_id INT NOT NULL,
    es_activo BOOLEAN DEFAULT TRUE,
    INDEX idx_contrato_id (contrato_id),
    INDEX idx_plan_id (plan_id),
    CONSTRAINT fk_contrato_planes_contrato FOREIGN KEY (contrato_id)
        REFERENCES contratos(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_contrato_planes_plan FOREIGN KEY (plan_id)
        REFERENCES planes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE consumos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contrato_plan_id INT NOT NULL,
    saldo DECIMAL(10,2) DEFAULT 0.00,
    consumo_datos DECIMAL(10,2) DEFAULT 0.00,
    consumo_minutos DECIMAL(10,2) DEFAULT 0.00,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_contrato_plan_id (contrato_plan_id),
    CONSTRAINT fk_consumos_contrato_plan FOREIGN KEY (contrato_plan_id)
        REFERENCES contrato_planes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;
USE TelcoX_BSS;

INSERT INTO clientes (identificacion, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, nombre_completo, es_activo)
VALUES ('0912345678', 'NESTOR', 'DANIEL', 'RODRIGUEZ', 'MOLINA', 'NESTOR DANIEL RODRIGUEZ MOLINA', TRUE);

INSERT INTO clientes (identificacion, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, nombre_completo, es_activo)
VALUES ('0998765432', 'CARLOS', 'FABIAN', 'GOMEZ', 'LOPEZ', 'CARLOS FABIAN GOMEZ LOPEZ', TRUE);

INSERT INTO planes (nombre, es_activo)
VALUES ('Super X Premium', TRUE); 

INSERT INTO planes (nombre, es_activo)
VALUES ('Super X Plus', TRUE);

INSERT INTO contratos (codigo, cliente_id, es_activo)
VALUES ('2025102301', 1, TRUE);

INSERT INTO contratos (codigo, cliente_id, es_activo)
VALUES ('2025102302', 2, TRUE);

INSERT INTO contrato_planes (contrato_id, plan_id, es_activo)
VALUES (1, 1, TRUE);

INSERT INTO contrato_planes (contrato_id, plan_id, es_activo)
VALUES (2, 2, TRUE);

INSERT INTO consumos (contrato_plan_id, saldo, consumo_datos, consumo_minutos, fecha)
VALUES (1, 15.75, 3.25, 120.0, NOW());

INSERT INTO consumos (contrato_plan_id, saldo, consumo_datos, consumo_minutos, fecha)
VALUES (2, 8.50, 1.10, 85.0, NOW());
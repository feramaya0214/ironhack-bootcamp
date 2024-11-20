CREATE DATABASE IF NOT EXISTS gambling_db;
USE gambling_db;

CREATE SCHEMA gambling_class;

DROP TABLE IF EXISTS gambling_db.customer;
DROP TABLE IF EXISTS gambling_db.account;
DROP TABLE IF EXISTS gambling_db.product;
DROP TABLE IF EXISTS gambling_db.betting;


CREATE TABLE gambling_db.customer (
    cust_id VARCHAR(50),
    account_location VARCHAR(50),
    tittle VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
	create_date VARCHAR(50),
	country_code VARCHAR(50), 
	language VARCHAR(50),
	status VARCHAR(50),    
	date_of_birth VARCHAR(50),      
	contact VARCHAR(50),         
    customer_group VARCHAR(50)
);


CREATE TABLE gambling_db.account (
    account_no VARCHAR(50),
    cust_id VARCHAR(50),
    account_location VARCHAR(50),
    currency_code VARCHAR(50),
    daily_deposit_limit VARCHAR(50),
	stake_scale VARCHAR(50),
    source_prod VARCHAR(50)
);

CREATE TABLE gambling_db.product (
    class_id VARCHAR(50),
    category_id VARCHAR(50),
    product VARCHAR(50),
    sub_product VARCHAR(50),
    description_ VARCHAR(50),
    bet_or_play VARCHAR(50)
);

CREATE TABLE gambling_db.betting (
    account_no VARCHAR(50),
    bet_date VARCHAR(50),
    class_id VARCHAR(50),
    category_id VARCHAR(50),
    source VARCHAR(50),
	bet_count VARCHAR(50),
	bet_amt VARCHAR(50),
	win_amt VARCHAR(50),
    product VARCHAR(50)
);

-- LOAD DATA INFILE 'enlace'
-- INTO TABLE nombre_tabla
-- FIELDS TERMINATED BY ';'  
-- ENCLOSED BY '''           
-- LINES TERMINATED BY '\r\n' 


SELECT * FROM gambling_db.customer;
SELECT * FROM gambling_db.account;
SELECT * FROM gambling_db.product;
SELECT * FROM gambling_db.betting;

-- Pregunta 01: Usando la tabla o pestaña de clientes, por favor escribe una consulta SQL que muestre Título, Nombre y Apellido y Fecha de Nacimiento para cada uno de los clientes. No necesitarás hacer nada en Excel para esta.

SELECT 	concat(tittle,' ', first_name,' ', last_name) AS 'Cliente', 
        date_of_birth AS 'Fecha de nacimiento' 
FROM gambling_db.customer;

-- Pregunta 02: Usando la tabla o pestaña de clientes, por favor escribe una consulta SQL que muestre el número de clientes en cada grupo de clientes (Bronce, Plata y Oro). Puedo ver visualmente que hay 4 Bronce, 3 Plata y 3 Oro pero si hubiera un millón de clientes ¿cómo lo haría en Excel?

SELECT customer_group, count(customer_group)
FROM gambling_db.customer
GROUP BY customer_group;

-- Pregunta 03: El gerente de CRM me ha pedido que proporcione una lista completa de todos los datos para esos clientes en la tabla de clientes pero necesito añadir el código de moneda de cada jugador para que pueda enviar la oferta correcta en la moneda correcta. Nota que el código de moneda no existe en la tabla de clientes sino en la tabla de cuentas. Por favor, escribe el SQL que facilitaría esto. ¿Cómo lo haría en Excel si tuviera un conjunto de datos mucho más grande?

SELECT *
FROM gambling_db.customer
INNER JOIN gambling_db.account
ON gambling_db.customer.cust_id = gambling_db.account.cust_id;

-- Pregunta 04: Ahora necesito proporcionar a un gerente de producto un informe resumen que muestre, por producto y por día, cuánto dinero se ha apostado en un producto particular. TEN EN CUENTA que las transacciones están almacenadas en la tabla de apuestas y hay un código de producto en esa tabla que se requiere buscar (classid & categoryid) para determinar a qué familia de productos pertenece esto. Por favor, escribe el SQL que proporcionaría el informe. Si imaginas que esto fue un conjunto de datos mucho más grande en Excel, ¿cómo proporcionarías este informe en Excel?

SELECT bet_date, product, count(bet_amt)
FROM gambling_db.betting
GROUP BY bet_date, product
ORDER BY bet_date;

-- Pregunta 05: Acabas de proporcionar el informe de la pregunta 4 al gerente de producto, ahora él me ha enviado un correo electrónico y quiere que se cambie. ¿Puedes por favor modificar el informe resumen para que solo resuma las transacciones que ocurrieron el 1 de noviembre o después y solo quiere ver transacciones de Sportsbook. Nuevamente, por favor escribe el SQL abajo que hará esto. Si yo estuviera entregando esto vía Excel, ¿cómo lo haría?

SELECT bet_date, product, count(bet_amt)
FROM gambling_db.betting
WHERE bet_date = '01/11/2012'
GROUP BY bet_date, product
ORDER BY bet_date;

SELECT product, bet_date, count(bet_amt)
FROM gambling_db.betting
WHERE product = 'Sportsbook'
GROUP BY product,bet_date
ORDER BY bet_date asc;

-- Pregunta 06: Como suele suceder, el gerente de producto ha mostrado su nuevo informe a su director y ahora él también quiere una versión diferente de este informe. Esta vez, quiere todos los productos pero divididos por el código de moneda y el grupo de clientes del cliente, en lugar de por día y producto. También le gustaría solo transacciones que ocurrieron después del 1 de diciembre. Por favor, escribe el código SQL que hará esto.


-- Pregunta 07: Nuestro equipo VIP ha pedido ver un informe de todos los jugadores independientemente de si han hecho algo en el marco de tiempo completo o no. En nuestro ejemplo, es posible que no todos los jugadores hayan estado activos. Por favor, escribe una consulta SQL que muestre a todos los jugadores Título, Nombre y Apellido y un resumen de su cantidad de apuesta para el período completo de noviembre.


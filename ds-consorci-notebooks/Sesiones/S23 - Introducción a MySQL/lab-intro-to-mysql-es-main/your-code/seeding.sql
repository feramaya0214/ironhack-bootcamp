insert into cars(car_id, VIN, manufacturer, model, year_, color)
values ('0', '3K096I98581DHSNUP', 'Volkswagen','Tiguan', '2019','Blue'),
('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot','Rifter', '2019', 'Red'),
('2', 'RKXVNNIHLVVZOUB4M', 'Ford','Fusion', '2018', 'White'),
('3', 'HKNDGS7CU31E9Z7JW', 'Toyota','RAV4', '2018', 'Silver'),
('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray'),
('5', 'DAM41UDN3CHU2WVF6', 'Volvo','V60 Cross Country', '2019', 'Gray');


insert into costumer(costumer_id, first_name, phone_no, email, address, city, state, country, zip_code)
values ('10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chope', 'Madrid', 'Madrid', 'Spain', '28045'),
('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
('30001', 'Napoleon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');


insert into salesperson (salesperson_id, first_name, store_name)
values ('00001', 'Petey Cruiser', 'Madrid'),
('00002', 'Anna Sthesia', 'Barcelona'),
('00003', 'Paul Molive', 'Berlín'),
('00004', 'Gail Forcewind', 'París'),
('00005', 'Paige Turner', 'Mimia'),
('00006', 'Bob Frapples', 'Ciudad de México'),
('00007', 'Walter Melon', 'Ámsterdam'),
('00008', 'Shonda Leer', 'São Paulo');

insert into invoices (invoice_id, date_, car, costumer, salesperson)
values ('852399038', '2018-08-22','0','1','3'),
('731166526', '2018-12-31', '3', '0', '5'),
('271135104', '2019-01-22', '2','2','7');




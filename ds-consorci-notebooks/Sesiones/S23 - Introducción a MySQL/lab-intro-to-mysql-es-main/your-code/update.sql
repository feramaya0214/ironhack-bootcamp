USE cars;

UPDATE cars.salesperson
SET store_name = 'Miami'
WHERE first_name = 'Paige Turner' AND store_name = 'Mimia';


UPDATE cars.costumer
SET email = 'ppicasso@gmail.com'
WHERE first_name = 'Pablo Picasso';

UPDATE cars.costumer
SET email = 'lincoln@us.gov'
WHERE first_name = 'Abraham Lincoln';

UPDATE cars.costumer
SET email = 'hello@napoleon.me'
WHERE first_name = 'Napoléon Bonaparte';

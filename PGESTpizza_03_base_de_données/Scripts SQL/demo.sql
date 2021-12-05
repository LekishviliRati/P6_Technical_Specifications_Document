use mydb;

-- ########################################
-- # Afficher le contenu d'une commande   #
-- ########################################

SELECT mydb.order.id as 'commande n°', 
mydb.order.total_price as 'Prix', 
product.name as 'Pizza Name', 
order_product.product_unit as 'nombre de pizza', 
order_product.unit_price as 'prix de la pizza',
mydb.order.status as 'Statut',
mydb.order.payment_status as 'Reglement'
FROM order_product
LEFT JOIN product
ON order_product.product_id = product.id
RIGHT JOIN mydb.order
ON order_product.order_id = mydb.order.id
WHERE mydb.order.id = 5;


-- #####################################################
-- # Afficher une commande contenant plusieurs pizzas  #
-- #####################################################

SELECT mydb.order.id as 'commande n°', 
mydb.order.total_price as 'Prix', 
product.name as 'Pizza Name', 
order_product.product_unit as 'nombre de pizza', 
order_product.unit_price as 'prix de la pizza',
mydb.order.status as 'Statut',
mydb.order.payment_status as 'Reglement'
FROM order_product
LEFT JOIN product
ON order_product.product_id = product.id
RIGHT JOIN mydb.order
ON order_product.order_id = mydb.order.id
WHERE mydb.order.id = 12;

-- ######################################################################################################
-- # Afficher les commandes en attente dans un restau en particulier (par exemple : OC Pizza Grenoble)  #
-- ######################################################################################################

select mydb.order.id as 'Commande n°', mydb.order.status as 'Status', restaurant.name as 'Restaurant', mydb.order.date as 'Date'
FROM mydb.order
LEFT JOIN restaurant
ON mydb.order.restaurant_id = restaurant.id
WHERE (mydb.order.status = 'En attente') AND (restaurant.name = 'OC Pizza Grenoble');

-- ############################################################################################
-- # Afficher les commandes en attente d'un client (par exemple : Jourdan Marcel avec l'id 9) #
-- ############################################################################################

select mydb.order.id as 'Commande n°', mydb.order.status as 'Status', customer.name as 'Nom client', 
mydb.order.total_price as 'Prix total', mydb.order.payment_status as 'Statut paiement', mydb.order.date as 'Date'
FROM mydb.order
LEFT JOIN customer
ON mydb.order.customer_id = customer.id
WHERE (mydb.order.status = 'En attente') AND (customer.id = 9);

-- ######################################################################################################################
-- # Afficher l'adresse de livraison d'une commande terminée, après changement ou ajout d'adresse de la part du client  #
-- ######################################################################################################################

-- Ajout d'une noouvelle adresse de la part du client Guillon Adrien id = 6

INSERT INTO `delivery` (`recipient`, `street`, `postal_code`, `city`) VALUES ('Guillon', '41, rue Jobin', '74000', 'Annecy');
INSERT INTO `customer_delivery` (`customer_id`, `delivery_id`) VALUES ('6', '11');

-- On vérifie que l'adresse a bien été ajouté. 
-- Le client devra préciser à quelle adresse il souhiate se faire livrer, et aura la possibilité d'indiquer sur le site si il souhaite conserver les deux adresses ou non. 

-- Afficher les anciennes commandes du client (Guillon adrien id = 6) avec l'ancienne adresse.

SELECT mydb.order.id as 'commande n°', customer.name as 'Client' ,mydb.order.date as 'date', 
mydb.order.total_price as 'Prix', mydb.order.status as 'statut commande'
FROM mydb.order
LEFT JOIN customer
ON mydb.order.customer_id = customer.id
WHERE mydb.order.status = 'Terminée' AND customer.id = 6;

-- ####################################################################################################
-- # Si le prix d'une pizza change, peut-on retrouver les commandes antérieures avec les anciens prix #
-- ####################################################################################################

-- Vérifier que le prix de la Pizza Régina (id = 2) est à 12 et qu'elle passe ensuite à 14

select product.name as 'Pizza', product.price as 'Prix'
From product;

-- Passer le prix à 14 de la pizza Régina 

UPDATE product SET product.price = '14.00' 
WHERE product.id = 2;

-- Retrouver les commandes antérieures avec le prix de la pizza Régina à 12.00

SELECT mydb.order.id AS 'Commande n°', mydb.order.date AS 'Date', product.name AS 'Pizza', order_product.unit_price AS 'Prix', order_product.product_unit AS 'Quantité'
FROM order_product
LEFT JOIN mydb.order
ON order_product.order_id = mydb.order.id
RIGHT JOIN product
ON order_product.product_id = product.id
WHERE product.name = 'Pizza Regina';


-- #############################################################################################################
-- # Afficher les pizzas pour lesquelles tous les ingrédients sont en stock (Exemple : OC Pizza Annecy id = 1) #
-- #############################################################################################################

--  Afficher les stocks d'OC Pizza Annecy 

SELECT restaurant.name as 'Restaurant', ingredient.name as 'Ingrédient', ingredient_restaurant.stock as 'Stock'
FROM ingredient_restaurant
LEFT JOIN restaurant
ON ingredient_restaurant.restaurant_id = restaurant.id
RIGHT JOIN ingredient
ON ingredient_restaurant.ingredient_id = ingredient.id
WHERE restaurant.name = 'OC Pizza Annecy';

-- Vider le stock de Chorizo

UPDATE ingredient_restaurant SET stock = 0
WHERE ingredient_restaurant.restaurant_id = 1 AND ingredient_restaurant.ingredient_id = 2;

-- Afficher les pizzas pour lesquelles tous les ingrédients sont en stock pour OC Pizza Annecy (id = 1)

select distinct product.name as 'Pizzas disponibles sur ANNECY'
FROM product
LEFT JOIN ingredient_product 
ON ingredient_product.product_id = product.id
LEFT JOIN ingredient 
ON ingredient.id = ingredient_product.ingredient_id
LEFT JOIN ingredient_restaurant
ON ingredient_restaurant.ingredient_id = ingredient.id
LEFT JOIN restaurant
ON restaurant.id = ingredient_restaurant.restaurant_id
WHERE product.name NOT IN (
select product.name 
FROM product 
LEFT JOIN ingredient_product 
ON ingredient_product.product_id = product.id
LEFT JOIN ingredient 
ON ingredient.id = ingredient_product.ingredient_id
LEFT JOIN ingredient_restaurant
ON ingredient_restaurant.ingredient_id = ingredient.id
LEFT JOIN restaurant
ON restaurant.id = ingredient_restaurant.restaurant_id
WHERE restaurant.id = 1
AND ingredient_restaurant.stock - ingredient_product.quantity <= 0
GROUP BY product.name
);
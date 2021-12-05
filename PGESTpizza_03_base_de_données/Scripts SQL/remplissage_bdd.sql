use mydb;

--
-- Insert restaurants
--

INSERT INTO `restaurant` (`name`, `location`) VALUES 
('OC Pizza Annecy', '93, avenue Augustin Cohen, Annecy'),
('OC Pizza Aix-les-Bains', '729, impasse Ferreira, Aix-les-Bains'),
('OC Pizza Grenoble', '21, boulevard Allain, Grenoble'),
('OC PIzza Lyon', '53, rue Julien, Lyon'),
('OC Pizza Rumilly', '21, chemin de Deschamps, Rumilly');

--
-- Insert employees
--

INSERT INTO `employee` (`name`, `first_name`, `status`, `professional_id`, `professional_phone`, `password`, `personal_mail`, `personal_phone`, `restaurant_id`) VALUES 
('Maurice', 'Marion', 'Cuisinier', 'mauricemarion', '0785659795', '4i4|iyXfh', 'marion.maurice@gmail.com', '0792600364', '1'),
('Barre', 'Alain', 'Cuisinier', 'barrelain', '0779484179', 'dfNYnShy', 'alain.barre@yahoo.com', '0736566574', '1'),
('Gauthier', 'Augustin', 'Livreur', 'gauthieraugustin', '0678043285', 'fGUuxDk', 'augustin@gauthier@hotmail.com', '0694561715', '1'),
('Philippe', 'Astrid', 'Livreur', 'philippestrid', '0604591142', 'OzLuFx', 'astridphilippe@free.fr', '0733124694', '1'),
('Joly', 'Noel', 'Responsable', 'jolynoel', '0608401374', '3f]bkjfb', 'elisabeth97@rmtmarket.ru', '0624261735', '1'),
('Leduc', 'Cecile', 'Cuisinier', 'leduccecile', '0785659715', '2WZzO?8', 'leduc.cecile89@gmail.com', '0792952364', '2'),
('Mallet', 'Luc', 'Cuisinier', 'malletLuc', '0779484196', 'svkjdbvjnShy', 'mallet.luc52@yahoo.com', '0799780071', '2'),
('Blanchard', 'Sylvie', 'Livreur', 'blanchardsylvie', '0678043298', 'fGvspo6xDk', 'blanchard651@hotmail.com', '0649068520', '2'),
('Arnaud', 'Chantal', 'Livreur', 'arnaudchantal', '0604591854', 'sdfsdkjuFx', 'arnaud.ch87@free.fr', '0775981440', '2'),
('Nguyen', 'Dominique', 'Responsable', 'nguyendominique', '0608409336', 'slkdfoi9852', 'Nguyen5412@rmtmarket.ru', '0691472839', '2'),
('Philippe', 'Julien', 'Cuisinier', 'philippejulien', '0799834292', '1SKMxq541', 'philippe.julien23@gmail.com', '0795888768', '3'),
('Didier', 'Christelle', 'Cuisinier', 'didierchristelle', '0790805059', '47Q9SUck', 'christelle14@yahoo.com', '0718433017', '3'),
('Silva', 'Helene', 'Livreur', 'silvahelene', '0675930203', 'eQSkfdsvml', 'helene.sila@hotmail.com', '0636412695', '3'),
('Rossi', 'Adrien', 'Livreur', 'rossiadrien', '0603669810', 'OzLfslfhouFx', 'rossi.adrien95@free.fr', '0765025858', '3'),
('Gallet', 'Remy', 'Responsable', 'lgalletremy', '0632225538', '3f]bkjfb', 'gallet.remyyy@gmail.com', '0632221735', '3'),
('Becker', 'Ines', 'Cuisinier', 'beckerines', '0749293432', '4i4dsobvib', 'marion.maurice@gmail.com', '0792962581', '4'),
('Huet', 'Gerard', 'Cuisinier', 'huetgerard', '0793983974', 'dvhsoiuey841', 'huet6@yahoo.com', '0711968919', '4'),
('Costa', 'Joseph', 'Livreur', 'costajoseph', '0675873967', 'mguyunegco', 'costa8@hotmail.com', '0679551716', '4'),
('Letellier', 'Lucy', 'Livreur', 'letellierlucy', '0623179521', 'PTkQdknQZlx', 'lucylet@free.fr', '0734185510', '4'),
('Gomes', 'Penelope', 'Responsable', 'gomespenelope', '0650416509', 'k3zy8SBh4D', 'gomespen7@yahoo.com', '0612951775', '4'),
('Mary', 'Theophile', 'Cuisinier', 'marytheophile', '0753566330', '4i4|iyXfh', 'marytheophile12@gmail.com', '0798743141', '5'),
('Navarro', 'Jules', 'Cuisinier', 'navarrojules', '0775042785', 'W97NdVT', 'navarroj@yahoo.com', '0704870779', '5'),
('Pascal', 'Marcel', 'Livreur', 'pascalmarcel', '0637857929', 'NfsRCCx8kmV0', 'pascalmar@hotmail.com', '0612617571', '5'),
('Blin', 'Manon', 'Livreur', 'blinmanon', '0620667346', 'XP8eMLsA', 'blinman@free.fr', '0730569133', '5'),
('Giraud', 'Frederic', 'Responsable', 'giraudfrederic', '0660082479', 'GIi5shogjCCw', 'frederic8541@gmail.com', '0694602952', '5');

--
-- Insert customers
--

INSERT INTO `customer` (`name`, `first_name`, `e-mail`, `password`, `phone_number`) VALUES 
('Lemonnier', 'Joseph', 'lemonnier.joseph74@gmail.com', 'g8bztllsvi', '0765923515'),
('Philippe', 'Jeanne', 'jeanee845@hotmail.com', 'UqA1kW', '0657516185'),
('Santos', 'Aurore', 'santosaur@gmail.com', 'dh6oCf8Hx', '0789587679'),
('Monnier', 'Guy', 'monnier125guy@gmail.com', 'g8bztllsvi', '0733353149'),
('Giraud', 'Alain', 'giraud8542125@free.com', 'XqjZIh', '0692351565'),
('Guillon', 'Adrien', 'guillon85@free.com', 'vdsihîov', '0765923515'),
('Boulay', 'Stephanie', 'boulay4@hotmail.com', 'zaifhez', '0765985234'),
('Dupre', 'Remy', 'remy.dupre7@gmail.com', '1596ves64bv', '0665929174'),
('Jourdan', 'Marcel', 'jourdanmarcel785@gmail.com', 'pozinopvibo', '0787423517'),
('Gerard', 'Franck', 'franckger@gmail.com', 'pocabai695', '0663333519');

--
-- Insert delievries
--

INSERT INTO `delivery` (`recipient`, `street`, `postal_code`, `city`) VALUES 
('Lemonnier', '15, avenue de Clement', '73100', 'Aix_les_Bains'),
('Philippe', '62, rue Marthe Bernier', '74000', 'Annecy'),
('Santos', '81, avenue Herve', '73100', 'Aix_les_Bains'),
('Monnier', '58, place de Diaz', '74150', 'Rumilly'),
('Giraud', '3, impasse de Turpin', '69001', 'Lyon'),
('Guillon', '71, boulevard Corinne Perrier', '74000', 'Annecy'),
('Boulay', '4, chemin de Lopes', '69001', 'Lyon'),
('Dupre', '35, impasse de Gros', '74150', 'Rumilly'),
('Jourdan', '97, place de Allard', '69001', 'Lyon'),
('Gerard', '331, boulevard Gimenez', '69001', 'Lyon');

--
-- Insert customer_delivery
--

INSERT INTO `customer_delivery` (`customer_id`, `delivery_id`) VALUES 
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '9'),
('10', '10');

--
-- Insert product
--

INSERT INTO `product` (`name`, `description`, `price`, `recipe`) VALUES 
('Pizza Chorizo', 'Pizza au chorizo, base tomate.', '13.00', 'Base : sauce tomate. Ingrédients : chorizo, gruyere. Temps de cuisson : 20 minutes à 240°.'),
('Pizza Regina', 'Un grand classique des pizzas, au jambon et champignons.', '12.00', 'Base : sauce tomate. Ingrédients : jambon, gruyere, champignons. Temps de cuisson : 20 minutes à 240°.'),
('Pizza Jambon-Fromage', 'Base tomate ou crème au choix.', '11.00', 'Base : sauce tomate ou crème. Ingrédients : jambon, gruyere. Temps de cuisson : 20 minutes à 240°.'),
('Pizza Calzone', 'Pizza en forme de chaussette.', '15.00', 'Base : sauce tomate. Ingrédients : jambon, gruyere, gorgonzola, champignons. Temps de cuisson : 20 minutes à 240°.');

--
-- Insert ingredient
--

INSERT INTO `ingredient` (`name`) VALUES 
('Gruyere'),
('Chorizo'),
('Jambon'),
('Champignon'),
('Gorgonzola');

--
-- Insert ingredient_restaurant
--

INSERT INTO `ingredient_restaurant` (`ingredient_id`, `restaurant_id`, `stock`) VALUES 
('1', '1', '250'),
('2', '1', '250'),
('3', '1', '250'),
('4', '1', '250'),
('5', '1', '250'),
('1', '2', '250'),
('2', '2', '250'),
('3', '2', '250'),
('4', '2', '250'),
('5', '2', '250'),
('1', '3', '250'),
('2', '3', '250'),
('3', '3', '250'),
('4', '3', '250'),
('5', '3', '250'),
('1', '4', '250'),
('2', '4', '250'),
('3', '4', '250'),
('4', '4', '250'),
('5', '4', '250'),
('1', '5', '250'),
('2', '5', '250'),
('3', '5', '250'),
('4', '5', '250'),
('5', '5', '250');

--
-- Insert ingredient_product
--

INSERT INTO `ingredient_product` (`product_id`, `ingredient_id`, `quantity`) VALUES 
('1', '1', '1'),
('1', '3', '1'),
('2', '1', '1'),
('2', '3', '1'),
('2', '4', '1'),
('3', '1', '1'),
('3', '3', '1'),
('4', '1', '1'),
('4', '3', '1'),
('4', '4', '1'),
('4', '5', '1');

--
-- Insert order
--

INSERT INTO `order` (`date`, `total_price`, `status`, `payment_status`, `restaurant_id`, `customer_id`, `delivery_id`, `deliverer_id`) VALUES 
('2021-01-01', '15.00', 'Terminée', 'Payé', '1', '6', '6', '4'),
('2021-01-02', '13.00', 'Terminée', 'Payé', '2', '3', '3', '9'),
('2021-01-03', '12.00', 'Terminée', 'Payé', '4', '1', '1', '18'),
('2021-01-03', '12.00', 'Terminée', 'Payé', '4', '2', '2', '19'),
('2021-01-03', '12.00', 'Terminée', 'Payé', '4', '6', '6', '18'),
('2021-01-03', '26.00', 'Terminée', 'Payé', '4', '4', '4', '19'),
('2021-01-03', '12.00', 'Terminée', 'Payé', '3', '5', '5', '13'),
('2021-01-04', '12.00', 'Terminée', 'Payé', '5', '7', '7', '23'),
('2021-01-04', '11.00', 'Terminée', 'Payé', '3', '8', '8', '14'),
('2021-01-04', '15.00', 'Terminée', 'Payé', '4', '10', '10', '18'),
('2021-01-05', '12.00', 'En attente', 'A payer', '1', '6', '6', '4'),
('2021-01-05', '28.00', 'En attente', 'Payé', '4', '9', '9', '19');

INSERT INTO `order` (`date`, `total_price`, `status`, `payment_status`, `restaurant_id`, `customer_id`) VALUES
('2021-01-05', '24.00', 'En attente', 'A payer', '3', '5'),
('2021-01-05', '22.00', 'En attente', 'A payer', '3', '3');


--
-- Insert order_product
--

INSERT INTO `order_product` (`order_id`, `product_id`, `product_unit`, `unit_price`) VALUES 
('1', '4', '1', '15.00'),
('2', '1', '1', '13.00'),
('3', '2', '1', '12.00'),
('4', '2', '1', '12.00'),
('5', '2', '1', '12.00'),
('6', '1', '2', '13.00'),
('7', '2', '1', '12.00'),
('8', '2', '1', '12.00'),
('9', '3', '1', '11.00'),
('10', '4', '1', '15.00'),
('11', '2', '1', '12.00'),
('12', '1', '1', '13.00'),
('13', '2', '2', '24.00'),
('14', '3', '2', '11.00'),
('12', '4', '1', '15.00');


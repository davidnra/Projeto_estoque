# Execute nessa ordem

-- Cria o banco de dados --
CREATE DATABASE IF NOT EXISTS `controle_de_estoque`;

-- Cria a tabela usuários --
CREATE TABLE `users` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`user` VARCHAR(75) NOT NULL ,
	`password` VARCHAR(32) NOT NULL 

);


-- Cria a tabela Estados --
CREATE TABLE `states` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`name_state` VARCHAR(50) NOT NULL 
	 
);


INSERT `states` (`id`, `name_state`) VALUES
(1, 'Acre'),
(2, 'Alagoas'),
(3, 'Amapá'),
(4, 'Amazonas'),
(5, 'Bahia'),
(6, 'Ceará'),
(7, 'Distrito Federal'),
(8, 'Espírito Santo'),
(9, 'Goiás'),
(10, 'Maranhão'),
(11, 'Mato Grosso'),
(12, 'Mato Grosso do Sul'),
(13, 'Minas Gerais'),
(14, 'Pará'),
(15, 'Paraíba'),
(16, 'Paraná'),
(17, 'Pernambuco'),
(18, 'Piauí'),
(19, 'Rio de Janeiro'),
(20, 'Rio Grande do Norte'),
(21, 'Rio Grande do Sul'),
(22, 'Rondônia'),
(23, 'Roraima'),
(24, 'Santa Catarina'),
(25, 'São Paulo'),
(26, 'Sergipe'),
(27, 'Tocantins');

-- Insere o usuário e a senha de login --
INSERT `users` (`id`, `user`, `password`) VALUES 
(1, 'admin', '1234');

-- Cria tabela Fornecedor --
CREATE TABLE `supplier` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`name` VARCHAR(50) NOT NULL ,
	`email` VARCHAR(60) NOT NULL ,
	`phone` VARCHAR(16) NOT NULL ,
	`cnpj` VARCHAR(20) NOT NULL ,
	`address` VARCHAR(60) NOT NULL ,
	`number_address` VARCHAR(5) NOT NULL ,
	`neighborhood` VARCHAR(60) NOT NULL ,
	`city` VARCHAR(50) NOT NULL ,
	`id_state` INT(11) NOT NULL,
	INDEX `id_state` (`id_state`) ,
	CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_state`) REFERENCES `controle_de_estoque`.`states` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

-- Cria a tabela Produtos --
CREATE TABLE `products` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`name` VARCHAR(50) NOT NULL,
	`value_medium` FLOAT(12) NULL DEFAULT '0',
	`url_img_product` VARCHAR(120) NULL DEFAULT '' 
	
);


-- Cria a tabela Entradas --
CREATE TABLE `entry` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`name_product` VARCHAR(50) NOT NULL,
	`date_time` DATETIME NOT NULL,
	`name_supplier` VARCHAR(50) NOT NULL,
	`value_product` FLOAT(12) NOT NULL DEFAULT '0',
	`quant_product` INT(11) NOT NULL DEFAULT '0',
	`value_total` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
	`expirion_date` VARCHAR(10) NULL DEFAULT,
	`id_supplier` INT(11) NOT NULL,
	`id_product` INT(11) NOT NULL,
	INDEX `id_supplier` (`id_supplier`) ,
	INDEX `id_product` (`id_product`) ,
	CONSTRAINT `entry_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `controle_de_estoque`.`supplier` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `entry_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `controle_de_estoque`.`products` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);


-- Cria a tabela Saídas --
CREATE TABLE `exits` (
	`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	`name_product` VARCHAR(50) NOT NULL ,
	`date_exit` DATETIME NOT NULL,
	`value_product` DECIMAL(7,2) NOT NULL,
	`quant_exit` INT(11) NOT NULL DEFAULT '0',
	`value_total` DECIMAL(10,2) NOT NULL,
	`id_entry` INT(11) NOT NULL,
	`id_product` INT(11) NOT NULL,
	INDEX `id_product` (`id_product`) ,
	CONSTRAINT `exits_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `controle_de_estoque`.`products` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
);

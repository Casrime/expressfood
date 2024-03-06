DROP DATABASE IF EXISTS `expressfood`;

CREATE DATABASE IF NOT EXISTS `expressfood` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `expressfood`;

CREATE TABLE IF NOT EXISTS `client` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(100) NOT NULL,
    `lastname` VARCHAR(100) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `zipCode` VARCHAR(10) NOT NULL,
    `city` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(60) NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `meal` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `type` VARCHAR(100) NOT NULL,
    `isDailyDish` TINYINT(1) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `description` TEXT NOT NULL,
    `price` INTEGER NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `delivery_man` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(100) NOT NULL,
    `lastname` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(60) NOT NULL,
    `status` TINYINT(1) NOT NULL,
    `position` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `order` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `client_id` INTEGER NOT NULL,
    `delivery_man_id` INTEGER NULL,
    `paidStatus` TINYINT(1) NOT NULL DEFAULT 0, -- 0: not paid, 1: paid on delivery, 2: paid online
    `status` TINYINT(1) NOT NULL, -- 0: not delivered, 1: in progress, 2: delivered
    `createdAt` DATETIME NOT NULL,
    `updatedAt` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`client_id`) REFERENCES `client`(`id`),
    FOREIGN KEY (`delivery_man_id`) REFERENCES `delivery_man`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `order_meal` (
    `order_id` INTEGER NOT NULL,
    `meal_id` INTEGER NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `order`(`id`),
    FOREIGN KEY (`meal_id`) REFERENCES `meal`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO client
(firstname, lastname, address, zipCode, city, phone, email, password, createdAt, updatedAt)
VALUES
('Jean', 'Dupont', '10 rue de Vaugirard', '75006', 'Paris', '+33612345678', 'jean@dupont.fr', 'P@ssw0rd1234', DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
('Carla', 'José', '20 rue de la Paix', '75002', 'Paris', '+33687654321', 'carla@jose.com', 'P@ssw0rd5678', DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
('Julien', 'Genty', '30 rue de la République', '75001', 'Paris', '+33654321678', 'julien-genty@ovh.fr', 'P@ssw0rd8765', NOW(), NOW()),
('Marie', 'Lefevre', '40 rue de la Liberté', '75003', 'Paris', '+33612348765', 'marielefevre@gmail.com', 'P@ssw0rd4321', NOW(), NOW());

INSERT INTO meal
(name, type, isDailyDish, quantity, description, price, createdAt, updatedAt)
VALUES
('Poulet rôti', 'Plat', 1, 10, 'Poulet rôti accompagné de pommes de terre et de légumes', 12, NOW(), NOW()),
('Poisson du jour', 'Plat', 1, 20, 'Poisson du jour accompagné de riz et de légumes', 14, NOW(), NOW()),
('Tarte aux pommes', 'Dessert', 1, 25, 'Tarte aux pommes maison', 5, NOW(), NOW()),
('Poulet curry', 'Plat', 0, 20, 'Poulet curry accompagné de riz', 11, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
('Poisson pané', 'Plat', 0, 10, 'Poisson pané accompagné de frites', 13, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
('Mousse au chocolat', 'Dessert', 0, 18, 'Mousse au chocolat maison', 6, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
('Saumon fumé tagliatelles', 'Plat', 0, 15, 'Saumon fumé accompagné de tagliatelles', 15, NOW(), NOW()),
('Salade de fruits', 'Dessert', 0, 12, 'Salade de fruits frais', 7, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
('Lasagnes végétariennes', 'Plat', 0, 15, 'Lasagnes végétariennes', 10, NOW(), NOW()),
('Tiramisu', 'Dessert', 1, 0, 'Tiramisu maison', 8, NOW(), NOW());

INSERT INTO delivery_man
(firstname, lastname, phone, email, password, status, position, createdAt, updatedAt)
VALUES
('Pierre', 'Martin', '+33612345678', 'pierre-martin-livraison@expressfood.fr', 'P@ssw0rd9876', 1, 'available', DATE_SUB(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 7 DAY)),
('Luc', 'Dubois', '+33687654321', 'luc-dubois-livraison@expressfood.fr', 'P@ssw0rd5432', 1, 'available', DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY));

INSERT INTO `order`
(client_id, delivery_man_id, paidStatus, status, createdAt, updatedAt)
VALUES
(1, 1, 2, 2, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
(2, 2, 1, 2, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)),
(3, 1, 1, 2, DATE_SUB(NOW(), INTERVAL 1 HOUR), DATE_SUB(NOW(), INTERVAL 10 MINUTE)),
(4, 2, 2, 1, DATE_SUB(NOW(), INTERVAL 30 MINUTE), DATE_SUB(NOW(), INTERVAL 5 MINUTE)),
(1, NULL, 2, 0, DATE_SUB(NOW(), INTERVAL 15 MINUTE), DATE_SUB(NOW(), INTERVAL 15 MINUTE)),
(2, 2, 2, 0, DATE_SUB(NOW(), INTERVAL 3 MINUTE), NOW());

INSERT INTO `order_meal`
(order_id, meal_id)
VALUES
(1, 5),
(1, 6),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 1),
(2, 2),
(2, 2),
(2, 2),
(2, 2),
(2, 2),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(2, 10),
(3, 4),
(3, 5),
(3, 6),
(3, 6),
(4, 5),
(4, 6),
(5, 1),
(5, 3),
(6, 2),
(6, 6);

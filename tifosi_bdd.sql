-- Création de la base de données et des tables
DROP DATABASE IF EXISTS tifosi;
CREATE DATABASE tifosi;
USE tifosi;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Structure des tables

-- Table achete
DROP TABLE IF EXISTS achete;
CREATE TABLE IF NOT EXISTS achete (
  id_client int NOT NULL,
  id_focaccia int NOT NULL,
  jour date NOT NULL,
  PRIMARY KEY (id_client,id_focaccia,jour),
  KEY id_focaccia (id_focaccia)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table boisson
DROP TABLE IF EXISTS boisson;
CREATE TABLE IF NOT EXISTS boisson (
  id_boisson int NOT NULL,
  nom_boisson varchar(45) DEFAULT NULL,
  id_marque int DEFAULT NULL,
  PRIMARY KEY (id_boisson),
  KEY id_marque (id_marque)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table client
DROP TABLE IF EXISTS client;
CREATE TABLE IF NOT EXISTS client (
  id_client int NOT NULL,
  nom_client varchar(45) DEFAULT NULL,
  age int DEFAULT NULL,
  cp_client int DEFAULT NULL,
  PRIMARY KEY (id_client)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table comprend
DROP TABLE IF EXISTS comprend;
CREATE TABLE IF NOT EXISTS comprend (
  id_focaccia int NOT NULL,
  id_ingredient int NOT NULL,
  PRIMARY KEY (id_focaccia,id_ingredient),
  KEY id_ingredient (id_ingredient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table contient
DROP TABLE IF EXISTS contient;
CREATE TABLE IF NOT EXISTS contient (
  id_menu int NOT NULL,
  id_boisson int NOT NULL,
  PRIMARY KEY (id_menu,id_boisson),
  KEY id_boisson (id_boisson)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table focaccia
DROP TABLE IF EXISTS focaccia;
CREATE TABLE IF NOT EXISTS focaccia (
  id_focaccia int NOT NULL,
  nom_focaccia varchar(45) DEFAULT NULL,
  prix_focaccia float DEFAULT NULL,
  PRIMARY KEY (id_focaccia)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table ingredient
DROP TABLE IF EXISTS ingredient;
CREATE TABLE IF NOT EXISTS ingredient (
  id_ingredient int NOT NULL,
  nom_ingredient varchar(45) DEFAULT NULL,
  PRIMARY KEY (id_ingredient)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table marque
DROP TABLE IF EXISTS marque;
CREATE TABLE IF NOT EXISTS marque (
  id_marque int NOT NULL,
  nom_marque varchar(45) DEFAULT NULL,
  PRIMARY KEY (id_marque)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table menu
DROP TABLE IF EXISTS menu;
CREATE TABLE IF NOT EXISTS menu (
  id_menu int NOT NULL,
  nom_menu varchar(45) DEFAULT NULL,
  prix_menu float DEFAULT NULL,
  id_focaccia int DEFAULT NULL,
  PRIMARY KEY (id_menu),
  KEY id_focaccia (id_focaccia)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Table paye
DROP TABLE IF EXISTS paye;
CREATE TABLE IF NOT EXISTS paye (
  id_client int NOT NULL,
  id_menu int NOT NULL,
  jour date NOT NULL,
  PRIMARY KEY (id_client,id_menu,jour),
  KEY id_menu (id_menu)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Ajout des contraintes pour les clés étrangères

-- Table achete
ALTER TABLE achete
  ADD CONSTRAINT achete_ibfk_1 FOREIGN KEY (id_client) REFERENCES client (id_client),
  ADD CONSTRAINT achete_ibfk_2 FOREIGN KEY (id_focaccia) REFERENCES focaccia (id_focaccia);

-- Table boisson
ALTER TABLE boisson
  ADD CONSTRAINT boisson_ibfk_1 FOREIGN KEY (id_marque) REFERENCES marque (id_marque);

-- Table comprend
ALTER TABLE comprend
  ADD CONSTRAINT comprend_ibfk_1 FOREIGN KEY (id_focaccia) REFERENCES focaccia (id_focaccia),
  ADD CONSTRAINT comprend_ibfk_2 FOREIGN KEY (id_ingredient) REFERENCES ingredient (id_ingredient);

-- Table contient
ALTER TABLE contient
  ADD CONSTRAINT contient_ibfk_1 FOREIGN KEY (id_menu) REFERENCES menu (id_menu),
  ADD CONSTRAINT contient_ibfk_2 FOREIGN KEY (id_boisson) REFERENCES boisson (id_boisson);

-- Table menu
ALTER TABLE menu
  ADD CONSTRAINT menu_ibfk_1 FOREIGN KEY (id_focaccia) REFERENCES focaccia (id_focaccia);

-- Table paye
ALTER TABLE paye
  ADD CONSTRAINT paye_ibfk_1 FOREIGN KEY (id_client) REFERENCES client (id_client),
  ADD CONSTRAINT paye_ibfk_2 FOREIGN KEY (id_menu) REFERENCES menu (id_menu);

COMMIT;

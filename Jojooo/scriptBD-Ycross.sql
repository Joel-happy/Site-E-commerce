CREATE TABLE Client(
   IdClient INT AUTO_INCREMENT,
   Nom VARCHAR(50) NOT NULL,
   Prenom VARCHAR(50) NOT NULL,
   AddresseMail VARCHAR(50) NOT NULL UNIQUE,
   MotDePasse VARCHAR(255) NOT NULL,
   DateDeNaissance DATE NOT NULL,
   NumeroDeTelephone VARCHAR(15) NOT NULL,
   Anciennete DATE NOT NULL,
   PRIMARY KEY(IdClient)
);

CREATE TABLE Adresse(
   IdAdresse INT AUTO_INCREMENT,
   TypeAdresse VARCHAR(20) NOT NULL,
   NomDuDestinataire VARCHAR(50) NOT NULL,
   Adresse VARCHAR(50) NOT NULL,
   Ville VARCHAR(20) NOT NULL,
   NumeroDeTelephone VARCHAR(15) NOT NULL,
   CodePostal VARCHAR(5) NOT NULL,
   Pays VARCHAR(50) NOT NULL,
   IdClient INT NOT NULL,
   PRIMARY KEY(IdAdresse),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient)
);

CREATE TABLE Motos(
   IdMoto INT AUTO_INCREMENT,
   NomMoto VARCHAR(50) NOT NULL,
   Constructeur VARCHAR(30) NOT NULL,
   Modele VARCHAR(30) NOT NULL,
   DescriptionDuProduit VARCHAR(200) NOT NULL,
   Prix DECIMAL(10,2) NOT NULL,
   Stock INT NOT NULL,
   PRIMARY KEY(IdMoto)
);

CREATE TABLE Panier(
   IdPanier INT AUTO_INCREMENT,
   Quantite BIGINT NOT NULL,
   IdClient INT NOT NULL,
   PRIMARY KEY(IdPanier),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient)
);

CREATE TABLE Commande(
   IdCommandes INT AUTO_INCREMENT,
   DatedeCommande DATETIME NOT NULL,
   StatusDeLaCommande VARCHAR(15) NOT NULL,
   IdAdresse INT NOT NULL,
   IdClient INT NOT NULL,
   PRIMARY KEY(IdCommandes),
   FOREIGN KEY(IdAdresse) REFERENCES Adresse(IdAdresse),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient)
);

CREATE TABLE Facture(
   IdFactures INT AUTO_INCREMENT,
   DatedeFacturation DATETIME NOT NULL,
   MontantTotal DECIMAL(10,2) NOT NULL,
   IdClient INT NOT NULL,
   PRIMARY KEY(IdFactures),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient)
);

CREATE TABLE MethodeDePaiement(
   IdPaiement INT AUTO_INCREMENT,
   TypePaiement VARCHAR(20) NOT NULL,
   InformationsDePaiement VARCHAR(100) NOT NULL,
   PRIMARY KEY(IdPaiement)
);

CREATE TABLE Utilise(
   IdPaiement INT,
   IdClient INT,
   PRIMARY KEY(IdPaiement, IdClient),
   FOREIGN KEY(IdPaiement) REFERENCES MethodeDePaiement(IdPaiement),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient)
);

CREATE TABLE Choisit(
   IdClient INT,
   IdMoto INT,
   PRIMARY KEY(IdClient, IdMoto),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient),
   FOREIGN KEY(IdMoto) REFERENCES Motos(IdMoto)
);

CREATE TABLE Inclut(
   IdMoto INT,
   IdCommandes INT,
   PRIMARY KEY(IdMoto, IdCommandes),
   FOREIGN KEY(IdMoto) REFERENCES Motos(IdMoto),
   FOREIGN KEY(IdCommandes) REFERENCES Commande(IdCommandes)
);

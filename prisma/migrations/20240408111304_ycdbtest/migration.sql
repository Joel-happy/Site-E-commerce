-- CreateTable
CREATE TABLE `adresse` (
    `IdAdresse` INTEGER NOT NULL,
    `AdresseDeFacturation` VARCHAR(30) NOT NULL,
    `AdresseDeLivraison` VARCHAR(30) NOT NULL,
    `NomDuDestinataire` VARCHAR(50) NOT NULL,
    `Adresse` VARCHAR(50) NOT NULL,
    `Ville` VARCHAR(20) NOT NULL,
    `NumeroDeTelephone` VARCHAR(16) NOT NULL,
    `CodePostal` VARCHAR(5) NOT NULL,
    `Pays` VARCHAR(50) NOT NULL,
    `IdClient` INTEGER NOT NULL,

    INDEX `IdClient`(`IdClient`),
    PRIMARY KEY (`IdAdresse`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `choisit` (
    `IdClient` INTEGER NOT NULL,
    `IdMoto` INTEGER NOT NULL,

    INDEX `IdMoto`(`IdMoto`),
    PRIMARY KEY (`IdClient`, `IdMoto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `IdClient` INTEGER NOT NULL AUTO_INCREMENT,
    `Nom` VARCHAR(50) NOT NULL,
    `Prenom` VARCHAR(50) NOT NULL,
    `AddresseMail` VARCHAR(20) NOT NULL,
    `MotDePasse` VARCHAR(50) NOT NULL,
    `DateDeNaissance` TEXT NULL,
    `NumeroDeTelephone` TEXT NOT NULL,
    `Anciennete` TEXT NULL,

    UNIQUE INDEX `client_AddresseMail_key`(`AddresseMail`),
    PRIMARY KEY (`IdClient`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `commande` (
    `IdCommandes` INTEGER NOT NULL,
    `DatedeCommande` DATETIME(0) NOT NULL,
    `StatusDeLaCommande` VARCHAR(15) NOT NULL,
    `IdAdresse` INTEGER NOT NULL,
    `IdClient` INTEGER NOT NULL,

    INDEX `IdAdresse`(`IdAdresse`),
    INDEX `IdClient`(`IdClient`),
    PRIMARY KEY (`IdCommandes`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `facture` (
    `IdFactures` INTEGER NOT NULL,
    `DatedeFacturation` DATETIME(0) NOT NULL,
    `MontantTotal` DECIMAL(10, 2) NOT NULL,
    `IdClient` INTEGER NOT NULL,

    INDEX `IdClient`(`IdClient`),
    PRIMARY KEY (`IdFactures`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `inclut` (
    `IdMoto` INTEGER NOT NULL,
    `IdCommandes` INTEGER NOT NULL,

    INDEX `IdCommandes`(`IdCommandes`),
    PRIMARY KEY (`IdMoto`, `IdCommandes`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `methodedepaiement` (
    `IdPaiement` INTEGER NOT NULL,
    `TypePaiement` VARCHAR(20) NOT NULL,
    `InformationsDePaiement` VARCHAR(100) NOT NULL,

    PRIMARY KEY (`IdPaiement`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `motos` (
    `IdMoto` INTEGER NOT NULL,
    `NomMoto` VARCHAR(50) NOT NULL,
    `Constructeur` VARCHAR(30) NOT NULL,
    `Modele` VARCHAR(30) NOT NULL,
    `DescriptionDuProduit` VARCHAR(200) NOT NULL,
    `Prix` DECIMAL(10, 2) NOT NULL,
    `Stock` INTEGER NOT NULL,

    PRIMARY KEY (`IdMoto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `panier` (
    `IdPanier` INTEGER NOT NULL,
    `Quantite` BIGINT NOT NULL,
    `IdClient` INTEGER NOT NULL,

    INDEX `IdClient`(`IdClient`),
    PRIMARY KEY (`IdPanier`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `utilise` (
    `IdPaiement` INTEGER NOT NULL,
    `IdClient` INTEGER NOT NULL,

    INDEX `IdClient`(`IdClient`),
    PRIMARY KEY (`IdPaiement`, `IdClient`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

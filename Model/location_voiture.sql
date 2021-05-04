
--
-- Structure de la table `Entreprises`
--
CREATE TABLE `Entreprises` (
    `IdEntreprise` INT UNIQUE NOT NULL AUTO_INCREMENT, 
    `Marque` VARCHAR(32) NOT NULL,     
    `MotdePasse` VARCHAR(50) NOT NULL, 
    `Email` VARCHAR(50) UNIQUE NOT NULL
);


-- --------------------------------------------------------

--
-- Structure de la table `Loueurs`
--
CREATE TABLE `Loueurs` (
    `IdLoueur` INT UNIQUE NOT NULL AUTO_INCREMENT, 
    `Marque` VARCHAR(32) NOT NULL, 
    `MotdePasse` VARCHAR(50) NOT NULL, 
    `Email` VARCHAR(50) UNIQUE NOT NULL
);

-- --------------------------------------------------------

--
-- Structure de la table `Vehicule`
--
CREATE TABLE `Vehicules` (
    `IdVehicule` INT UNIQUE NOT NULL AUTO_INCREMENT,
    `IdLoueur` INT NOT NULL,
    `Type` VARCHAR(32) NOT NULL,
    `Prix` INT NOT NULL,
	`Caracteristiques` VARCHAR(255) NOT NULL,
    `Location` VARCHAR(32) NOT NULL,
    `Photo` VARCHAR(32) NOT NULL
);




-- --------------------------------------------------------

--
-- Structure de la table `Facturation`
--
CREATE TABLE  `Facturation` (
    `IdFacturation`INT UNIQUE NOT NULL AUTO_INCREMENT,
    `IdEntreprise` INT NOT NULL,
    `MontantTotal` DECIMAL(13,2) NOT NULL,
    `Reglement` VARCHAR(3) NOT NULL
);



-- --------------------------------------------------------
--
-- Structure de la table `LignesFacturation`
--

CREATE TABLE  `LignesFacturation` (
    `IdLignesFacturation` INT UNIQUE NOT NULL AUTO_INCREMENT,
    `IdFacturation` INT NOT NULL,
    `IdVehicule` INT NOT NULL ,
    `DateDebut` DATE NOT NULL,
    `DateFin` DATE NOT NULL
);



-- --------------------------------------------------------
--
-- Alter table
--

ALTER TABLE Entreprises
	ADD PRIMARY KEY (`IdEntreprise`);
	
ALTER TABLE Loueurs
	ADD PRIMARY KEY (`IdLoueur`);
	
ALTER TABLE Vehicules
	ADD PRIMARY KEY(`idVehicule`),
	ADD FOREIGN KEY (`IdLoueur`) REFERENCES `Loueurs` (`IdLoueur`) 
     ON DELETE CASCADE
     ON UPDATE CASCADE;
	
ALTER TABLE Facturation
	ADD PRIMARY KEY (`IdFacturation`),
	ADD FOREIGN KEY (`IdEntreprise`) REFERENCES `Entreprises` (`IdEntreprise`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE;
	
ALTER TABLE LignesFacturation
	ADD PRIMARY KEY (`IdLignesFacturation`),
	ADD FOREIGN KEY (`IdFacturation`) REFERENCES `Facturation` (`IdFacturation`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
	ADD FOREIGN KEY (`IdVehicule`) REFERENCES `Vehicules` (`IdVehicule`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE;

-- ------------------------------------------------------
-- Contenu de la table `Entreprises `
--
INSERT INTO `Entreprises` (`Marque`, `MotdePasse`, `Email`) VALUES
('Technicolor', '7c222fb2927d828af22f592134e8932480637c0d', 'technicolor@gmail.com'),
('Sogeca', '7c222fb2927d828af22f592134e8932480637c0d', 'sogeca@hotmail.fr'),
('Kering', '7c222fb2927d828af22f592134e8932480637c0d', 'kering@outlook.fr'),
('Bertuly', '7c222fb2927d828af22f592134e8932480637c0d', 'bertuly@yahoo.com');

--
-- Contenu de la table `Loueurs `
--
INSERT INTO `Loueurs` (`Marque`, `MotdePasse`, `Email`) VALUES
('Peugeot', '7c222fb2927d828af22f592134e8932480637c0d', 'peugeot@gmail.com'),
('Renault', '7c222fb2927d828af22f592134e8932480637c0d', 'renault@gmail.com'),
('Ford', '7c222fb2927d828af22f592134e8932480637c0d', 'ford@gmail.com'),
('Mercedes-Benz', '7c222fb2927d828af22f592134e8932480637c0d', 'mercedesbenz@gmail.com'),
('Mini', '7c222fb2927d828af22f592134e8932480637c0d', 'mini@gmail.com'),
('Land Rover', '7c222fb2927d828af22f592134e8932480637c0d', 'landrover@gmail.com'),
('Tesla', '7c222fb2927d828af22f592134e8932480637c0d', 'tesla@gmail.com');

--
-- Contenu de la table `Vehicule `
--

INSERT INTO `Vehicules` (`IdLoueur`, `Type`, `Prix`,`Caracteristiques`, `Location`, `Photo`) VALUES
('6', 'Crossovers', 49, 'Diesel 5 places', 'Disponible', 'LandRover.jpg'),
('4', '4x4', 49, 'Automatique 5 places', 'En revision', 'Mercedes-Benz.jpg'),
('5', 'Monospace', 19, 'Biocarburant 5 places', 'Disponible', 'Mini.jpg'),
('2', 'Citadines', 29, 'Automatique 5 places', 'En revision', 'Renault.jpg'),
('7', 'Berlines', 49, 'Automatique 5 places', 'Disponible', 'Tesla.jpg');

--
-- Contenu de la table `Facturation `
--
INSERT INTO `Facturation` (`IdEntreprise`, `MontantTotal`, `Reglement`) VALUES
(1, 0, 'Oui'),
(2, 0, 'Non'),
(3, 0, 'Oui');

--
-- Contenu de la table `LignesFacturation `
--
INSERT INTO `LignesFacturation` (`IdFacturation`, `IdVehicule`, `DateDebut`, `DateFin`) VALUES
(1, 4, '2021-03-09', '2021-04-12'),
(2, 2, '2021-10-26', '2021-11-03'),
(3, 3, '2021-08-10', '2021-09-22');
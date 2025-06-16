-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 16 juin 2025 à 12:55
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb_ap2`
--

-- --------------------------------------------------------

--
-- Structure de la table `allergiemedicament`
--

CREATE TABLE `allergiemedicament` (
  `AllergiesAllergieId` int(11) NOT NULL,
  `MedicamentsMedicamentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allergiemedicament`
--

INSERT INTO `allergiemedicament` (`AllergiesAllergieId`, `MedicamentsMedicamentId`) VALUES
(5, 1),
(7, 2),
(4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `allergiepatient`
--

CREATE TABLE `allergiepatient` (
  `AllergiesAllergieId` int(11) NOT NULL,
  `PatientsPatientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `allergies`
--

CREATE TABLE `allergies` (
  `AllergieId` int(11) NOT NULL,
  `Libelle_al` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `allergies`
--

INSERT INTO `allergies` (`AllergieId`, `Libelle_al`) VALUES
(1, 'Pénicilline'),
(2, 'Acariens'),
(3, 'Pollen'),
(4, 'Lactose'),
(5, 'Gluten'),
(6, 'Amoxicilline'),
(7, 'Arachides');

-- --------------------------------------------------------

--
-- Structure de la table `antecedentmedicament`
--

CREATE TABLE `antecedentmedicament` (
  `AntecedentsAntecedentId` int(11) NOT NULL,
  `MedicamentsMedicamentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `antecedentmedicament`
--

INSERT INTO `antecedentmedicament` (`AntecedentsAntecedentId`, `MedicamentsMedicamentId`) VALUES
(2, 2),
(3, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `antecedentpatient`
--

CREATE TABLE `antecedentpatient` (
  `AntecedentsAntecedentId` int(11) NOT NULL,
  `PatientsPatientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `antecedents`
--

CREATE TABLE `antecedents` (
  `AntecedentId` int(11) NOT NULL,
  `Libelle_a` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `antecedents`
--

INSERT INTO `antecedents` (`AntecedentId`, `Libelle_a`) VALUES
(1, 'Asthme'),
(2, 'Diabète'),
(3, 'Dépression'),
(4, 'Cholécystectomie'),
(5, 'Insuffisance rénale'),
(6, 'Hypothyroïdie');

-- --------------------------------------------------------

--
-- Structure de la table `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetroles`
--

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `aspnetusers`
--

CREATE TABLE `aspnetusers` (
  `Id` varchar(255) NOT NULL,
  `Date_naissance_m` datetime(6) NOT NULL,
  `Role` longtext NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `aspnetusers`
--

INSERT INTO `aspnetusers` (`Id`, `Date_naissance_m`, `Role`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('1e925659-d44a-4963-8021-46140979ead8', '2024-11-20 00:00:00.000000', 'Médecin Généraliste', 'OUDARD', 'OUDARD', NULL, NULL, 0, 'AQAAAAIAAYagAAAAECf+VT3IgfCnbaqaggnNMXFauq/vVVa3NmTgBjvYE88LVMEFjUgglkWTYh2lWta4rA==', 'KPTLPZJDZP4YO7XE5MFKA43BWG7DQFBR', 'b67fffea-d49c-4ec2-aafa-f9f37de6a4fb', NULL, 0, 0, NULL, 1, 0),
('57e17f4b-f2fa-4a79-80b5-7d72f5d43b18', '2024-10-31 00:00:00.000000', 'Medecin', 'ALLIER', 'ALLIER', NULL, NULL, 0, 'AQAAAAIAAYagAAAAEPMoHsqduEVXzfhqJNWnJyL/QGQbrLbVa86SV+zXc8cFRXro3uVjBJ//txy40i6vBg==', 'HPSODRE2IZTWQE2XX4E5YX2RZ2FOUMDE', '9b2e7f25-da2c-4660-8f75-8c2ee3b1e862', NULL, 0, 0, NULL, 1, 0),
('57f5efad-3ba6-4d27-9621-9beedda468e9', '2024-12-27 00:00:00.000000', 'Administrateur', 'rprpr', 'RPRPR', NULL, NULL, 0, 'AQAAAAIAAYagAAAAELqwNmlNVgBUwrd04/vWju3CrOWABSJGUkY+h64gka2AwtxjltyH6aF8Cav7GslRvQ==', 'W3YGFHPXTOAASNANEKREP54NGGFLTEH7', 'f3a4656d-ff64-4bfb-9b92-864afeb9ec92', NULL, 0, 0, NULL, 1, 0),
('580afc8f-61fe-44a3-8f2f-0f7a9c42f22d', '2024-12-25 00:00:00.000000', 'Medecin', 'rrrr', 'RRRR', NULL, NULL, 0, 'AQAAAAIAAYagAAAAEMr+3TCFFIYSnMhNej1cFKcDy2tGlIri4w8dojq6Bmwy8T5Y1aVB86annGSIZW69ow==', 'OWXE2ZZZR456XQOGB3MS4MWKZHKHMYWS', '25792770-b95f-44b8-959d-589a12d48e1a', NULL, 0, 0, NULL, 1, 0),
('8311e920-4caf-43d2-acb1-6ee52b7ffbd9', '2024-12-20 00:00:00.000000', 'r', 'r', 'R', NULL, NULL, 0, 'AQAAAAIAAYagAAAAEKyq+yk8FgalAEry8R7sb3JCNfMSZo+/6P7g7ASm6xZZabuHj90rrMrlOXmghRUyyw==', 'ZMSFYIIYQJZE6NXEDYJLHYKSWHPPYXRR', '94a9f49d-e72b-46ef-8428-f04076795e38', NULL, 0, 0, NULL, 1, 0),
('877f650f-85a5-473c-835d-d4720a1f7aef', '2024-12-04 00:00:00.000000', 'Administrateur', 'rr', 'RR', NULL, NULL, 0, 'AQAAAAIAAYagAAAAEJ1MQjQBduRE0JUlGcqoKjRbN6rRXfl9ZggRvuWGwuotm25aHXv765rdkd9PSdMpig==', '7SM6F7BWM73PH74IBNCE2PUOKDDHTZY4', 'eaaf7279-18c4-4cbf-ace1-6b22485d59b7', NULL, 0, 0, NULL, 1, 0),
('aca7338d-c405-4493-a094-503353470c9d', '2024-12-04 00:00:00.000000', 'Medecin', 'te', 'TE', NULL, NULL, 0, 'AQAAAAIAAYagAAAAEPHZv+A3/EsRIDkWXyq1FsgYMg8d+ud6+KWHhYul0mw0k3hXGqwR1zTE9jumXbKxbA==', 'HLHIETX3VA25MROHM455542CHDQI6XB7', 'b1676793-3656-42c8-a179-165b924b15ea', NULL, 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(128) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `medicaments`
--

CREATE TABLE `medicaments` (
  `MedicamentId` int(11) NOT NULL,
  `Libelle_med` longtext NOT NULL,
  `Contr_indication` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medicaments`
--

INSERT INTO `medicaments` (`MedicamentId`, `Libelle_med`, `Contr_indication`) VALUES
(1, 'Spagulax', 'À prendre à distance des autres médicaments'),
(2, 'Lucemyra', 'Surveillance glycémique nécessaire | Risque de réaction allergique grave'),
(3, 'Cortancyl', 'Ne pas arrêter brutalement | Surveillance psychologique nécessaire'),
(4, 'Calcium-Sandoz ', 'Surveillance fonction rénale | Risque de calculs rénaux'),
(5, 'Smecta', 'Bien s\'hydrater | Prendre à distance des autres médicaments (2h)');

-- --------------------------------------------------------

--
-- Structure de la table `ordonnancemedicament`
--

CREATE TABLE `ordonnancemedicament` (
  `MedicamentsMedicamentId` int(11) NOT NULL,
  `OrdonnancesOrdonnanceId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `ordonnances`
--

CREATE TABLE `ordonnances` (
  `OrdonnanceId` int(11) NOT NULL,
  `Posologie` longtext NOT NULL,
  `Date_Debut` datetime(6) NOT NULL,
  `Date_Fin` datetime(6) NOT NULL,
  `Instructions_specifique` longtext,
  `MedecinId` varchar(255) NOT NULL,
  `PatientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `PatientId` int(11) NOT NULL,
  `Nom_p` longtext NOT NULL,
  `Prenom_p` longtext NOT NULL,
  `Sexe_p` longtext NOT NULL,
  `Num_secu` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`PatientId`, `Nom_p`, `Prenom_p`, `Sexe_p`, `Num_secu`) VALUES
(1, 'ALLIER', 'Estéban', 'm', '1599889748878'),
(2, 'DIHN', 'Antoine', 'm', '1048792845850'),
(3, 'OUDARD', 'Emma', 'f', '1789582984154'),
(4, 'MAZERON', 'Madelaine', 'f', '1020668764949');

-- --------------------------------------------------------

--
-- Structure de la table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20241120152855_MigrationsData', '8.0.1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `allergiemedicament`
--
ALTER TABLE `allergiemedicament`
  ADD PRIMARY KEY (`AllergiesAllergieId`,`MedicamentsMedicamentId`),
  ADD KEY `IX_AllergieMedicament_MedicamentsMedicamentId` (`MedicamentsMedicamentId`);

--
-- Index pour la table `allergiepatient`
--
ALTER TABLE `allergiepatient`
  ADD PRIMARY KEY (`AllergiesAllergieId`,`PatientsPatientId`),
  ADD KEY `IX_AllergiePatient_PatientsPatientId` (`PatientsPatientId`);

--
-- Index pour la table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`AllergieId`);

--
-- Index pour la table `antecedentmedicament`
--
ALTER TABLE `antecedentmedicament`
  ADD PRIMARY KEY (`AntecedentsAntecedentId`,`MedicamentsMedicamentId`),
  ADD KEY `IX_AntecedentMedicament_MedicamentsMedicamentId` (`MedicamentsMedicamentId`);

--
-- Index pour la table `antecedentpatient`
--
ALTER TABLE `antecedentpatient`
  ADD PRIMARY KEY (`AntecedentsAntecedentId`,`PatientsPatientId`),
  ADD KEY `IX_AntecedentPatient_PatientsPatientId` (`PatientsPatientId`);

--
-- Index pour la table `antecedents`
--
ALTER TABLE `antecedents`
  ADD PRIMARY KEY (`AntecedentId`);

--
-- Index pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Index pour la table `aspnetroles`
--
ALTER TABLE `aspnetroles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Index pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Index pour la table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Index pour la table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Index pour la table `aspnetusers`
--
ALTER TABLE `aspnetusers`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Index pour la table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Index pour la table `medicaments`
--
ALTER TABLE `medicaments`
  ADD PRIMARY KEY (`MedicamentId`);

--
-- Index pour la table `ordonnancemedicament`
--
ALTER TABLE `ordonnancemedicament`
  ADD PRIMARY KEY (`MedicamentsMedicamentId`,`OrdonnancesOrdonnanceId`),
  ADD KEY `IX_OrdonnanceMedicament_OrdonnancesOrdonnanceId` (`OrdonnancesOrdonnanceId`);

--
-- Index pour la table `ordonnances`
--
ALTER TABLE `ordonnances`
  ADD PRIMARY KEY (`OrdonnanceId`),
  ADD KEY `IX_Ordonnances_MedecinId` (`MedecinId`),
  ADD KEY `IX_Ordonnances_PatientId` (`PatientId`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`PatientId`);

--
-- Index pour la table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `allergies`
--
ALTER TABLE `allergies`
  MODIFY `AllergieId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `antecedents`
--
ALTER TABLE `antecedents`
  MODIFY `AntecedentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medicaments`
--
ALTER TABLE `medicaments`
  MODIFY `MedicamentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `ordonnances`
--
ALTER TABLE `ordonnances`
  MODIFY `OrdonnanceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patients`
--
ALTER TABLE `patients`
  MODIFY `PatientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `allergiemedicament`
--
ALTER TABLE `allergiemedicament`
  ADD CONSTRAINT `FK_AllergieMedicament_Allergies_AllergiesAllergieId` FOREIGN KEY (`AllergiesAllergieId`) REFERENCES `allergies` (`AllergieId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AllergieMedicament_Medicaments_MedicamentsMedicamentId` FOREIGN KEY (`MedicamentsMedicamentId`) REFERENCES `medicaments` (`MedicamentId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `allergiepatient`
--
ALTER TABLE `allergiepatient`
  ADD CONSTRAINT `FK_AllergiePatient_Allergies_AllergiesAllergieId` FOREIGN KEY (`AllergiesAllergieId`) REFERENCES `allergies` (`AllergieId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AllergiePatient_Patients_PatientsPatientId` FOREIGN KEY (`PatientsPatientId`) REFERENCES `patients` (`PatientId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `antecedentmedicament`
--
ALTER TABLE `antecedentmedicament`
  ADD CONSTRAINT `FK_AntecedentMedicament_Antecedents_AntecedentsAntecedentId` FOREIGN KEY (`AntecedentsAntecedentId`) REFERENCES `antecedents` (`AntecedentId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AntecedentMedicament_Medicaments_MedicamentsMedicamentId` FOREIGN KEY (`MedicamentsMedicamentId`) REFERENCES `medicaments` (`MedicamentId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `antecedentpatient`
--
ALTER TABLE `antecedentpatient`
  ADD CONSTRAINT `FK_AntecedentPatient_Antecedents_AntecedentsAntecedentId` FOREIGN KEY (`AntecedentsAntecedentId`) REFERENCES `antecedents` (`AntecedentId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AntecedentPatient_Patients_PatientsPatientId` FOREIGN KEY (`PatientsPatientId`) REFERENCES `patients` (`PatientId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ordonnancemedicament`
--
ALTER TABLE `ordonnancemedicament`
  ADD CONSTRAINT `FK_OrdonnanceMedicament_Medicaments_MedicamentsMedicamentId` FOREIGN KEY (`MedicamentsMedicamentId`) REFERENCES `medicaments` (`MedicamentId`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_OrdonnanceMedicament_Ordonnances_OrdonnancesOrdonnanceId` FOREIGN KEY (`OrdonnancesOrdonnanceId`) REFERENCES `ordonnances` (`OrdonnanceId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ordonnances`
--
ALTER TABLE `ordonnances`
  ADD CONSTRAINT `FK_Ordonnances_AspNetUsers_MedecinId` FOREIGN KEY (`MedecinId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Ordonnances_Patients_PatientId` FOREIGN KEY (`PatientId`) REFERENCES `patients` (`PatientId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

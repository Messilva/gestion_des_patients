-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2021 at 11:53 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_patients`
--

-- --------------------------------------------------------

--
-- Table structure for table `affectations`
--

CREATE TABLE `affectations` (
  `id` int(11) UNSIGNED NOT NULL,
  `service_affect` varchar(300) NOT NULL,
  `hopital_affect` varchar(300) NOT NULL,
  `id_medecin` int(11) UNSIGNED NOT NULL,
  `id_patient` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `affectations`
--

INSERT INTO `affectations` (`id`, `service_affect`, `hopital_affect`, `id_medecin`, `id_patient`) VALUES
(1, 'aa', 'hopital mustapha bacha', 2, 1),
(2, 'mus', 'mus', 2, 1),
(3, '222', 'bejia', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_medecin` int(11) UNSIGNED NOT NULL,
  `id_patient` int(11) UNSIGNED NOT NULL,
  `date_consultation` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`id`, `id_medecin`, `id_patient`, `date_consultation`) VALUES
(1, 2, 1, '2021-09-15'),
(2, 2, 1, '2021-09-08'),
(3, 2, 1, '2021-09-08'),
(4, 2, 2, '2021-09-30'),
(5, 2, 1, '2021-08-30');

-- --------------------------------------------------------

--
-- Table structure for table `dossierpatients`
--

CREATE TABLE `dossierpatients` (
  `id` int(11) UNSIGNED NOT NULL,
  `idPatient` int(11) UNSIGNED NOT NULL,
  `dateCreation` date NOT NULL,
  `diagnostique` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ordonnances`
--

CREATE TABLE `ordonnances` (
  `id` int(11) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `dateDescription` date NOT NULL,
  `id_medecin` int(11) UNSIGNED NOT NULL,
  `id_patient` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ordonnances`
--

INSERT INTO `ordonnances` (`id`, `description`, `dateDescription`, `id_medecin`, `id_patient`) VALUES
(1, 'description ici', '2021-09-08', 2, 1),
(2, 'some description', '2021-09-18', 2, 1),
(3, 'hvfcgh', '2021-09-26', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(300) NOT NULL,
  `prenom` varchar(300) NOT NULL,
  `age` int(2) NOT NULL,
  `telephone` int(20) NOT NULL,
  `sex` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `nom`, `prenom`, `age`, `telephone`, `sex`) VALUES
(1, 'patient 12', 'patient 1', 25, 550505050, 1),
(2, 'patient 2334444', 'patient 23333', 14, 5555, 1),
(4, 'qqs', 'qs', 19, 5555, 1),
(5, 'testing', 'testing', 15, 550643563, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personnels`
--

CREATE TABLE `personnels` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(300) NOT NULL,
  `prenom` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `telephone` int(20) NOT NULL,
  `specialite` varchar(300) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `motpasse` varchar(100) NOT NULL,
  `type` enum('admin','medecine','agent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `personnels`
--

INSERT INTO `personnels` (`id`, `nom`, `prenom`, `email`, `telephone`, `specialite`, `pseudo`, `motpasse`, `type`) VALUES
(1, 'admin', 'admin', 'abgrcs@gmail.com', 550505050, 'admin', 'admin', 'admin', 'admin'),
(2, 'medecine1', 'medecine1', 'abgrcs2@gmail.com', 550505050, 'admin', 'medecine1', 'medecine1', 'medecine'),
(5, 'agent1', 'agent1', 'abgrcs2@gmail.com', 550505050, 'admin', 'agent1', 'agent1', 'agent'),
(6, 'medecine 2', 'medecine 2', 'medecine2@gmail.com', 550505050, 'medecine de traivaile', 'medecine3', 'medecine3', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `id_per` int(11) UNSIGNED NOT NULL,
  `id_patient` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rendez_vous`
--

INSERT INTO `rendez_vous` (`id`, `date`, `heure`, `id_per`, `id_patient`) VALUES
(4, '2021-09-18', '10:30:00', 2, 1),
(5, '2021-09-18', '10:30:00', 2, 1),
(6, '2021-09-18', '10:32:00', 2, 1),
(7, '2021-09-20', '10:30:00', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affectations`
--
ALTER TABLE `affectations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medecin` (`id_medecin`),
  ADD KEY `id_patient` (`id_patient`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medecin` (`id_medecin`),
  ADD KEY `id_patient` (`id_patient`);

--
-- Indexes for table `dossierpatients`
--
ALTER TABLE `dossierpatients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPatient` (`idPatient`);

--
-- Indexes for table `ordonnances`
--
ALTER TABLE `ordonnances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medecin` (`id_medecin`),
  ADD KEY `id_patient` (`id_patient`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personnels`
--
ALTER TABLE `personnels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Indexes for table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_per` (`id_per`),
  ADD KEY `id_patient` (`id_patient`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affectations`
--
ALTER TABLE `affectations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `dossierpatients`
--
ALTER TABLE `dossierpatients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ordonnances`
--
ALTER TABLE `ordonnances`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `personnels`
--
ALTER TABLE `personnels`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `affectations`
--
ALTER TABLE `affectations`
  ADD CONSTRAINT `affectations_ibfk_1` FOREIGN KEY (`id_medecin`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `affectations_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_ibfk_1` FOREIGN KEY (`id_medecin`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consultations_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dossierpatients`
--
ALTER TABLE `dossierpatients`
  ADD CONSTRAINT `dossierpatients_ibfk_1` FOREIGN KEY (`idPatient`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordonnances`
--
ALTER TABLE `ordonnances`
  ADD CONSTRAINT `ordonnances_ibfk_1` FOREIGN KEY (`id_medecin`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordonnances_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD CONSTRAINT `rendez_vous_ibfk_1` FOREIGN KEY (`id_per`) REFERENCES `personnels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendez_vous_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

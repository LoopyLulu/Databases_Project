-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2024 at 01:52 PM
-- Server version: 10.6.16-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aim4fn_a`
--

-- --------------------------------------------------------

--
-- Table structure for table `Project_Allergens`
--

CREATE TABLE `Project_Allergens` (
  `allergen_ID` int(11) NOT NULL,
  `allergen_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_Allergens`
--

INSERT INTO `Project_Allergens` (`allergen_ID`, `allergen_name`) VALUES
(1, 'Eggs'),
(2, 'Fish'),
(3, 'Shellfish'),
(4, 'Tree_Nuts'),
(5, 'Peanuts'),
(6, 'Wheat'),
(7, 'Soybeans'),
(8, 'Sesame'),
(10, 'Milk');

-- --------------------------------------------------------

--
-- Table structure for table `Project_Company`
--

CREATE TABLE `Project_Company` (
  `company_name` varchar(255) DEFAULT NULL,
  `company_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_Company`
--

INSERT INTO `Project_Company` (`company_name`, `company_ID`) VALUES
('PepsiCo', 1),
('Coca-Cola', 2),
('Unilever', 3),
('Tyson Foods', 4),
('Kraft Heinz', 5),
('General Mills', 6),
('Mondelez International', 7),
('Conagra Brands', 8),
('Campbell Soup Company', 9),
('Nestle', 10);

-- --------------------------------------------------------

--
-- Table structure for table `Project_ContainsAllergen`
--

CREATE TABLE `Project_ContainsAllergen` (
  `SnackID` int(11) NOT NULL,
  `milk` int(11) NOT NULL DEFAULT 0 CHECK (`milk` >= 0 and `milk` <= 1),
  `eggs` int(11) NOT NULL DEFAULT 0 CHECK (`eggs` >= 0 and `eggs` <= 1),
  `fish` int(11) NOT NULL DEFAULT 0 CHECK (`fish` >= 0 and `fish` <= 1),
  `shellfish` int(11) NOT NULL DEFAULT 0 CHECK (`shellfish` >= 0 and `shellfish` <= 1),
  `tree_nuts` int(11) NOT NULL DEFAULT 0 CHECK (`tree_nuts` >= 0 and `tree_nuts` <= 1),
  `peanuts` int(11) NOT NULL DEFAULT 0 CHECK (`peanuts` >= 0 and `peanuts` <= 1),
  `wheat` int(11) NOT NULL DEFAULT 0 CHECK (`wheat` >= 0 and `wheat` <= 1),
  `soybeans` int(11) NOT NULL DEFAULT 0 CHECK (`soybeans` >= 0 and `soybeans` <= 1),
  `sesame` int(11) NOT NULL DEFAULT 0 CHECK (`sesame` >= 0 and `sesame` <= 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_ContainsAllergen`
--

INSERT INTO `Project_ContainsAllergen` (`SnackID`, `milk`, `eggs`, `fish`, `shellfish`, `tree_nuts`, `peanuts`, `wheat`, `soybeans`, `sesame`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(5, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(8, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(9, 0, 0, 1, 0, 0, 0, 0, 1, 0),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Project_FavoritesTable`
--

CREATE TABLE `Project_FavoritesTable` (
  `favorite_ID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `snack_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_FavoritesTable`
--

INSERT INTO `Project_FavoritesTable` (`favorite_ID`, `userID`, `snack_ID`) VALUES
(1, 10, 5),
(2, 1, 4),
(3, 2, 3),
(4, 2, 2),
(5, 2, 1),
(6, 3, 10),
(7, 3, 9),
(8, 4, 8),
(9, 4, 7),
(10, 5, 6),
(11, 5, 5),
(12, 6, 4),
(13, 7, 3),
(14, 8, 2),
(15, 8, 1),
(16, 9, 10),
(17, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Project_HasAllergy`
--

CREATE TABLE `Project_HasAllergy` (
  `userID` int(11) NOT NULL,
  `milk` int(11) NOT NULL DEFAULT 0 CHECK (`milk` >= 0 and `milk` <= 1),
  `eggs` int(11) NOT NULL DEFAULT 0 CHECK (`eggs` >= 0 and `eggs` <= 1),
  `fish` int(11) NOT NULL DEFAULT 0 CHECK (`fish` >= 0 and `fish` <= 1),
  `shellfish` int(11) NOT NULL DEFAULT 0 CHECK (`shellfish` >= 0 and `shellfish` <= 1),
  `tree_nuts` int(11) NOT NULL DEFAULT 0 CHECK (`tree_nuts` >= 0 and `tree_nuts` <= 1),
  `peanuts` int(11) NOT NULL DEFAULT 0 CHECK (`peanuts` >= 0 and `peanuts` <= 1),
  `wheat` int(11) NOT NULL DEFAULT 0 CHECK (`wheat` >= 0 and `wheat` <= 1),
  `soybeans` int(11) NOT NULL DEFAULT 0 CHECK (`soybeans` >= 0 and `soybeans` <= 1),
  `sesame` int(11) NOT NULL DEFAULT 0 CHECK (`sesame` >= 0 and `sesame` <= 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_HasAllergy`
--

INSERT INTO `Project_HasAllergy` (`userID`, `milk`, `eggs`, `fish`, `shellfish`, `tree_nuts`, `peanuts`, `wheat`, `soybeans`, `sesame`) VALUES
(1, 1, 0, 0, 1, 0, 0, 0, 0, 0),
(2, 0, 1, 0, 0, 0, 0, 1, 0, 1),
(3, 1, 1, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 1, 0, 0, 1, 0, 0, 1),
(5, 0, 1, 0, 1, 0, 0, 0, 0, 0),
(6, 1, 1, 0, 0, 0, 0, 0, 0, 1),
(7, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(8, 0, 1, 0, 0, 1, 0, 0, 0, 1),
(9, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Project_Login`
--

CREATE TABLE `Project_Login` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_Login`
--

INSERT INTO `Project_Login` (`userID`, `username`) VALUES
(10, 'alex2000'),
(6, 'allab'),
(3, 'anna_banana'),
(8, 'best_kai'),
(1, 'c00lestAnon'),
(7, 'igor_m'),
(4, 'josh_user'),
(5, 'lulu_h'),
(2, 'maxypaxy'),
(9, 'vika');

-- --------------------------------------------------------

--
-- Table structure for table `Project_Login_Password`
--

CREATE TABLE `Project_Login_Password` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_Login_Password`
--

INSERT INTO `Project_Login_Password` (`username`, `password`) VALUES
('alex2000', 'B@d_P@$$w0rd'),
('allab', 'lo2I_#Ell'),
('anna_banana', '1_h@t3_bananas'),
('best_kai', 'G3n$h1n'),
('c00lestAnon', 'Qwerty12345!'),
('igor_m', '23o59_Da%'),
('josh_user', 'g00d_p@s$w0rd'),
('lulu_h', '83tt3r_p@5$w0rd_LOL'),
('maxypaxy', 'o4-i5-2ooE'),
('vika', '1itt13_mi$$_Li1ith');

-- --------------------------------------------------------

--
-- Table structure for table `Project_MakesSnacks`
--

CREATE TABLE `Project_MakesSnacks` (
  `company_ID` int(11) NOT NULL,
  `snack_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_MakesSnacks`
--

INSERT INTO `Project_MakesSnacks` (`company_ID`, `snack_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Project_Manipulates`
--

CREATE TABLE `Project_Manipulates` (
  `userID` int(11) NOT NULL,
  `snack_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_Manipulates`
--

INSERT INTO `Project_Manipulates` (`userID`, `snack_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Project_Snack`
--

CREATE TABLE `Project_Snack` (
  `Sname` varchar(255) DEFAULT NULL,
  `snack_ID` int(11) NOT NULL,
  `ingredients` varchar(255) DEFAULT NULL,
  `allergens` int(11) DEFAULT NULL CHECK (`allergens` >= 0 and `allergens` <= 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_Snack`
--

INSERT INTO `Project_Snack` (`Sname`, `snack_ID`, `ingredients`, `allergens`) VALUES
('Tostitos', 1, 'Corn, Vegetable Oil, Salt', 0),
('Fairlife Milk', 2, 'Reduced Fat Milk, Sugar, Alkalized Cocoa', 1),
('Ben & Jerry\'s Vanilla Ice Cream', 3, ' Cream, Milk, Water, Egg Yolks, Sugar, Vanilla Beans', 1),
('Marinated Dark Chicken Meat', 4, 'Water, Sesame Oil, Rice Starch, Salt, Garlic Powder', 1),
('Heinz Ketchup', 5, ' Tomato, Vinegar, Treenut Extract, Corn Syrup, Salt, Onion Powder', 0),
('Chex Mix', 6, 'Corn Meal, Whole Wheat, Enriched Flour, Vegetable Oil, Sugar', 1),
('Clif Bar', 7, 'Rolled Oats, Soybeans, Unsweetened Chocolate, Soybean Oil, Salt, Cinnamon', 1),
('Mixed Nuts', 8, 'Peanuts, Sweetened Chocolate, Sesame Oil, Salt', 1),
('Fish Flakes', 9, 'Fish, salt, Soybean Oil', 1),
('Corn Flakes', 10, 'Corn, Sugar, Salt, Barley Malt Extract', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Project_User`
--

CREATE TABLE `Project_User` (
  `userID` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Project_User`
--

INSERT INTO `Project_User` (`userID`, `name`, `email`) VALUES
(1, 'Anon', 'mstk3@virginia.edu'),
(2, 'Max', 'max@virginia.edu'),
(3, 'Anna', 'anna@virginia.edu'),
(4, 'Josh', 'josh@virginia.edu'),
(5, 'Lulu', 'lulu@virginia.edu'),
(6, 'Alla', 'alla@virginia.edu'),
(7, 'Igor', 'igor@virginia.edu'),
(8, 'Kailey', 'kailey@virginia.edu'),
(9, 'Victoria', 'victoria@virginia.edu'),
(10, 'Alex', 'alex@virginia.edu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Project_Allergens`
--
ALTER TABLE `Project_Allergens`
  ADD PRIMARY KEY (`allergen_ID`);

--
-- Indexes for table `Project_Company`
--
ALTER TABLE `Project_Company`
  ADD PRIMARY KEY (`company_ID`);

--
-- Indexes for table `Project_ContainsAllergen`
--
ALTER TABLE `Project_ContainsAllergen`
  ADD PRIMARY KEY (`SnackID`);

--
-- Indexes for table `Project_FavoritesTable`
--
ALTER TABLE `Project_FavoritesTable`
  ADD PRIMARY KEY (`favorite_ID`);

--
-- Indexes for table `Project_HasAllergy`
--
ALTER TABLE `Project_HasAllergy`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `Project_Login`
--
ALTER TABLE `Project_Login`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `Project_Login_Password`
--
ALTER TABLE `Project_Login_Password`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `Project_MakesSnacks`
--
ALTER TABLE `Project_MakesSnacks`
  ADD PRIMARY KEY (`snack_ID`);

--
-- Indexes for table `Project_Manipulates`
--
ALTER TABLE `Project_Manipulates`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `Project_Snack`
--
ALTER TABLE `Project_Snack`
  ADD PRIMARY KEY (`snack_ID`);

--
-- Indexes for table `Project_User`
--
ALTER TABLE `Project_User`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Project_Allergens`
--
ALTER TABLE `Project_Allergens`
  MODIFY `allergen_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Project_Company`
--
ALTER TABLE `Project_Company`
  MODIFY `company_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Project_ContainsAllergen`
--
ALTER TABLE `Project_ContainsAllergen`
  MODIFY `SnackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Project_FavoritesTable`
--
ALTER TABLE `Project_FavoritesTable`
  MODIFY `favorite_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `Project_HasAllergy`
--
ALTER TABLE `Project_HasAllergy`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Project_Login`
--
ALTER TABLE `Project_Login`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Project_Snack`
--
ALTER TABLE `Project_Snack`
  MODIFY `snack_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Project_User`
--
ALTER TABLE `Project_User`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

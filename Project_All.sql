CREATE TABLE Project_Allergens
   (allergen_ID INT NOT NULL AUTO_INCREMENT,
    allergen_name VARCHAR(255), 
    PRIMARY KEY(allergen_ID));

INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (10, "Milk");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (1, "Eggs");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (2, "Fish");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (3, "Shellfish");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (4, "Tree_Nuts");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (5, "Peanuts");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (6, "Wheat");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (7, "Soybeans");
INSERT INTO Project_Allergens (allergen_ID, allergen_Name) values (8, "Sesame");

CREATE TABLE Project_Company
   (company_name VARCHAR(255),
    company_ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(company_ID));

INSERT INTO Project_Company (company_name, company_ID) values ("Nestle", 10);
INSERT INTO Project_Company (company_name, company_ID) values ("PepsiCo", 1);
INSERT INTO Project_Company (company_name, company_ID) values ("Coca-Cola", 2);
INSERT INTO Project_Company (company_name, company_ID) values ("Unilever", 3);
INSERT INTO Project_Company (company_name, company_ID) values ("Tyson Foods", 4);
INSERT INTO Project_Company (company_name, company_ID) values ("Kraft Heinz", 5);
INSERT INTO Project_Company (company_name, company_ID) values ("General Mills", 6);
INSERT INTO Project_Company (company_name, company_ID) values ("Mondelez International", 7);
INSERT INTO Project_Company (company_name, company_ID) values ("Conagra Brands", 8);
INSERT INTO Project_Company (company_name, company_ID) values ("Campbell Soup Company", 9);

CREATE TABLE Project_ContainsAllergen
   (SnackID INT NOT NULL AUTO_INCREMENT,
    milk INT NOT NULL DEFAULT 0 
    CHECK (milk >= 0 AND milk <= 1),
    eggs INT NOT NULL DEFAULT 0
    CHECK (eggs >= 0 AND eggs <= 1),
	fish INT NOT NULL DEFAULT 0
    CHECK (fish >= 0 AND fish <= 1),
	shellfish INT NOT NULL DEFAULT 0
    CHECK (shellfish >= 0 AND shellfish<= 1),
	tree_nuts INT NOT NULL DEFAULT 0
    CHECK (tree_nuts >= 0 AND tree_nuts <= 1),
	peanuts INT NOT NULL DEFAULT 0
    CHECK (peanuts >= 0 AND peanuts <= 1),
	wheat INT NOT NULL DEFAULT 0
    CHECK (wheat >= 0 AND wheat <= 1),
     soybeans INT NOT NULL DEFAULT 0
    CHECK (soybeans >= 0 AND soybeans <= 1),
    sesame INT NOT NULL DEFAULT 0
    CHECK (sesame >= 0 AND sesame <= 1),
    PRIMARY KEY(snackID));

INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (10, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (2, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (3, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (4, 0, 0, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (5, 0, 0, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (6, 0, 0, 0, 0, 0, 0, 1, 0, 0);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (7, 0, 0, 0, 0, 0, 0, 0, 1, 0);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (8, 0, 0, 0, 0, 0, 1, 0, 0, 1);
INSERT INTO Project_ContainsAllergen (SnackID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (9, 0, 0, 1, 0, 0, 0, 0, 1, 0);

CREATE TABLE Project_FavoritesTable
   (favorite_ID INT NOT NULL AUTO_INCREMENT,
	userID INT,
    snack_ID INT, 
    PRIMARY KEY(favorite_ID));

INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (17, 10, 6);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (1, 10, 5);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (2, 1, 4);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (3, 2, 3);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (4, 2, 2);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (5, 2, 1);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (6, 3, 10);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (7, 3, 9);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (8, 4, 8);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (9, 4, 7);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (10, 5, 6);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (11, 5, 5);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (12, 6, 4);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (13, 7, 3);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (14, 8, 2);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (15, 8, 1);
INSERT INTO Project_FavoritesTable (favorite_ID, userID, snack_ID) values (16, 9, 10);

CREATE TABLE Project_HasAllergy
   (userID INT NOT NULL AUTO_INCREMENT,
    milk INT NOT NULL DEFAULT 0
    CHECK (milk >= 0 AND milk <= 1),
    eggs INT NOT NULL DEFAULT 0
    CHECK (eggs >= 0 AND eggs <= 1),
    fish INT NOT NULL DEFAULT 0    
	CHECK (fish >= 0 AND fish <= 1),
    shellfish INT NOT NULL DEFAULT 0
    CHECK (shellfish >= 0 AND shellfish <= 1),
    tree_nuts INT NOT NULL DEFAULT 0
    CHECK (tree_nuts >= 0 AND tree_nuts <= 1),
    peanuts INT NOT NULL DEFAULT 0
    CHECK (peanuts >= 0 AND peanuts <= 1),
    wheat INT NOT NULL DEFAULT 0
    CHECK (wheat >= 0 AND wheat <= 1),
    soybeans INT NOT NULL DEFAULT 0
    CHECK (soybeans >= 0 AND soybeans <= 1),
    sesame INT NOT NULL DEFAULT 0
    CHECK (sesame >= 0 AND sesame <= 1),
    PRIMARY KEY(userID));

INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (10, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (1, 1, 0, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (2, 0, 1, 0, 0, 0, 0, 1, 0, 1);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (3, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (4, 0, 0, 1, 0, 0, 1, 0, 0, 1);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (5, 0, 1, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (6, 1, 1, 0, 0, 0, 0, 0, 0, 1);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (7, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (8, 0, 1, 0, 0, 1, 0, 0, 0, 1);
INSERT INTO Project_HasAllergy (userID, milk, eggs, fish, shellfish, tree_nuts, peanuts, wheat, soybeans, sesame) values (9, 1, 1, 1, 1, 1, 1, 1, 1, 1);

CREATE TABLE Project_Login
   (userID INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL, 
    UNIQUE(username),
    PRIMARY KEY(userID));
	
INSERT INTO Project_Login (userID, username) values (10, "alex2000");
INSERT INTO Project_Login (userID, username) values (1, "c00lestAnon");
INSERT INTO Project_Login (userID, username) values (2, "maxypaxy");
INSERT INTO Project_Login (userID, username) values (3, "anna_banana");
INSERT INTO Project_Login (userID, username) values (4, "josh_user");
INSERT INTO Project_Login (userID, username) values (5, "lulu_h");
INSERT INTO Project_Login (userID, username) values (6, "allab");
INSERT INTO Project_Login (userID, username) values (7, "igor_m");
INSERT INTO Project_Login (userID, username) values (8, "best_kai");
INSERT INTO Project_Login (userID, username) values (9, "vika");

CREATE TABLE Project_Login_Password
   (username VARCHAR(255) NOT NULL, -- must be unique also 
    password VARCHAR(255) NOT NULL,
    UNIQUE(username),
    PRIMARY KEY(username));
	
INSERT INTO Project_Login_Password (username, password) values ("alex2000", "B@d_P@$$w0rd");
INSERT INTO Project_Login_Password (username, password) values ("c00lestAnon", "Qwerty12345!");
INSERT INTO Project_Login_Password (username, password) values ("maxypaxy", "o4-i5-2ooE");
INSERT INTO Project_Login_Password (username, password) values ("anna_banana", "1_h@t3_bananas");
INSERT INTO Project_Login_Password (username, password) values ("josh_user", "g00d_p@s$w0rd");
INSERT INTO Project_Login_Password (username, password) values ("lulu_h", "83tt3r_p@5$w0rd_LOL");
INSERT INTO Project_Login_Password (username, password) values ("allab", "lo2I_#Ell");
INSERT INTO Project_Login_Password (username, password) values ("igor_m", "23o59_Da%");
INSERT INTO Project_Login_Password (username, password) values ("best_kai", "G3n$h1n");
INSERT INTO Project_Login_Password (username, password) values ("vika", "1itt13_mi$$_Li1ith");

CREATE TABLE Project_MakesSnacks
   (company_ID INT NOT NULL,
    snack_ID INT,
    PRIMARY KEY(snack_ID));

INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (10, 10);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (1, 1);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (2, 2);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (3, 3);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (4, 4);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (5, 5);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (6, 6);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (7, 7);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (8, 8);
INSERT INTO Project_MakesSnacks (company_ID, snack_ID) values (9, 9);

CREATE TABLE Project_Manipulates
   (userID INT NOT NULL,
    snack_ID INT NOT NULL,
    PRIMARY KEY(userID));

INSERT INTO Project_Manipulates (userID, snack_ID) values (10, 10);
INSERT INTO Project_Manipulates (userID, snack_ID) values (1, 1);
INSERT INTO Project_Manipulates (userID, snack_ID) values (2, 2);
INSERT INTO Project_Manipulates (userID, snack_ID) values (3, 3);
INSERT INTO Project_Manipulates (userID, snack_ID) values (4, 4);
INSERT INTO Project_Manipulates (userID, snack_ID) values (5, 5);
INSERT INTO Project_Manipulates (userID, snack_ID) values (6, 6);
INSERT INTO Project_Manipulates (userID, snack_ID) values (7, 7);
INSERT INTO Project_Manipulates (userID, snack_ID) values (8, 8);
INSERT INTO Project_Manipulates (userID, snack_ID) values (9, 9);

CREATE TABLE Project_Snack
   (Sname VARCHAR(255),
    snack_ID INT NOT NULL AUTO_INCREMENT,
    ingredients VARCHAR(255),
    allergens INT
    CHECK (allergens >= 0 AND allergens <= 1),
    PRIMARY KEY(snack_ID));

INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Corn Flakes", 10, "Corn, Sugar, Salt, Barley Malt Extract", 0);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Tostitos", 1, "Corn, Vegetable Oil, Salt", 0);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Fairlife Milk", 2, "Reduced Fat Milk, Sugar, Alkalized Cocoa", 1);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Ben & Jerry's Vanilla Ice Cream", 3, " Cream, Milk, Water, Egg Yolks, Sugar, Vanilla Beans", 1);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Marinated Dark Chicken Meat", 4, "Water, Sesame Oil, Rice Starch, Salt, Garlic Powder", 1);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Heinz Ketchup", 5, " Tomato, Vinegar, Treenut Extract, Corn Syrup, Salt, Onion Powder", 0);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Chex Mix", 6, "Corn Meal, Whole Wheat, Enriched Flour, Vegetable Oil, Sugar", 1);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Clif Bar", 7, "Rolled Oats, Soybeans, Unsweetened Chocolate, Soybean Oil, Salt, Cinnamon", 1);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Mixed Nuts", 8, "Peanuts, Sweetened Chocolate, Sesame Oil, Salt", 1);
INSERT INTO Project_Snack (Sname, snack_ID, ingredients, allergens) values ("Fish Flakes", 9, "Fish, salt, Soybean Oil", 1);

CREATE TABLE Project_User
   (userID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255), 
	email VARCHAR(255),
    PRIMARY KEY(userID));

INSERT INTO Project_User (userID, name, email) values (10, "Alex", "alex@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (1, "Anon", "mstk3@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (2, "Max", "max@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (3, "Anna", "anna@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (4, "Josh", "josh@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (5, "Lulu", "lulu@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (6, "Alla", "alla@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (7, "Igor", "igor@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (8, "Kailey", "kailey@virginia.edu");
INSERT INTO Project_User (userID, name, email) values (9, "Victoria", "victoria@virginia.edu");



SELECT password
FROM Project_Login_Password
Where username = ‘(x)’;


SELECT email
FROM Project_User
WHERE username = ‘(x)’;


SELECT snack_ID, ingredients
FROM Project_Snack
WHERE ingredients LIKE ‘%(x)%’;


SELECT snack_ID, Sname, ingredients
FROM Project_Snack NATURAL JOIN Project_ContainsAllergen
WHERE (x) = 0;


SELECT snack_ID, Sname, ingredients
FROM Project_Snack NATURAL JOIN Project_ContainsAllergen  
WHERE ABS(milk + eggs + fish + shellfish + tree_nuts + peanuts + wheat + soybeans + sesame) = 0
ORDER BY snack_ID;


SELECT snack_ID, Sname
FROM Project_Snack NATURAL JOIN Project_Company
WHERE company_name = ‘(x)’
ORDER BY snack_ID;


SELECT userID
FROM Project_HasAllergy NATURAL JOIN Project_Allergens
WHERE allergen_name = ‘(x)’
ORDER BY userID;


SELECT userID
FROM Project_HasAllergy
WHERE ABS(milk + eggs + fish + shellfish + tree_nuts + peanuts + wheat + soybeans + sesame) = 0
ORDER BY userID;


SELECT snack_ID, Sname, ingredients
FROM Project_FavoritesTable NATURAL JOIN Project_Snack
WHERE userID = ‘(x)’
ORDER BY snack_ID;


SELECT DISTINCT snack_ID
FROM Project_Manipulates
WHERE userID = ‘(x)’
ORDER BY snack_ID;


INSERT INTO Project_FavoritesTable(favorite_ID, userID, snack_ID) values ( _, _, _ );


INSERT INTO Project_Snack(snack_ID, Sname, ingredients, allergens) values ( _, _, _, _ );


INSERT INTO Project_User (userID, name, email) values ( _, _, _ );


INSERT INTO Project_Company(company_ID, company_name) values ( _, _);


DELETE FROM Project_FavoritesTable
WHERE userID = (x);


DELETE FROM Project_Snack
WHERE snack_ID = (x);


DELETE FROM Project_User
WHERE userID = (x);


DELETE FROM Project_Company
WHERE company_ID = (x);


UPDATE Project_Snack
SET Sname = ‘(x)’
WHERE snack_ID = (y);


UPDATE Project_Snack
SET ingredients = ‘(x)’
WHERE snack_ID = (y);


UPDATE Project_Snack
SET allergens = (x)
WHERE snack_ID = (y);


UPDATE Project_User
SET name = ‘(x)’
WHERE userID = (y);


UPDATE Project_User
SET email = ‘(x)’
WHERE userID = (y);


UPDATE Project_Company
SET company_name = ‘(x)’
WHERE company_ID = (y);


SELECT snack_ID, Sname, ingredients, allergens
FROM Project_Snack
ORDER BY snack_ID;

SELECT snack_ID, Sname, ingredients, allergens
FROM Project_Snack
ORDER BY Sname;


SELECT company_ID, company_name
FROM Project_Company
ORDER BY company_ID;

SELECT company_ID, company_name
FROM Project_Company
ORDER BY company_name;

SELECT userID, name, email
FROM Project_User
ORDER BY userID;

SELECT userID, name, email
FROM Project_User
ORDER BY name;

DELIMITER $$

CREATE TRIGGER update_ingredient_and_allergens 
AFTER UPDATE ON Project_Snack
FOR EACH ROW
BEGIN
    IF NEW.ingredients LIKE '%milk%' THEN
        UPDATE Project_ContainsAllergen SET milk = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET milk = 0 WHERE snack_ID = NEW.snack_ID;
    END IF;
    
    IF NEW.ingredients LIKE '%eggs%' THEN
        UPDATE Project_ContainsAllergen SET eggs = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET eggs = 0 WHERE snack_ID = NEW.snack_ID;
    END IF;

    IF NEW.ingredients LIKE '%fish%' THEN
        UPDATE Project_ContainsAllergen SET fish = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET fish = 0 WHERE snack_ID = NEW.snack_ID;
    END IF; 

    IF NEW.ingredients LIKE '%shellfish%' THEN
        UPDATE Project_ContainsAllergen SET shellfish = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET shellfish = 0 WHERE snack_ID = NEW.snack_ID;
    END IF; 

   IF NEW.ingredients LIKE '%tree_nuts%' THEN
        UPDATE Project_ContainsAllergen SET tree_nuts = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET tree_nuts = 0 WHERE snack_ID = NEW.snack_ID;
    END IF; 

  IF NEW.ingredients LIKE '%peanuts%' THEN
        UPDATE Project_ContainsAllergen SET peanuts = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET peanuts = 0 WHERE snack_ID = NEW.snack_ID;
    END IF; 

   IF NEW.ingredients LIKE '%wheat%' THEN
        UPDATE Project_ContainsAllergen SET wheat = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET wheat = 0 WHERE snack_ID = NEW.snack_ID;
    END IF; 

  IF NEW.ingredients LIKE '%soybeans%' THEN
        UPDATE Project_ContainsAllergen SET soybeans = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET soybeans = 0 WHERE snack_ID = NEW.snack_ID;
    END IF; 

   IF NEW.ingredients LIKE '%sesame%' THEN
        UPDATE Project_ContainsAllergen SET sesame = 1 WHERE snack_ID = NEW.snack_ID;
    ELSE
        UPDATE Project_ContainsAllergen SET sesame = 0 WHERE snack_ID = NEW.snack_ID;
    END IF; 
    
END$$

DELIMITER ;


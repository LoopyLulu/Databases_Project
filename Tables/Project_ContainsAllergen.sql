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

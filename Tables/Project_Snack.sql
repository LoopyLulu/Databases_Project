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

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

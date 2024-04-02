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

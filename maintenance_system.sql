CREATE TABLE requests(reqId INT AUTO_INCREMENT, 
                      reqDate DATE NOT NULL,
                      roomNumber VARCHAR(30), 
                      reqBy VARCHAR(60) NOT NULL,
                      repairDesc VARCHAR(255) NOT NULL,
                      reqPriority VARCHAR(10),
                      PRIMARY KEY (reqId));


CREATE TABLE Inventory (
  nameID INT NOT NULL AUTO_INCREMENT, 
  name VARCHAR(50), 
  brPrice FLOAT, 
  dvdPrice FLOAT,
  digitalPrice FLOAT,
  brQuantity INTEGER,
  dvdQuantity INTEGER,
  digitalQuantity INTEGER,

  PRIMARY KEY (nameID)
)
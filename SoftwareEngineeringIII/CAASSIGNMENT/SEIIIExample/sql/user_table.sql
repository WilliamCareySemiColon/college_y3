DROP TABLE `user`;

CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `DOB` varchar(12) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  PRIMARY KEY  (`ID`)
  );
  
  INSERT INTO user VALUES (null, "John Smith", "D Appletree sample",
  						"10/10/1996","smithj","sampleEmail@gmail.com", "password"),
  						
  						  (null, "Mary Byrne", "D Appletree sample",
  						  "10/10/1996","byrnem","sampleEmail@gmail.com","password"),
  						  
  						  (null, "Frankie Cocozza", "D Appletree sample",
  						  "10/10/1996","cocozzaf","sampleEmail@gmail.com", "password"),
  						  
  						  (null, "Patrick Jones", "D Appletree sample",
  						  "10/10/1996","jonesp","sampleEmail@gmail.com","password");

CREATE TABLE Agence (
	id int NOT NULL,
	nom varchar (200) NOT NULL,
	ville varchar (200) NOT NULL,
	actif boolean default false,
	PRIMARY KEY (id)
);

CREATE TABLE Client (
	id int NOT NULL,
	nom varchar (200) NOT NULL,
	ville varchar (200) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE Compte (
	id int NOT NULL,
	solde decimal DEFAULT 0,
	idAgence int NOT NULL,
	idClient int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (idAgence) REFERENCES Agence(id),
	FOREIGN KEY (idClient) REFERENCES Client(id)
);

CREATE TABLE Emprunt (
	id int NOT NULL,
	montant decimal NOT NULL,
	idAgence int NOT NULL,
	idClient int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (idAgence) REFERENCES Agence(id),
	FOREIGN KEY (idClient) REFERENCES Client(id)
);

INSERT INTO Agence (id, nom, ville, actif) VALUES 
(1, 'Agence de Toulouse', 'Toulouse', true),
(2, 'Agence de Madrid', 'Madrid', true),
(3, 'Agence de Lisbonne', 'Lisbonne', true),
(4, 'Agence de Tokyo', 'Tokyo', true),
(5, 'Agence de Kiev', 'Kiev', true);

INSERT INTO Client (id, nom, ville) VALUES 
(1, 'Paul', 'Paris'),
(2, 'Pierre', 'Madrid'),
(3, 'Jacques', 'Lisbonne'),
(4, 'Sangoku', 'Tokyo'),
(5, 'Jin', 'Agadir'),
(6, 'Alex', 'Toulouse'),
(7, 'Julie', 'Madrid'),
(8, 'Joe', 'Kiev'),
(9, 'Vegeta', 'Tokyo'),
(10, 'Ahmed', 'Mulhouse'),
(11, 'Charlotte', 'Oran');

INSERT INTO Compte (id, solde, idAgence, idClient) VALUES 
(1, 2000, 4, 1),
(2, 5000, 5, 7),
(3, 654, 1, 4),
(4, 10000, 2, 5),
(5, 5000, 4, 11),
(6, 9000, 1, 10),
(7, 25000, 5, 9),
(8, 1000, 1, 8),
(9, 2000, 4, 7),
(10, 20001, 1, 6),
(11, 2000, 2, 5),
(12, 2879, 2, 4),
(13, 1457, 1, 3),
(14, 7542, 5, 2),
(15, 24, 4 ,1);

INSERT INTO Emprunt (id, montant, idAgence, idClient) VALUES 
(1, 80000, 4, 1),
(2, 15000, 5, 8),
(3, 2000, 4, 4),
(4, 45000, 2, 5),
(5, 3200, 3, 1);
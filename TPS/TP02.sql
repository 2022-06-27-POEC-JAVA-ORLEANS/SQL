> psql -U postgres
	create database organismeformation;
	create user adminformation WITH ENCRYPTED PASSWORD 'admin';
	grant all privileges on database organismeformation to adminformation;




> psql -U adminformation -d organismeformation
	CREATE TABLE centre_formation (
		id SERIAL,
		nom VARCHAR(50),
		adresse VARCHAR(350),
		annee INTEGER,
		CONSTRAINT pk_centre_formation PRIMARY KEY(id)
		);
		
	CREATE TABLE formateur (
		id SERIAL,
		nom VARCHAR(50),
		prenom VARCHAR(50),
		taux INTEGER DEFAULT 350,
		CONSTRAINT pk_formateur PRIMARY KEY(id)
		);

	CREATE TABLE classe (
		code VARCHAR(50) NOT NULL,
		nbr_apprenant INTEGER DEFAULT 4,
		id_centre_formation INTEGER NOT NULL,
		id_formateur INTEGER NOT NULL,
		CONSTRAINT pk_classe PRIMARY KEY(code),
		CONSTRAINT nb_apprenants_max CHECK(nbr_apprenant<21),
		CONSTRAINT fk_centre_formation FOREIGN KEY(id_centre_formation) REFERENCES centre_formation(id),
		CONSTRAINT fk_formateur FOREIGN KEY(id_formateur) REFERENCES formateur(id)
		);

	
	insert into centre_formation values(default, 'Special Formation', '3 rue du spécial, 31100 Toulouse', 1999);
	insert into centre_formation values(default, 'SudOuest Formation', '444 route du Sud, 31100 Toulouse', 2004);
	
	insert into formateur values(default, 'Leblanc', 'José', 400);
	insert into formateur values(default, 'Bendola', 'Yemba', default);
	insert into formateur values(default, 'Saro', 'Sarah', 550);
	insert into formateur values(default, 'Bouyal', 'Eloise', 360);
	
	insert into classe values('JAVA_001', 15, 1, 1);
	insert into classe values('JAVA_002', default, 1, 2);
	insert into classe values('PYTHON_015', 15, 1, 4);
	insert into classe values('PYTHON_018', 6, 2, 1);
	insert into classe values('JAVA_008', default, 2, 3);
	insert into classe values('PYTHON_03', 20, 2, 4);
	

	select * from classe;
	select * from centre_formation ORDER BY annee;
	select nom from centre_formation WHERE annee < 2000;
	select code, nbr_apprenant from classe WHERE code LIKE '%java%'
		OR code LIKE '%Java%'
		OR code LIKE '%JAVA%';
	select nom from centre_formation WHERE annee < 2000;
	select * from formateur WHERE taux > 299 AND taux < 501;  / select * from formateur WHERE taux BETWEEN 299 AND 501;
	select code from classe ORDER BY nbr_apprenant DESC LIMIT 3;
	
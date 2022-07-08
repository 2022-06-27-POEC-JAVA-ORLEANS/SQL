> psql -U postgres
	create database restaurant;
	create user restaurateur WITH ENCRYPTED PASSWORD 'restau';
	grant all privileges on database restaurant to restaurateur
	

> psql -U restaurateur -d restaurant
	CREATE TABLE restaurant (
		code VARCHAR(6) NOT NULL,
		nom VARCHAR(50) NOT NULL,
		adresse TEXT NOT NULL,
		nb_table INTEGER DEFAULT 10 NOT NULL,
		statut BOOLEAN NOT NULL,
		CONSTRAINT pk_restaurant PRIMARY KEY(code)
		);
		
	CREATE TABLE salarie (
		id SERIAL NOT NULL,
		nom VARCHAR(50) NOT NULL,
		prenom VARCHAR(50),
		salaire DECIMAL DEFAULT 1645.58 NOT NULL,
		code_restaurant VARCHAR(6) NOT NULL,
		CONSTRAINT pk_salarie PRIMARY KEY(id),
		CONSTRAINT salaire_min CHECK(salaire>=1645.58),
		CONSTRAINT fk_salarie FOREIGN KEY(code_restaurant) REFERENCES restaurant(code)
		);
		
	CREATE TABLE menu (
		id SERIAL NOT NULL,
		nom VARCHAR(50) NOT NULL,
		prix DECIMAL(3,2) DEFAULT 10 NOT NULL,
		code_restaurant VARCHAR(6) NOT NULL,
		CONSTRAINT pk_menu PRIMARY KEY(id),
		CONSTRAINT menu_min CHECK(prix>=9.99 AND prix<=15),
		CONSTRAINT fk_menu FOREIGN KEY(code_restaurant) REFERENCES restaurant(code)
		);
		
	CREATE TABLE client (
		num VARCHAR(20) NOT NULL,
		budget_max DECIMAL(5,2) NOT NULL,
		CONSTRAINT pk_client PRIMARY KEY(num)
		);
		
	CREATE TABLE repas (
		id SERIAL NOT NULL,
		date DATE NOT NULL,
		prix_paye DECIMAL(6,2) NOT NULL,
		code_restaurant VARCHAR(6) NOT NULL,
		num_client VARCHAR(20) NOT NULL,
		CONSTRAINT pk_repas PRIMARY KEY(id),
		CONSTRAINT fk_repas_1 FOREIGN KEY(code_restaurant) REFERENCES restaurant(code),
		CONSTRAINT fk_repas_2 FOREIGN KEY(num_client) REFERENCES client(num)
		);
		
		
		
		
		
		
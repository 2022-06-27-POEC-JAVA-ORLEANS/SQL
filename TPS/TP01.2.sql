> psql -U postgres
	create database site_internet;
	create user usersite WITH ENCRYPTED PASSWORD 'usersite';
	grant all privileges on database site_internet to usersite;

> psql -U usersite -d site_internet
	CREATE TABLE site (
		url VARCHAR(50),
		lanqgue VARCHAR(50),
		CONSTRAINT pk_site PRIMARY KEY(url)
		);

	CREATE TABLE page (
		id SERIAL,
		titre VARCHAR(50) NOT NULL,
		contenu VARCHAR(50),
		nb_ligne INTEGER,
		date_cretation DATE,
		date_miseajour DATE,
		url_site VARCHAR(50) NOT NULL,
		CONSTRAINT pk_page PRIMARY KEY(id),
		CONSTRAINT nb_ligne_max CHECK(nb_ligne<1001),
		CONSTRAINT fk_site FOREIGN KEY(url_site) REFERENCES site(url)
		);


	
	insert into site(url, lanqgue) values('http://mysite.fr', 'FR');
	
	insert into page(titre, contenu, nb_ligne, url_site) values('Accueil', 'Page dacceuil', 300, 'http://mysite.fr');
	insert into page(titre, contenu, nb_ligne, url_site) values('Page 1', 'Ma premiere page', 128, 'http://mysite.fr');
	insert into page(titre, contenu, nb_ligne, url_site) values('Page 2', 'Ma troisieme page', 489, 'http://mysite.fr');
	insert into page(titre, contenu, nb_ligne, url_site) values('Page 3', 'Ma quatrieme page', 999, 'http://mysite.fr');
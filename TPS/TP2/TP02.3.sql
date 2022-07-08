> psql -U adminformation -d organismeformation
	select sum(nbr_apprenant) from classe;
	select count(id) as nb_formateur from formateur;
	select avg(taux) from formateur;
	
	select code, nbr_apprenant, nom, prenom from classe 
		INNER JOIN formateur
		ON classe.id_formateur = formateur.id;
		
	select code, nom from classe 
		INNER JOIN centre_formation
		ON classe.id_centre_formation = centre_formation.id
		WHERE nbr_apprenant >10;
		
	select nom, code, nbr_apprenant from centre_formation
		INNER JOIN classe
		ON classe.id_centre_formation = centre_formation.id;
		
	 create view list_class as select code, nom from classe
		INNER JOIN formateur
		ON classe.id_formateur = formateur.id;
	
	select * from list_class;
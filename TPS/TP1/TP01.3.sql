> psql -U usersite -d site_internet
	ALTER TABLE page ADD COLUMN path_photos VARCHAR(100);
	ALTER TABLE page ALTER COLUMN path_photos SET DEFAULT 'no path';
	UPDATE page SET path_photos = default;
	UPDATE page SET nb_ligne = 250 WHERE nb_ligne > 250;
	ALTER TABLE page ADD CONSTRAINT max_nb_ligne CHECK(nb_ligne <= 250);

> pg_dump -U usersite -d site_internet > db_site.pgsql

> psql -U postgres
	CREATE DATABASE site_internet_v2;
	grant all privileges on database site_internet_v2 to usersite;
	
> psql -U postgres site_internet_v2 < db_site.pgsql

> psql -U usersite -d site_internet_v2
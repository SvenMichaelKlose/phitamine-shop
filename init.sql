DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	alias VARCHAR(255) UNIQUE KEY,
	password VARCHAR(32) NOT NULL,
	email VARCHAR(255) NOT NULL,
	f_registered BOOLEAN NOT NULL DEFAULT 0,
	t_registered DATETIME
);

DROP TABLE IF EXISTS images;
CREATE TABLE images (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
	title VARCHAR(255) DEFAULT '',
	type VARCHAR(255) DEFAULT 'image/plain',
	country VARCHAR(255) DEFAULT '',
    price DECIMAL(8,2) DEFAULT '0.0',
	t_create DATETIME NOT NULL,
	f_public BOOLEAN NOT NULL DEFAULT 0,
	id_user INT NOT NULL
);

INSERT INTO users (alias, password, email, f_registered, t_registered)
VALUES ('pixel', md5('pixel'), 'pixel@copei.de', TRUE, '2012-03-01 16:45:00');

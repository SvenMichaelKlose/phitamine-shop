;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-sql-table users user
	(id                 "INT PRIMARY KEY AUTO_INCREMENT")
	(alias              "VARCHAR(255) UNIQUE KEY")
	(password           "VARCHAR(32) NOT NULL")
	(email              "VARCHAR(255) NOT NULL")
	(f_registered       "BOOLEAN NOT NULL DEFAULT 0")
	(t_registered       "DATETIME"))

(define-sql-table images image
	(id                 "INT PRIMARY KEY AUTO_INCREMENT")
	(name               "VARCHAR(255) NOT NULL")
	(title              "VARCHAR(255) DEFAULT ''")
	(price              "DECIMAL(8,2) DEFAULT '0.00'")
	(t_create           "DATETIME NOT NULL")
	(f_public           "BOOLEAN NOT NULL DEFAULT 0")
	(id_user            "INT NOT NULL"))

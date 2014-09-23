;;;;; Copyright (c) 2012,2014 Sven Michael Klose <pixel@copei.de>

(include "config.php")

(db-connect)
(phitamine)

(princ ,(format nil "<!DOCTYPE HTML>~%"))
(princ (tpl-main))

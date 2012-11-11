;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun tpl-gallery-title-page ()
  (+ "(" (lang de "Seite" en "page") " " *gallery-page* ")"))

(defun tpl-gallery-title ()
  (!? *gallery-country*
      (+ (lang de "Briefmarken aus "
               en "Stamps from ")
         !)
      (lang de "Briefmarken aus verschiedenen L&auml;ndern"
            en "Stamps from different countries")))

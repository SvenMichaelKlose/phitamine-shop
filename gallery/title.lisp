;;;;; Copyright (c) 2012–2013 Sven Michael Klose <pixel@copei.de>

(def-pagination tpl-gallery-title-page (pagination)
  (+ "(" (lang de "Seite" en "page") " " page ")"))

(defun tpl-gallery-title ()
  (!? *gallery-country*
      (+ (lang de "Briefmarken aus "
               en "Stamps from ")
         !)
      (lang de "Briefmarken aus verschiedenen L&auml;ndern"
            en "Stamps from different countries")))

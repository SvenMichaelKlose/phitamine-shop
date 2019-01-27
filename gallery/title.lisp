(def-pagination tpl-gallery-title-page (pagination)
  (+ "(" (lang de "Seite" en "page") " " page ")"))

(fn tpl-gallery-title ()
  (!? *gallery-country*
      (+ (lang de "Briefmarken aus "
               en "Stamps from ")
         !)
      (lang de "Briefmarken aus verschiedenen L&auml;ndern"
            en "Stamps from different countries")))

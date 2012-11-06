(h1 ,(!? *gallery-country*
         (+ (lang de "Briefmarken aus "
                  en "Stamps from ")
            !)
         (lang de "Briefmarken aus verschiedenen L&auml;ndern"
               en "Stamps from different countries")))
,@(gallery-browser)
(form :class "imageform"
      :action ,(action-url t :params (list (cons :action "update-images")))
      :method "post"
  ,@(& (logged-in?)
       `((input :class "imagesubmit" :type "submit" :value ,(lang de "Aktualisieren..."
                                                                  en "Update..."))))
  ,@(template-param :images))
,@(gallery-browser)

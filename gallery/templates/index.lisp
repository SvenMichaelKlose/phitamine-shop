(h1 ,(tpl-gallery-title) (br) ,(tpl-gallery-title-page))
,@(tpl-gallery-browser)
,@(? (logged-in?)
     `((form :class "imageform"
             :action ,(action-url :add 'gallery-update-images)
             :method "post"
         (input :class "imagesubmit" :type "submit" :value ,(lang de "Aktualisieren..."
                                                                  en "Update..."))
         ,(param 'images)))
     (list (param 'images)))

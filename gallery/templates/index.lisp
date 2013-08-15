(h1 ,(tpl-gallery-title) (br) ,(tpl-gallery-title-page (param 'pagination)))
,@(tpl-gallery-browser (param 'pagination) (param 'images))
,@(? (logged-in?)
     `((form :class  "imageform"
             :action ,(action-url :add 'gallery-update-images)
             :method "post"
         (input :class "imagesubmit" :type "submit" :value ,(lang de "Aktualisieren..."
                                                                  en "Update..."))
         ,(param 'lml-images)))
     (list (param 'lml-images)))

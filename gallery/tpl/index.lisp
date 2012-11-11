(h1 ,(tpl-gallery-title) (br) ,(tpl-gallery-title-page))
,@(tpl-gallery-browser)
(form :class "imageform"
      :action ,(action-url :add 'update-images)
      :method "post"
  ,@(& (logged-in?)
       `((input :class "imagesubmit" :type "submit" :value ,(lang de "Aktualisieren..."
                                                                  en "Update..."))))
  ,@(template-param 'images))

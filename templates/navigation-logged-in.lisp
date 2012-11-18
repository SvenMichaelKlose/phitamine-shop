(a :href ,(param 'link-home)    ,(lang de "Galerie" en "Gallery"))
(a :href ,(param 'link-upload)  ,(lang de "Upload" en "Upload"))
(a :href ,(param 'link-contact) ,(lang de "Kontakt" en "Contact"))
(a :href ,(param 'link-imprint) ,(lang de "Impressum" en "Imprint"))
(a :href ,(param 'link-logout)  ,(lang de "Logout" en "Logout"))
,(tpl-gallery-country-selection)
,@(when (string== "pixel" (user-alias))
    `((form :action ,(action-url :add 'css-upload)
            :method "post"
            :enctype "multipart/form-data"
            :class "css_upload"
        (input :type "file" :name "css[]" :size "10")(br)
        (input :type "submit" :value "Upload CSS..."))))

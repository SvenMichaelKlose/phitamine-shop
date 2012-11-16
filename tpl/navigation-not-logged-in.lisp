(a :href ,(param 'link-home)    ,(lang de "Galerie" en "Gallery"))
,@(& (has-cart?)
     `((a :href ,(param 'link-cart)
         ,(lang de "Warenkorb" en "Cart") " (" ,(cart-num-items) " " ,(lang de "Artikel" en "items") ")")))
(a :href ,(param 'link-contact) ,(lang de "Kontakt" en "Contact"))
(a :href ,(param 'link-imprint) ,(lang de "Impressum" en "Imprint"))
(a :href ,(param 'link-login)   ,(lang de "Login" en "Login"))
,(tpl-gallery-country-selection)
(form :action ,(action-url :add 'css-upload)
      :method "post"
      :enctype "multipart/form-data"
      :class "css_upload"
  (input :type "file" :name "css[]" :size "10")
  (br)
  (input :type "submit" :value "Upload CSS..."))

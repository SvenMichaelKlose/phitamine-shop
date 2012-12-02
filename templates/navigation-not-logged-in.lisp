(a :href ,(param 'link-home)    ,(lang de "Galerie" en "Gallery"))
,@(& *have-cart?*
     (has-cart?)
     `((a :href ,(param 'link-cart)
         (img :src ,(+ *base-url* "/media/korb_gelb.png")) "x" ,(cart-num-items))))
(a :href ,(param 'link-contact) ,(lang de "Kontakt" en "Contact"))
(a :href ,(param 'link-imprint) ,(lang de "Impressum" en "Imprint"))
(a :href ,(param 'link-login)   ,(lang de "Login" en "Login"))
,(tpl-gallery-country-selection)
,@(& *have-css-upload?*
     `((form :action ,(action-url :add 'css-upload)
             :method "post"
             :enctype "multipart/form-data"
             :class "css_upload"
         (input :type "file" :name "css[]")
         (br)
         (input :type "submit" :value "Upload CSS..."))))

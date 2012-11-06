(a :href ,@(template-param :link-home) ,(lang de "Galerie" en "Gallery"))
,(& (has-cart?)
    `(a :href ,@(template-param :link-cart) ,(lang de "Warenkorb" en "Cart") " (" ,(length (cart-current)) " " ,(lang de "Artikel" en "items") ")"))
(a :href ,@(template-param :link-contact) ,(lang de "Kontakt" en "Contact"))
(a :href ,@(template-param :link-imprint) ,(lang de "Impressum" en "Imprint"))
(a :href ,@(template-param :link-login) ,(lang de "Login" en "Login"))
,(gallery-country-selection)
(form :action ,(action-url t :params (list (cons :action "css-upload")))
      :method "post"
      :enctype "multipart/form-data"
      :class "css_upload"
  (input :type "file" :name "css[]" :class "file" :size "10")
  (br)
  (input :type "submit" :class "submit" :value "Upload CSS..."))

(a :href ,(param 'link-home)    ,(lang en "Gallery"
                                       de "Galerie"))
,@(& *have-cart?*
     (has-cart?)
     `((a :href ,(param 'link-cart)
         (img :src ,(+ *base-url* "/media/korb_gelb.png")) "x" ,(cart-num-items))))
(a :href ,(param 'link-contact) ,(lang en "Contact"
                                       de "Kontakt"))
(a :href ,(param 'link-imprint) ,(lang en "Imprint"
                                       de "Impressum"))
(a :href ,(param 'link-login)   ,(lang en "Login"
                                       de "Login"))
,(tpl-gallery-country-selection)
,@(wg-css-upload)

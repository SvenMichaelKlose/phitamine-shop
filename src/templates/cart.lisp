(h1 ,(lang en "Cart"
           de "Warenkorb"))
(a :class "cancel" :href ,(action-url :remove 'cart)
  ,(lang en "back"
         de "zurück"))
,(tpl-cart-history)
,(cart-items)
(p "Total: &euro;" ,(cart-price-total))
(form :action "" :method "post"
  (h1 ,(lang en "Order"
             de "Bestellung"))
  (label ,(lang en "Surname"
                de "Vorname"))(br)(input :type "text"
                                         :name "surname")
  (label ,(lang en "Name"
                de "Name"))(br)(input :type "text"
                                      :name "surname")
  (label ,(lang en "Street/No."
                de "Straße/Nr."))(br)(input :type "text"
                                            :name "surname")
  (label ,(lang en "City/ZIP"
                de "Ort/PLZ"))(br)(input :type "text"
                                         :name "surname")
  (select :name "country" ,(flag-options "Germany"))
  (label ,(lang de "Fon"
                en "Phone"))(br)(input :type "text"
                                       :name "surname")
  (input :type "submit"
         :value ,(lang en "Order…"
                       de "Bestellen…")))

(h1 ,(lang de "Warenkorb"
           en "Cart"))
(a :class "cancel" :href ,(navi-url) ,(lang de "zur&uuml;ck" en "back"))
,(tpl-cart-history)
,@(cart-items)
(p "Total: &euro;" ,(cart-price-total))
(form :action "" :method "post"
  (h1 ,(lang de "Bestellung" en "Order"))
  (label ,(lang de "Vorname" en "Surname"))(br)(input :type "text" :name "surname")
  (label ,(lang de "Name" en "Name"))(br)(input :type "text" :name "surname")
  (label ,(lang de "Stra&szlig;e/Nr." en "Street/No."))(br)(input :type "text" :name "surname")
  (label ,(lang de "Ort/PLZ" en "City/ZIP"))(br)(input :type "text" :name "surname")
  (select :name "country" ,@(flag-options "Germany"))
  (label ,(lang de "Fon" en "Phone"))(br)(input :type "text" :name "surname")
  (input :type "submit" :value ,(lang de "Bestellen..."
                                      en "Order...")))

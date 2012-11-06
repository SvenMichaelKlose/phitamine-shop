(div :class "cart"
  (h1 ,(lang de "Warenkorb"
             en "Cart"))
  (a :class "cancel" :href ,(navi-reset-url) ,(lang de "zur&uuml;ck" en "back"))
  ,(tpl-cart-history)
  ,@(cart-items)

  (h1 ,(lang de "Bestellung"
             en "Order"))
  (form :action "" :method "post"
    (label "Name:")(input :type "text" :name "name" :value "")
    (label ,(lang de "Nachname:" en "Surname:"))(input :type "text" :name "surname" :value "")
    (label ,(lang de "Stra&szlig;e:" en "Street:"))(input :type "text" :name "street" :value "")
    (label ,(lang de "Ort:" en "City:"))(input :type "text" :name "ort" :value "")
    (label ,(lang de "PLZ:" en "ZIP code:"))(input :type "text" :name "zip" :value "")
    (label ,(lang de "Country:" en "Country;"))(select ,@(flag-options (lang de "Germany" en "United_Kingdom")))
    (label ,(lang de "Kommentar:" en "Comment:"))(textarea :name "comment" "")
    (br)(input :type "submit" :value ,(lang de "Abschlie&szlig;en..." en "Finish..."))))

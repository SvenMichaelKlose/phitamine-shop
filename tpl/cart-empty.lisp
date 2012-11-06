(div :class "cart"
  (h1 ,(lang de "Warenkorb" en "Cart"))
  (a :class "cancel" :href ,(navi-reset-url) ,(lang de "zur&uuml;ck" en "back"))
  (p ,(lang de "Der Warenkorb ist leer."
            en "The cart is empty."))
  ,(tpl-cart-history))

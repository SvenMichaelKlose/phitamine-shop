(div :class "cart"
  (h1 ,(lang en "Cart"
             de "Warenkorb"))
  (a :class "cancel" :href ,(navi-url) ,(lang en "back"
                                              de "zurück"))
  (p ,(lang en "The cart is empty."
            de "Der Warenkorb ist leer."))
  ,(tpl-cart-history))

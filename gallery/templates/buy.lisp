;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun tpl-gallery-buy ()
  (& *have-cart?*
     (alet (param 'id)
       (? (cart-item-count !)
          `(a :href ,(action-url :add (list 'cart-remove !))
             (span :class "cartbutton remove " (img :src ,(+ *base-url* "/media/korb.png"))))
          `(a :href ,(action-url :add (list 'cart-add !))
             (span :class "cartbutton add" (img :src ,(+ *base-url* "/media/korb.png"))))))))

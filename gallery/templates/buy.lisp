;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun tpl-gallery-buy ()
  (let id (param 'id)
    (? (cart-item-count id)
       `(a :href ,(action-url :add (list 'cart-remove id))
          (span :class "cartbutton remove " (img :src ,(+ *base-url* "/media/korb.png"))))
       `(a :href ,(action-url :add (list 'cart-add id))
          (span :class "cartbutton add" (img :src ,(+ *base-url* "/media/korb.png")))))))

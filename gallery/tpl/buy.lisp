;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun tpl-gallery-buy ()
  (let id (template-param-value 'id)
    (? (cart-item-count id)
       `(a :href ,(action-url :add (list 'cart-remove id))
           (button
             ,(lang de "Aus Warenkorb entfernen..."
                    en "Remove from cart...")))
       `(a :href ,(action-url :add (list 'cart-add id))
           (button
             ,(lang de "Kaufen..."
                    en "Buy..."))))))

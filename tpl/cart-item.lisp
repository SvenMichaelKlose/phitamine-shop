(div
  (p ,(template-param-value 'title))
  (a :href ,(action-url (list 'gallery 1
                              'large (template-param-value 'id)))
    (img :src ,(thumbnail-src (find-image (list (cons 'id (template-param-value 'id)))))))
  "&euro;" (label ,(template-param-value 'price))
  (a :href ,(action-url :add (list 'cart-remove (template-param-value 'id)))
     ,(lang de "Wieder entnehmen..."
            en "Take this out...")))

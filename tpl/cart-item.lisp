,(with (large-index       (cadr (assoc 'large *components*))
        id                (number (template-param-value 'id))
        item-large-index  (gallery-id-largepage id))
  `(div :class ,(+ "cart_item"
                   (? (== large-index item-large-index)
                      " viewed"
                      ""))
     (p ,(template-param-value 'title))
     (a :href ,(action-url :update `((gallery ,(integer (1+ (/ item-large-index *gallery-page-size*))))
                                     (large ,item-large-index)))
       (img :src ,(thumbnail-src (find-image `(id . ,id)))))
     "&euro;" (label ,(template-param-value 'price))
     (a :href ,(action-url :add `(cart-remove ,id))
        ,(lang de "Wieder entnehmen..."
               en "Take this out..."))))

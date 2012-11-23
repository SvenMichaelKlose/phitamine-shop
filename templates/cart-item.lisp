,(with (large-index       (cadr (assoc 'large *components*))
        id                (number (param 'id))
        item-large-index  (gallery-id-largepage id))
  `(div :class ,(+ "cart_item"
                   (? (== large-index item-large-index)
                      " viewed"
                      ""))
     (p ,(param 'title))
     (a :href ,(action-url :update `((gallery ,(integer (1+ (/ item-large-index *gallery-page-size*))))
                                     (large ,item-large-index)))
       (img :src ,(thumbnail-src (find-image `(id . ,id)))))
     "&euro;" (label ,(param 'price))
     (a :href ,(action-url :add `(cart-remove ,id))
        ,(lang de "Wieder entnehmen..."
               en "Take this out..."))))
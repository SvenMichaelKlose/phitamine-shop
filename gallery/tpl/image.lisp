(div :class "image"
  (img :src ,(flag-src (template-param-value :country))
       :alt ,(template-param-value :country))
  (a :href ,@(template-param :link-image-large)
    (figure
      (img :src ,@(template-param :image-src)
           :alt ,@(template-param :title))
      (figcaption
        (p ,@(template-param :title))
        (label "(" ,(template-param-value :country) ")")))
    "&euro;" ,(template-param-value :price)
    ))
;    (a :href ,(action-url t :params (list (cons :action "cart-add")
;                                          (cons :id (template-param-value :id))))
;      ,(lang de "Kaufen..."
;             en "Buy..."))))

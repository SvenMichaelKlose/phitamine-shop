(div :class "image"
  (img :src ,(flag-src (param 'country))
       :alt ,(param 'country))
  (a :href ,(param 'link-image-large)
    (figure
      (img :src ,(param 'image-src)
           :alt ,(param 'title))
      (figcaption
        (p ,(param 'title))
        (label "(" ,(param 'country) ")"))))
  "&euro;" ,(param 'price)
  ,(tpl-gallery-buy))

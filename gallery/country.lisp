(var *gallery-country* nil)

(fn get-countries ()
  (get-distinct-images 'country :where (gallery-image-selection-by-user)
                                :order-by "country"
                                :direction "asc"))

(fn tpl-gallery-country-selection ()
  `(div :class "countries"
     ,@(filter [`(a :href ,(action-url `(country ,_ gallery 1))
                   ,@(& (string== *gallery-country* _)
                        '(:class "selected"))
                   (div
                     (img :src ,(flag-src _)
                          :alt ,_))
                   (span ,_))]
               (get-countries))))

(fn country (x)
  (= *gallery-country* .x.)
  2)

(define-action country)

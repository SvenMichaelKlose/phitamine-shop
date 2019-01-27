(fn browser-item-maker (images typ idx)
  (? (assoc 'large *components*)
     `(,(? (eq 'page typ)
           idx
           "")
       (img :src ,(thumbnail-src (elt images (-- idx)))))
     (list (? (eq 'page typ)
              idx
              ""))))

(fn displaying-large-image? ()
  (assoc 'large *components*))

(def-pagination tpl-gallery-browser (pagination images)
  `((div :class "position"
      ,@(when tpl-range?
          (list (pagination-title pagination))))
    ,@(paginate pagination
                :component-maker
                  [? (displaying-large-image?)
                     (action-url :update `(large ,_))
                     (action-url :update `(gallery ,_))]
                :item-maker
                  #'((typ idx)
                       (browser-item-maker images typ idx)))))

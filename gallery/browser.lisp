;;;;; Copyright (c) 2012–2014 Sven Michael Klose <pixel@copei.de>

(def-pagination tpl-gallery-browser (pagination images)
  (. `(div :class "position"
        ,@(when tpl-range?
            (list (+ (with (from  (pagination-from pagination)
                            to    (pagination-to pagination))
                       (? (== from to)
                          from
                          (+ from "&#8208; " to)))
                     (lang de " von " en " of ")
                     total))))
     (paginate pagination
               :component-maker
                 [? (assoc 'large *components*)
                    (action-url :update `(large ,_))
                    (action-url :update `(gallery ,_))]
               :item-maker
                 #'((typ idx)
                     (? images
                        `(,(? (eq 'page typ)
                              idx
                              "")
                           (img :src ,(thumbnail-src (elt images (-- idx)))))
                        (list (? (eq 'page typ)
                                 idx
                                 "")))))))

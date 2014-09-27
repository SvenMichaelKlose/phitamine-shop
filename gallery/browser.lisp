;;;;; Copyright (c) 2012–2014 Sven Michael Klose <pixel@copei.de>

(defun browser-item-maker (images typ idx)
  (? (assoc 'large *components*)
     `(,(? (eq 'page typ)
           idx
           "")
       (img :src ,(thumbnail-src (elt images (-- idx)))))
     (list (? (eq 'page typ)
              idx
              ""))))

(defun displaying-large-image? ()
  (assoc 'large *components*))

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
                 [? (displaying-large-image?)
                    (action-url :update `(large ,_))
                    (action-url :update `(gallery ,_))]
               :item-maker
                 #'((typ idx)
                      (browser-item-maker images typ idx)))))

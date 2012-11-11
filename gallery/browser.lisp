;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun tpl-gallery-browser ()
  (with-pagination *gallery-pagination*
    (cons `(div :class "position"
             ,@(when tpl-range?
                 (list (+ (with (from (pagination-from pagination)
                                 to   (pagination-to pagination))
                            (? (== from to)
                               from
                               (+ from "&#8208; " to)))
                          (lang de " von " en " of ")
                          total))))
            (paginate pagination :component-maker [+ (butlast (tree-list *components*)) (list _)]
                                 :item-maker #'((typ idx)
                                                  (? *gallery-images*
                                                     `(,(? (eq 'page typ)
                                                           idx
                                                           "")
                                                       (img :src ,(thumbnail-src (elt *gallery-images* (1- idx)))))
                                                     (list (? (eq 'page typ)
                                                              idx
                                                              ""))))))))

(defun get-countries ()
  (get-distinct-images 'country :where (gallery-image-selection-by-user)))

(defun tpl-gallery-country-selection ()
  `(div :class "countries"
     ,@(filter ^(a :href ,(action-url (list 'country _ 'gallery 1))
                   ,@(when (string== *gallery-country* _)
                       '(:class "selected"))
                  (div
                    (img :src ,(flag-src _)
                         :alt ,_))
                  (span ,_))
               (get-countries))))

(defun country (x)
  (= *gallery-country* .x.)
  (values (list x. .x.) ..x))

(define-action country)

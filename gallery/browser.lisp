;;;;; Copyright (c) 2012–2013 Sven Michael Klose <pixel@copei.de>

(defvar *gallery-country* nil)

(def-pagination tpl-gallery-browser (pagination images)
  (cons `(div :class "position"
           ,@(when tpl-range?
               (list (+ (with (from (pagination-from pagination)
                               to   (pagination-to pagination))
                          (? (== from to)
                             from
                             (+ from "&#8208; " to)))
                        (lang de " von " en " of ")
                        total))))
          (paginate pagination :component-maker [? images
                                                   (action-url :update `(large ,_))
                                                   (action-url :update `(gallery ,_))]
                               :item-maker #'((typ idx)
                                                (? images
                                                   `(,(? (eq 'page typ)
                                                         idx
                                                         "")
                                                     (img :src ,(thumbnail-src (elt images (-- idx)))))
                                                   (list (? (eq 'page typ)
                                                            idx
                                                            "")))))))

(defun get-countries ()
  (get-distinct-images 'country :where (gallery-image-selection-by-user)
                                :order-by "country"
                                :direction "asc"))

(defun tpl-gallery-country-selection ()
  `(div :class "countries"
     ,@(filter ^(a :href ,(action-url `(country ,_ gallery 1))
                   ,@(when (string== *gallery-country* _)
                       '(:class "selected"))
                  (div
                    (img :src ,(flag-src _)
                         :alt ,_))
                  (span ,_))
               (get-countries))))

(defun country (x)
  (= *gallery-country* .x.)
  2)

(define-action country)

;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun gallery-browser ()
  (with-pagination (template-param-value :pagination)
    (cons `(div :class "position" ,(+ (with (from (1+ (pagination-offset pagination))
                                             to (alet (+ (pagination-offset pagination) size)
                                                  (? (< total !) total !)))
                                        (? (== from to)
                                           from
                                           (+ from "&#8208; " to)))
                                      (lang de " von " en " of ")
                                      total))
            (paginate pagination :component-maker [+ (butlast (apply #'append *components*)) (list _)]
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
  (get-distinct-images :country :where (gallery-image-selection-by-user)))

(defun gallery-country-selection ()
  `(div :class "countries"
     ,@(filter ^(a :href ,(action-url `((country ,_) (gallery 1)))
                   ,@(when (string== *gallery-country* _)
                       '(:class "selected"))
                  (div
                    (img :src ,(flag-src _)
                         :alt ,_))
                  (span ,_))
               (get-countries))))

(defun country (n x)
  (keep-components n x.)
  (= *gallery-country* x.)
  .x)

(define-action country)                                                                                                                                        

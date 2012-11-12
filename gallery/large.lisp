;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-template tpl-gallery-image-large :path "gallery/tpl/image-large.lisp")

(defun gallery-large (x)
  (let old-components (copy-tree *components*)
    (set-port
      (with (images (gallery-find-images)
             page (number .x.)
             pagination (make-pagination :page page
                                         :size 1
                                         :total (get-image-count (gallery-image-selection)))
             img (elt images (1- page)))
        (= *gallery-pagination* pagination)
        (= *gallery-page* (pagination-page pagination))
        (= *gallery-images* images)
        (= (page-title) (+ (assoc-value 'title img) " (" (assoc-value 'country img) ")"))
        (tpl-gallery-image-large (+ `((image-src  . ,(original-src img))
                                      (link-back  . ,(action-url old-components))
                                      (pagination . ,pagination))
                                    img)))))
  2)

(define-action large :handler #'gallery-large)

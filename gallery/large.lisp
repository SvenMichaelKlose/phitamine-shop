;;;;; Copyright (c) 2012–2013 Sven Michael Klose <pixel@copei.de>

(define-template tpl-gallery-image-large :path "gallery/templates/image-large.lisp")

(defun gallery-large (x)
  (with (images     (gallery-find-images)
         page       (number .x.)
         pagination (make-pagination :page  page
                                     :size  1
                                     :total (length images))
         img        (elt images (-- page)))
    (= (page-title) (+ (assoc-value 'title img) " (" (assoc-value 'country img) ")" (pagination-title pagination)))
    (set-port
      (tpl-gallery-image-large (+ `((pagination . ,pagination)
                                    (images     . ,images)
                                    (image-src  . ,(original-src img))
                                    (link-back  . ,(action-url :remove 'large)))
                                  img))))
  2)

(define-action large :handler #'gallery-large)

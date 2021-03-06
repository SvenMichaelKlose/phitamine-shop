(var *gallery-page-size* 12)

(define-template tpl-gallery-index       :path "src/gallery/templates/index.lisp")
(define-template tpl-gallery-image       :path "src/gallery/templates/image.lisp")
(define-template tpl-gallery-image-form  :path "src/gallery/templates/image-form.lisp")

(fn make-image (pagination img)
  (funcall (? (logged-in?) ;(== (user-id) (@ img 'id_user)))
              #'tpl-gallery-image-form
              #'tpl-gallery-image)
           (+ (list (. 'image-src        (thumbnail-src img))
                    (. 'link-image-large (action-url :add `(large ,(+ (pagination-offset pagination) (param 'index))))))
              img)))

(fn lml-images (pagination images)
  (template-list [make-image pagination _] images))

(fn gallery-pagination (page)
  (make-pagination :page  page
                   :size  *gallery-page-size*
                   :total (get-image-count (gallery-image-selection))))

(fn paginated-images (pagination)
  (gallery-find-images :limit *gallery-page-size*
                       :offset (pagination-offset pagination)))

(fn gallery (x)
  (with (page        (number (| .x. 1))
         pagination  (gallery-pagination page)
         images      (paginated-images pagination))
    (= (page-title) (+ (| *gallery-country*
                          (+ (lang de "Verschiedene L&auml;nder"
                                   en "Various countries")))
                       " &#8208; "
                       (pagination-title pagination)))
    (set-port
      (tpl-gallery-index (list (. 'pagination pagination)
                               (. 'images     images)
                               (. 'lml-images (lml-images pagination images)))))
    (values `(,x. ,page) ..x)))

(define-action gallery)

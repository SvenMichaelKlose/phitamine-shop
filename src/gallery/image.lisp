(fn image-src (img section)
  (action-url `(,section ,(assoc-value 'id img) ,(assoc-value 'name img))))

(fn thumbnail-src (img) (image-src img 'thumbnail))
(fn original-src (img)  (image-src img 'original))

(fn generate-gallery-image (path-maker x)
  (alet (find-image (. 'id (number .x.)))
    (send-header :mime-type (assoc-value 'type !)
                 :mod-time  (strtotime (assoc-value 't_create !))
                 :max-age   0)
    (princ (file_get_contents (funcall path-maker (assoc-value 'id_user !)
                                                  (assoc-value 'name !)))))
  (quit))

(fn thumbnail (x) (generate-gallery-image #'path-thumbnail x))
(fn original (x)  (generate-gallery-image #'path-original  x))

(define-action thumbnail)
(define-action original)

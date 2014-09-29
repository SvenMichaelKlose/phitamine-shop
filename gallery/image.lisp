;;;;; Copyright (c) 2012,2014 Sven Michael Klose <pixel@copei.de>

(dont-obfuscate strtotime)

(defun image-src (img section)
  (action-url `(,section ,(@ img 'id) ,(@ img 'name))))

(defun thumbnail-src (img) (image-src img 'thumbnail))
(defun original-src (img)  (image-src img 'original))

(defun generate-gallery-image (path-maker x)
  (alet (find-image `(id . ,(number .x.)))
    (send-header :mime-type (@ ! 'type)
                 :mod-time (strtotime (@ ! 't_create))
                 :max-age 0)
    (princ (file_get_contents (funcall path-maker (@ ! 'id_user)
                                                  (@ ! 'name)))))
  (quit))

(defun thumbnail (x) (generate-gallery-image #'path-thumbnail x))
(defun original (x)  (generate-gallery-image #'path-original  x))

(define-action thumbnail)
(define-action original)

;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun create-thumbnail (name)
  (alet (new *Imagick (path-original (user-id) name))
    (!.scale-image *thumbnail-width* *thumbnail-height* t)
    (!.write-image (path-thumbnail (user-id) name))))

(defun create-original (name tmp-name)
  (aprog1 (path-original (user-id) name)
    (file_put_contents ! (file_get_contents tmp-name))))

(defun create-image (x)
  (with (name (assoc-value :name x)
         tmp-name (assoc-value :tmp-name x)
         mime-type (assoc-value :type x))
    (while (file_exists (path-original (user-id) name))
           nil
      (= name (+ "_" name)))
    (create-original name tmp-name)
    (create-thumbnail name)
    (insert-image (list (cons :id_user (user-id))
                        (cons :name name)
                        (cons :title "")
                        (cons :type mime-type)
                        (cons :f_public "0")
                        (cons :t_create (date "Y-m-d H:i:s"))))))

(defun create-images (files)
  (dolist (file files)
    (create-image file))
  (request-action-redirect "uploaddone"))

(defun upload-images ()
  (create-image-paths (user-id))
  (= *navi-template* #'tpl-navigation-upload)
  (!? (form-files "image")
      (create-images !)))

(define-redirect-catcher (uploaddone :status (lang de "Ihre Bilder wurden eingef&uuml;gt."
                                                   en "Your images have been added.")))
(define-navi-action upload-images)

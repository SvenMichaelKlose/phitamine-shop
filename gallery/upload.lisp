; Copyright (c) 2012–2016 Sven Michael Klose <pixel@copei.de>

(defvar *thumbnail-width*)
(defvar *thumbnail-height*)

(defun create-thumbnail (name)
  (alet (new *Imagick (path-original (user-id) name))
    (!.scale-image *thumbnail-width* *thumbnail-height* t)
    (!.write-image (path-thumbnail (user-id) name))))

(defun create-original (name tmp-name)
  (aprog1 (path-original (user-id) name)
    (file_put_contents ! (file_get_contents tmp-name))))

(defun create-image (x)
  (print x)
  (with (name       (assoc-value 'name x)
         tmp-name   (assoc-value 'tmp-name x)
         mime-type  (assoc-value 'type x))
    (unless (empty-string? tmp-name)    ; Should X get in here in the first place?
      (while (file_exists (path-original (user-id) name))
             nil
        (= name (+ "_" name)))
      (create-original name tmp-name)
      (create-thumbnail name)
      (insert-image (list (. 'id_user  (user-id))
                          (. 'name     name)
                          (. 'title    "")
                          (. 'type     mime-type)
                          (. 'f_public "0")
                          (. 't_create (sql-date)))))))

(defun create-images (files)
  (create-image-paths (user-id))
  (@ #'create-image files)
  (action-redirect :remove 'upload-images :add 'uploaddone))

(defun upload-images (x)
  (!? (form-files 'image)
      (create-images !))
  (set-port (tpl-navigation-upload))
  1)

(define-action upload-images :group gallery-upload)

(define-redirect-catcher (uploaddone :status (lang de "Ihre Bilder wurden eingef&uuml;gt."
                                                   en "Your images have been added.")))
(set-action-group 'uploaddone 'gallery-upload)

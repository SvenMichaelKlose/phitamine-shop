; Copyright (c) 2012–2014,2016 Sven Michael Klose <pixel@copei.de>

(defvar *gallery-archive-path*)

(defun image-path (section user-id)
  (string-concat (href *_SERVER* "DOCUMENT_ROOT") *gallery-archive-path* "/" (| user-id 1) "/" section))

(defun image-path-originals (user-id)
  (image-path "original" user-id))

(defun image-path-thumbnails (user-id)
  (image-path "thumb" user-id))

(defun create-path (x)
  (| (file_exists x)
     (mkdir x 255 t)))

(defun create-image-paths (id-user)
  (create-path (image-path-originals id-user))
  (create-path (image-path-thumbnails id-user)))

(defun path-original (id-user name)
  (+ (image-path-originals id-user) "/" name))

(defun path-thumbnail (id-user name)
  (+ (image-path-thumbnails id-user) "/" name))

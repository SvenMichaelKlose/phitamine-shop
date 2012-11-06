;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun image-removed (n x)
  (let old-action *action*
    (set-action
      (= *navi-status* (lang en "The image has been removed."
                             de "Das Bild wurde entfernt."))
      (funcall old-action)))
  nil)

(defun remove-image (n x)
  (with (id (required-component x.)
         name (assoc-value :name (find-image (list (cons :id id)))))
    (set-action
      (alet (path-original (user-id) name)
        (& (file_exists !) (unlink !)))
      (alet (path-thumbnail (user-id) name)
        (& (file_exists !) (unlink !)))
      (delete-images (list (cons :id id)))
      (action-redirect (+ *components* '((image-removed))) :params t)))
  nil)

(define-action remove-image :parent gallery)
(define-action image-removed :parent gallery)

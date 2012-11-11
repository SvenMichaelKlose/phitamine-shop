;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun image-removed (x)
  (let old-action *action*
    (= *navi-status* (lang en "The image has been removed."
                           de "Das Bild wurde entfernt."))
    (funcall old-action))
  nil)

(defun remove-image (x)
  (with (id (required-component x.)
         name (assoc-value 'name (find-image (list (cons 'id id)))))
    (alet (path-original (user-id) name)
      (& (file_exists !) (unlink !)))
    (alet (path-thumbnail (user-id) name)
      (& (file_exists !) (unlink !)))
    (delete-images (list (cons 'id id)))
    (action-redirect :add 'image-removed)))

(define-action remove-image  :group gallery)
(define-action image-removed :group gallery)

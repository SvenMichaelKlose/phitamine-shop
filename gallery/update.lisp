;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-redirect-catcher (updatedone :status (lang de "Die Bilder wurden aktualisiert,"
                                                   en "The images have been updated.")))

(defun update-images ()
  (when (has-form?)
    (filter #'update-image (form-alists))
    (request-action-redirect "updatedone")))

(define-navi-action update-images)

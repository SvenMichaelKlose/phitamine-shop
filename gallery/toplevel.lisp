;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *gallery-images* nil)
(defvar *image-index* nil)

(defun gallery-image-selection-by-user ()
  (unless (logged-in?)
    `((f_public . "1"))))

(defun gallery-image-selection ()
  (+ (!? *gallery-country*
         `((country . ,!)))
     (gallery-image-selection-by-user)))

;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defvar *gallery-country* nil)

(defun gallery-get-country (x)
  (!? (flag-name? x.)
      (& (= *gallery-country* x.) .x)
      x))

(defun gallery-parse-request (x)
  (let n (gallery-get-country x)
    (= *pagination-page* (| n. 1))
    (= *components* (+ (!? *gallery-country* (+ ! "/") "")
                              (| n. "")))
    *components*
    (values .n. ..n.)))

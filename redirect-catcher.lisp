;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defmacro define-redirect-catcher ((name &key (status nil)) &rest body)
  `(progn
     (defun ,name ()
       (!? status (= *navi-status* !))
       ,@body)
     (define-action ,name)))

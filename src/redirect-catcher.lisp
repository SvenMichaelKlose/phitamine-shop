(defmacro define-redirect-catcher ((name &key (status nil)) &rest body)
  `(progn
     (fn ,name (x)
       ,@(!? status `((= (page-status) ,!)))
       ,@body
       nil)
     (define-action ,name)))

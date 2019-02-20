(define-template tpl-navigation-login   :path "src/templates/navigation-logged-in.lisp")
(define-template tpl-navigation-nologin :path "src/templates/navigation-not-logged-in.lisp")
(define-template tpl-navigation-contact :path "src/templates/navigation-contact.lisp")
(define-template tpl-navigation-upload  :path "src/templates/navigation-upload.lisp")

(@ (i '(login contact gallery-upload cart))
  (= (group-port i) 'navi))

(fn navi-url (&optional (x nil))
  (action-url (components-w/o-port 'navi) :add x))

(fn tpl-navigation ()
  (funcall (? (logged-in?)
              #'tpl-navigation-login
              #'tpl-navigation-nologin)
           (list (. 'link-home    (action-url *home-components*))
                 (. 'link-login   (navi-url 'login))
                 (. 'link-logout  (navi-url 'logout))
                 (. 'link-cart    (navi-url 'cart))
                 (. 'link-contact (navi-url 'contact))
                 (. 'link-upload  (navi-url 'upload-images))
                 (. 'link-imprint (action-url (components-w/o-port 'content) :add 'imprint))
                 (. 'alias        (user-alias)))))

(request-port 'navi #'tpl-navigation)

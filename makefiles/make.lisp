; Copyright (c) 2012,2014,2016 Sven Michael Klose <pixel@copei.de>

(defvar *fallback-language* 'en)

(load "phitamine/make-project.lisp")
(load "config-compile-time.lisp")

(= (transpiler-assert? *php-transpiler*) t)

(make-phitamine-project "Shop Hope Stamps"
    :files `("config-compile-time.lisp"
             "centralservices/pagination.lisp"
             "centralservices/user-management/login.lisp"
             "centralservices/cart.lisp"
             "db-tables.lisp"
             "navigation.lisp"
             "page.lisp"
             "redirect-catcher.lisp"
             "flag.lisp"
             "gallery/templates/buy.lisp"
             "gallery/path.lisp"
             "gallery/image.lisp"
             "gallery/upload.lisp"
             "gallery/update.lisp"
             "gallery/remove.lisp"
             "gallery/country.lisp"
             "gallery/browser.lisp"
             "gallery/title.lisp"
             "gallery/large.lisp"
             "gallery/index.lisp"
             "gallery/toplevel.lisp"
             "login.lisp"
             "contact.lisp"
             "imprint.lisp"
             "cart.lisp"
             ,@(& *have-css-upload?*
                  '("css-upload.lisp"))
             "toplevel.lisp")
    :script-path "/shop"
    :filename    "index.php")
(quit)

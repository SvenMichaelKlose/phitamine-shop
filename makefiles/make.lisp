(var *fallback-language* 'en)

(load "tre_modules/phitamine/make-project.lisp")
(load "config-compile-time.lisp")

(= (transpiler-assert? *php-transpiler*) t)

(make-phitamine-project "Shop Hope Stamps"
    :files `("config-compile-time.lisp"
             "tre_modules/centralservices/pagination.lisp"
             "tre_modules/centralservices/user-management/login.lisp"
             "tre_modules/centralservices/cart.lisp"
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
             "config.lisp"
             "toplevel.lisp")
    :script-path "/shop"
    :filename    "index.php")
(quit)

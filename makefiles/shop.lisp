(var *fallback-language* 'en)

(load "../phitamine/make-project.lisp")
(load "config-compile-time.lisp")

(make-phitamine-project "Shop Hope Stamps"
    :files
      `("config-compile-time.lisp"
        ,@(list+ "../centralservices/"
                 `("pagination.lisp"
                   "user-management/login.lisp"
                   "cart.lisp"))
        ,@(list+ "src/"
                 `("db-tables.lisp"
                   "navigation.lisp"
                   "page.lisp"
                   "redirect-catcher.lisp"
                   "flag.lisp"
                   ,@(list+ "gallery/"
                            `("templates/buy.lisp"
                              "path.lisp"
                              "image.lisp"
                              "upload.lisp"
                              "update.lisp"
                              "remove.lisp"
                              "country.lisp"
                              "browser.lisp"
                              "title.lisp"
                              "large.lisp"
                              "index.lisp"
                              "toplevel.lisp"))
                   "login.lisp"
                   "contact.lisp"
                   "imprint.lisp"
                   "cart.lisp"
                   "css-upload.lisp"
                   "templates/css-upload.lisp"
                   "config.lisp"
                   "toplevel.lisp")))
    :script-path  ""
    :filename     "index.php"
    :transpiler   (!= (copy-transpiler *php-transpiler*)
                    (= (transpiler-assert? !) *development-version?*)))
(quit)

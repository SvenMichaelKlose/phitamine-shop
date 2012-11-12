;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(load "phitamine/make-project.lisp")

;(= *transpiler-assert* nil)

(make-phitamine-project "Shop Hope Stamps"
                        '("db-tables.lisp"
                          "navigation.lisp"
                          "page.lisp"
                          "redirect-catcher.lisp"
                          "flag.lisp"
                          "gallery/path.lisp"
                          "gallery/image.lisp"
                          "gallery/upload.lisp"
                          "gallery/update.lisp"
                          "gallery/remove.lisp"
                          "gallery/browser.lisp"
                          "gallery/title.lisp"
                          "gallery/large.lisp"
                          "gallery/index.lisp"
                          "gallery/toplevel.lisp"
                          "centralservices/user-management/login.lisp"
                          "login.lisp"
                          "contact.lisp"
                          "imprint.lisp"
                          "cart.lisp"
                          "css-upload.lisp"
                          "toplevel.lisp"))
(quit)

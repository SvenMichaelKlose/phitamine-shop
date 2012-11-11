;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(load "phitamine/make-project.lisp")

(make-phitamine-project "Shop Hope Stamps"
                        '("db-tables.lisp"
                          "page.lisp"
                          "redirect-catcher.lisp"
                          "flag.lisp"
                          "gallery/path.lisp"
                          "gallery/image.lisp"
                          "gallery/upload.lisp"
                          "gallery/update.lisp"
                          "gallery/remove.lisp"
                          "gallery/browser.lisp"
                          "gallery/parse-request.lisp"
                          "gallery/title.lisp"
                          "gallery/toplevel.lisp"
                          "login.lisp"
                          "contact.lisp"
                          "imprint.lisp"
                          "cart.lisp"
                          "css-upload.lisp"
                          "toplevel.lisp"))
(quit)

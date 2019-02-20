(load "config-compile-time.lisp")

(make-project "Phitamine Shop CSS URL rewriter"
              `("config-compile-time.lisp"
                "tre_modules/php/regexp.lisp"
                "tre_modules/php/request-path.lisp"
                "css.lisp")
              :transpiler  (copy-transpiler *php-transpiler*)
              :emitter     [put-file "compiled/css.php" _])
(quit)

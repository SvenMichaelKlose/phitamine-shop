(var *page-title*)
(var *page-status* nil)

(var *js-jqzoom* ,(flatten (with-open-file in (open "src/templates/jqzoom.js" :direction 'input) (read-all-lines in))))

(define-template tpl-main :path "src/templates/main.lisp")

(fn page-title ()
  *page-title*)

(fn (= page-title) (x)
  (= *page-title* (+ "Phitamine Shop" (? x (+ " &#8208; " x) ""))))

(= (page-title) nil)

(fn pagination-title (pagination)
  (with (from  (pagination-from pagination)
         to    (pagination-to pagination))
    (+ (? (== to from)
          (pagination-page pagination)
          (+ from "&#8208;" to))
       (lang en " of "
             de " von ")
       (pagination-total pagination))))

(fn page-status ()
  *page-status*)

(fn (= page-status) (x)
  (& x
     (= *page-status* `(,x))))

(fn url (x)
  (string-concat *base-url* x))

(define-redirect-catcher (cssdone :status "Oh, gro&szlig;er Meister, Dein neues CSS wurde &uuml;bernommen."))

(fn css-path ()
  (+ (_server "DOCUMENT_ROOT") *base-url* "/css/main.css"))

(fn css-upload (x)
  (awhen (form-files "css")
    (file_put_contents (css-path) (file_get_contents (href !. 'tmp-name))))
  (action-redirect :add 'cssdone))

(define-action css-upload)

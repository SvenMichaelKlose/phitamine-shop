; Copyright (c) 2012,2014,2016 Sven Michael Klose <pixel@copei.de>

(define-redirect-catcher (cssdone :status "Oh, gro&szlig;er Meister, Dein neues CSS wurde &uuml;bernommen."))

(defun css-path ()
  (+ (_server "DOCUMENT_ROOT") *base-url* "/css/main.css"))

(defun css-upload (x)
  (awhen (form-files "css")
    (file_put_contents (css-path) (file_get_contents (href !. 'tmp-name))))
  (action-redirect :add 'cssdone))

(define-action css-upload)

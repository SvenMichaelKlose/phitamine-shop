;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(define-redirect-catcher (cssdone :status "Oh, gro&szlig;er Meister, Dein neues CSS wurde &uuml;bernommen."))

(defun css-path ()
  (+ (href *_SERVER* "DOCUMENT_ROOT") *action-base-url* "/css/main.css"))

(defun css-upload (x)
  (awhen (form-files "css")
    (file_put_contents (css-path) (file_get_contents (assoc-value 'tmp-name !.))))
  (action-redirect :add 'cssdone))

(define-action css-upload)

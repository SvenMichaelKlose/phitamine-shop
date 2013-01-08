;;;;; Copyright (c) 2012–2013 Sven Michael Klose <pixel@copei.de>

(defvar *contact-to*)
(defvar *contact-subject*)

(defun contact-mail-header ()
  (alet (assoc-value 'email (form-data))
    (+ "From: " ! *terpri*
       "Reply-To: " ! *terpri*)))

(defun send-contact-mail ()
  (dont-obfuscate mail)
  (mail *contact-to* *contact-subject*
        (assoc-value 'text (form-data))
        (contact-mail-header))
  (action-redirect :add 'contactdone))

(defun contact (x)
  (?
    (form-complete?) (send-contact-mail)
    (has-form?)      (= (page-status) (lang de "Das Formular ist unvollst&auml;ndig."
                                            en "Sorry, but the form is incomplete.")))
  (set-port (tpl-navigation-contact))
  1)

(define-action contact :group contact)

(define-redirect-catcher (contactdone :status (lang de "Ihre Nachricht wurde versendet."
                                                    en "Your message has been sent.")))
(set-action-group 'contactdone 'contact)

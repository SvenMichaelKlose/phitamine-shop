;;;;; Copyright (c) 2012 Sven Michael Klose <pixel@copei.de>

(defun contact-mail-header ()
  (alet (assoc-value 'email (form-data))
    (+ "From: " ! *terpri*
       "Reply-To: " ! *terpri*)))

(dont-obfuscate mail)

(defun send-contact-mail ()
  (mail *contact-to* *contact-subject*
        (assoc-value 'text (form-data))
        (contact-mail-header))
  (action-redirect :add 'contactdone))

(defun contact (x)
  (?
    (form-complete?) (send-contact-mail)
    (has-form?)      (= *navi-status* (lang de "Das Formular ist unvollst&auml;ndig."
                                            en "Sorry, but the form is incomplete.")))
  (set-port (tpl-navigation-contact))
  .x)

(define-action contact :group contact)

(define-redirect-catcher (contactdone :status (lang de "Ihre Nachricht wurde versendet."
                                                    en "Your message has been sent.")))
(set-action-group 'contactdone 'contact)

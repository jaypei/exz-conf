;;; Package --- Summary
;;; Commentary:

;;; Code:

(setq-default auto-insert-directory "~/.emacs.d/templates/")
(auto-insert-mode)
(setq auto-insert-query nil)

(define-auto-insert "\\.org$" "template.org")
(define-auto-insert "\\.ino$" "template.ino")
(define-auto-insert "\\.\\([C]\\|cc\\|cpp\\)$"  "template.c")
(define-auto-insert "\\.\\([Hh]\\|hh\\|hpp\\)$" "template.h")
(define-auto-insert "\\.go$" "template.go")
(define-auto-insert "\\.tex$" "template.tex")
(define-auto-insert "\\.sh$" "template.sh")
(define-auto-insert "\\.rb$" "template.rb")
(define-auto-insert "\\.el$" "template.el")
(define-auto-insert "\\.py$" "template.py")
(define-auto-insert "\\.pl$" "template.pl")
(define-auto-insert "\\.pm$" "template.pm")
(define-auto-insert "\\.ml$" "template.ml")
(define-auto-insert "\\.mq4$" "template.mql")
(define-auto-insert "\\.mq5$" "template.mql")
(define-auto-insert "\\.mql$" "template.mql")

;;; exz-templates.el ends here
(provide 'exz-templates)

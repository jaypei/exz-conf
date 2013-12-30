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
(define-auto-insert "\\.tex$" "template.tex")
(define-auto-insert "\\.rb$" "template.rb")
(define-auto-insert "\\.el$" "template.el")
(define-auto-insert "\\.pl$" "template.pl")
(define-auto-insert "\\.pm$" "template.pm")
(define-auto-insert "\\.ml$" "template.ml")
(define-auto-insert "\\.mq4$" "template.mql")
(define-auto-insert "\\.mq5$" "template.mql")
(define-auto-insert "\\.mql$" "template.mql")

;; golang
(eval-after-load 'autoinsert
  '(define-auto-insert '(go-mode . "go skeleton")
     '("Description: "
       "/*" \n
       " * filename   : " (buffer-name) \n
       " * created at : " (format-time-string "%F %T") \n
       " * author     : " user-full-name " <" user-mail-address ">" \n
       " */" \n
       \n
       "package main" \n
       )))

;; python
(eval-after-load 'autoinsert
  '(define-auto-insert '(python-mode . "python skeleton")
     '("Description:"
       "#!/usr/bin/env python" \n
       "# -*- coding: utf-8 -*-" \n
       "# vim: tabstop=4 shiftwidth=4 softtabstop=4 et" \n
       "" \n
       ""
       )))

;; sh
(eval-after-load 'autoinsert
  '(define-auto-insert '(sh-mode . "sh skeleton")
     '("Description:"
       "#!/bin/bash" \n
       "" \n
       "# filename   : " (buffer-name) \n
       "# created at : " (format-time-string "%F %T") \n
       "# author     : " user-full-name " <" user-mail-address">" \n
       "" \n
       ""
       )))

;;; exz-templates.el ends here
(provide 'exz-templates)

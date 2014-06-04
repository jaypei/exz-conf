;;; Package --- Summary
;;; Commentary:

;;; Code:

;; Setup basic variables
(defvar user-home-dir (getenv "HOME"))
(defvar conf-root-dir (concat user-home-dir "/.emacs.d"))
(defvar user-info-file (concat user-home-dir "/.userinfo.el"))
(defvar user-local-file (concat user-home-dir "/.userlocal.el"))
(setq custom-file (concat user-home-dir "/.userlocal.el"))
(add-to-list 'load-path (concat conf-root-dir "/etc-lisp"))

;; persinal infos
(setq user-full-name "jaypei")
(setq user-mail-address "jaypei97159@gmail.com")
(setq frame-title-format "emacs@%b")

;; import submodules
(require 'exz-init)
(require 'exz-util)
(if (file-exists-p user-info-file)
    (load-file user-info-file))
(require 'exz-package)
(require 'exz-mode)
(require 'exz-edit-server)
(require 'exz-python)
(require 'exz-appearance)
(require 'exz-dired)
(require 'exz-ecb)
(require 'exz-mail)
(require 'exz-org)
(require 'exz-templates)
(require 'exz-others)
(require 'exz-keybindings)

;; start emacs server {{
(require 'server)
(if (server-running-p)
    (message "Another emacs server is running")
  (server-start))
;; }}

;; (ysl/setup-motd)

(if (file-exists-p user-local-file) (load-file user-local-file))


(if (file-exists-p "~/.emacs.d/emacs.el")
    (load "~/.emacs.d/emacs.el"))


;;; init.el ends here
(provide 'init)


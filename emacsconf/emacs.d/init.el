;; Setup basic variables
(defvar user-home-dir (getenv "HOME"))
(defvar conf-root-dir (concat user-home-dir "/.emacs.d"))
(defvar user-info-file (concat user-home-dir "/.userinfo.el"))
(defvar user-local-file (concat user-home-dir "/.userlocal.el"))
(setq custom-file (concat user-home-dir "/.userlocal.el"))
(add-to-list 'load-path (concat conf-root-dir "/etc-lisp"))

;; import submodules
(require 'exz-init)
(if (file-exists-p user-info-file) (load-file user-info-file))
(require 'exz-appearance)
(require 'exz-ecb)
;; (require 'ysl-package)
;; (require 'ysl-color-theme)
;; (require 'ysl-ui)
;; (require 'ysl-editing)
;; (require 'ysl-backup)
;; (require 'ysl-mail)
;; (require 'ysl-shell)
;; (require 'ysl-coding)
;; (require 'ysl-ess)
(require 'exz-org)
;; (require 'ysl-erc)
;; (require 'ysl-easypg)
(require 'exz-keybindings)
;; (require 'ysl-frame-size)
;; (require 'ysl-mode-line)
(require 'exz-others)

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

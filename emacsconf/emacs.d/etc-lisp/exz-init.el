;;; Package --- Summary
;;; Commentary:

;;; Code:

(message (concat "exz-init: user-home-dir: " user-home-dir))
(message (concat "exz-init: conf-root-dir: " conf-root-dir))

;; define basic functions
(defun exz-add-search-path (path)
  "Add PATH to 'load-path."
  (add-to-list 'load-path (concat conf-root-dir "/" path)))

(defun exz-load-file (path)
  "Load lib file in PATH."
  (load-file (concat conf-root-dir "/" path)))

; reload dotemacs
(defun exz-reload()
  (interactive)
  (load-file "~/.emacs.d/init.el") (message "dotEmacs reloaded successfully"))

;; load basic search path
(exz-add-search-path "etc-lisp")
(exz-add-search-path "site-lisp")
(exz-add-search-path "site-lisp/extra")

(if (equal (system-name) "jaypei-home")
    (setenv "GOPATH" "/home/jaypei/gocode"))

(if (equal (system-name) "jaypei-mbp.local")
    (progn
      (setq exec-path (append exec-path '("/usr/local/bin")))
      (setq exec-path (append exec-path '("/Users/jaypei/gocode/bin")))
      (setenv "GOPATH" "/Users/jaypei/gocode")
      (setenv "PYMACS_PYTHON" "/usr/local/bin/python")
      ))

;;; exz-init.el ends here
(provide 'exz-init)

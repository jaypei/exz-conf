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

;;; exz-init.el ends here
(provide 'exz-init)

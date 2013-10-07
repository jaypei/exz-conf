(message (concat "exz-init: user-home-dir: " user-home-dir))
(message (concat "exz-init: conf-root-dir: " conf-root-dir))

;; define basic functions
(defun add-search-path (path)
  (add-to-list 'load-path (concat conf-root-dir "/" path))
  (message (concat "exz-init: load-path added: " path)))

; reload dotemacs
(defun exz-reload()
  (interactive)
  (load-file "~/.emacs.d/init.el") (message "dotEmacs reloaded successfully"))

;; load basic search path
(add-search-path "etc-lisp")
(add-search-path "site-lisp")
(add-search-path "site-lisp/extra")

(provide 'exz-init)

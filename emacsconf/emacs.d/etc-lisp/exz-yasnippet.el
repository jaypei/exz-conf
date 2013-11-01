;;; Package --- Summary
;;; Commentary:

;;; Code:
(exz-add-search-path "site-lisp/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/snippets")

;;; exz-yasnippet.el ends here
(provide 'exz-yasnippet)

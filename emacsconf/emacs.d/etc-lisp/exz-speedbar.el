;;; Package --- Summary
;;; Commentary:

;;; Code:

(exz-add-search-path "site-lisp/sr-speedbar")
(add-hook 'speedbar-after-create-hook
          (lambda ()
            (message "helo")
            (linum-mode nil)
            ))

;; show all files
;;(setq speedbar-show-unknown-files t)

;; turn off the ugly icons
(setq speedbar-use-images nil)

;; left-side pane
;(setq sr-speedbar-right-side nil)

;; don't refresh on buffer changes
(setq sr-speedbar-auto-refresh nil)

(add-hook 'sr-speedbar-mode-hook '(lambda () (linum-mode -1)))


(require 'sr-speedbar)

;;; exz-speedbar.el ends here
(provide 'exz-speedbar)



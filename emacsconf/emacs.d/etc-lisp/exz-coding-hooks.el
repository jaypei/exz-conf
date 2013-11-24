;;; Package --- Summary
;;; Commentary:

;;; Code:

;; cc-mode

;; web-mode

(add-hook 'lisp-interaction-mode-hook
          (lambda ()
            (fci-mode)
            ))

;; python-mode
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "C-c |")
              'py-execute-region-ipython)
            (flycheck-mode)
            (fci-mode)
            ))

;;; exz-python.el ends here
(provide 'exz-coding-hooks)

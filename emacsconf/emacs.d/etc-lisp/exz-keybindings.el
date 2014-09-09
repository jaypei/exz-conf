;;; Package --- keybindings
;;; Commentary:

;;; Code:

(global-set-key (kbd "C-?") 'redo)
(global-set-key (kbd "M-n") 'window-move-up)
(global-set-key (kbd "M-p") 'window-move-down)
(global-set-key (kbd "M-N") 'other-window-move-up)
(global-set-key (kbd "M-P") 'other-window-move-down)
(global-set-key (kbd "C-x SPC") 'goto-last-change)


;; prefix definition
(define-prefix-command 'exz-z-map)
(global-set-key (kbd "C-x C-z") 'exz-z-map)
(global-set-key (kbd "C-z") 'exz-z-map)

;; copy & cut
(global-set-key (kbd "C-w") 'cut-line-or-region)
(global-set-key (kbd "M-w") 'copy-line-or-region)
(global-set-key (kbd "C-z C-c") 'copy-line-or-region)

;; goto char
(define-key global-map (kbd "C-z f") 'exz-goto-char)
(define-key global-map (kbd "C-z y") 'copy-lines)
(define-key global-map (kbd "C-o") 'exz-new-line-forward)
(define-key global-map (kbd "C-S-o") 'exz-new-line-previous)

(global-set-key (kbd "<f7>")   'cua-mode)
(global-set-key (kbd "<f8>")   'neotree-find)
(global-set-key (kbd "<f9>")   'multi-eshell)
(global-set-key (kbd "<f10>")  'menu-bar-mode)
(global-set-key (kbd "<f11>")  'fullscreen)
(global-set-key (kbd "<f12>")  'neotree-toggle)

;; window move
(global-set-key (kbd "C-z w b") 'windmove-left)
(global-set-key (kbd "C-z w f") 'windmove-right)
(global-set-key (kbd "C-z w n") 'windmove-down)
(global-set-key (kbd "C-z w p") 'windmove-up)
(global-set-key (kbd "C-z k") 'delete-window)

;; python
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key [backtab] 'indent-for-tab-command)))

;; auto-complete
(add-hook 'auto-complete-mode-hook
          (lambda()
            (local-set-key (kbd "M-/") 'auto-complete)))

;; anything
(global-set-key (kbd "C-x b") 'anything-buffers+)

;; window size
(global-set-key (kbd "M--") 'shrink-window-horizontally)
(global-set-key (kbd "M-=") 'enlarge-window-horizontally)

(global-set-key (kbd "C-1") 'move-beginning-of-line)
(global-set-key (kbd "C-2") 'set-mark-command)
(global-set-key (kbd "C-3") 'move-end-of-line)
(global-set-key (kbd "M-<return>") 'newline-and-indent)

;; font size
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;;; exz-keybindings.el ends here
(provide 'exz-keybindings)

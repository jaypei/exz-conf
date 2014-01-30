;;; Package --- keybindings
;;; Commentary:

;;; Code:

(global-set-key (kbd "C-?") 'redo)
(global-set-key (kbd "M-n") 'window-move-up)
(global-set-key (kbd "M-p") 'window-move-down)
(global-set-key (kbd "M-N") 'other-window-move-up)
(global-set-key (kbd "M-P") 'other-window-move-down)
;;(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-c C-m") 'execute-extended-command)

;; prefix definition
(define-prefix-command 'exz-z-map)
(global-set-key (kbd "C-x C-z") 'exz-z-map)
(global-set-key (kbd "C-z") 'exz-z-map)

;; copy & cut
(global-set-key (kbd "C-w") 'cut-line-or-region)
(global-set-key (kbd "M-w") 'copy-line-or-region)

;; goto char
(define-key global-map (kbd "C-z f") 'exz-goto-char)
(define-key global-map (kbd "C-z y") 'copy-lines)
(define-key global-map (kbd "C-o") 'exz-new-line-forward)
(define-key global-map (kbd "C-S-o") 'exz-new-line-previous)

(global-set-key [(f7)] 'cua-mode)
(global-set-key [f9] 'exz-ecb-load)
(global-set-key [f10] 'menu-bar-mode)
(global-set-key [f11] 'fullscreen)
(global-set-key [f12] 'sr-speedbar-toggle)

;; ecb
(add-hook 'ecb-common-tree-buffer-after-create-hook
          (lambda ()
            (hl-line-mode)
            (local-set-key (kbd "C-z h e l l o")
                           (lambda ()
                             (interactive)
                             (message "ECB -- hello world!")))
            (global-set-key (kbd "C-z w 1") 'ecb-goto-window-edit1)
            (global-set-key (kbd "C-z w 2") 'ecb-goto-window-edit2)
            (global-set-key (kbd "C-z w 3") 'ecb-goto-window-edit3)
            (global-set-key (kbd "C-z w 4") 'ecb-goto-window-edit4)
            (global-set-key (kbd "C-z w 5") 'ecb-goto-window-edit5)
            (global-set-key (kbd "C-z w m") 'ecb-goto-window-methods)
            (global-set-key (kbd "C-z w d") 'ecb-goto-window-directories)
            (global-set-key (kbd "C-z w s") 'ecb-goto-window-sources)
            (global-set-key (kbd "C-z w c") 'ecb-goto-window-compilation)
            (global-set-key (kbd "C-z w h") 'ecb-goto-window-history)
            (global-set-key (kbd "C-z w s") 'ecb-goto-window-speedbar)
            (local-set-key (kbd "p") 'previous-line)
            (local-set-key (kbd "n") 'next-line)
            ))

(add-hook 'ecb-directories-buffer-after-create-hook
          (lambda ()
            (local-set-key (kbd "r") 'ecb-update-directories-buffer)
            (local-set-key (kbd "1") 'ecb-open-source-in-editwin1)
            (local-set-key (kbd "2") 'ecb-open-source-in-editwin2)
            (local-set-key (kbd "3") 'ecb-open-source-in-editwin3)
            (local-set-key (kbd "4") 'ecb-open-source-in-editwin4)
            (local-set-key (kbd "5") 'ecb-open-source-in-editwin5)
            ))

(add-hook 'ecb-methods-buffer-after-create-hook
          (lambda ()
            (local-set-key (kbd "r") 'ecb-rebuild-methods-buffer)
            (local-set-key (kbd "1") 'ecb-jump-to-tag-in-editwin1)
            (local-set-key (kbd "2") 'ecb-jump-to-tag-in-editwin2)
            (local-set-key (kbd "3") 'ecb-jump-to-tag-in-editwin3)
            (local-set-key (kbd "4") 'ecb-jump-to-tag-in-editwin4)
            (local-set-key (kbd "5") 'ecb-jump-to-tag-in-editwin5)
            ))

;; window move
(global-set-key (kbd "C-z w b") 'windmove-left)
(global-set-key (kbd "C-z w f") 'windmove-right)
(global-set-key (kbd "C-z w n") 'windmove-down)
(global-set-key (kbd "C-z w p") 'windmove-up)
(global-set-key (kbd "C-z k") 'delete-window)

;; org
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-z o p") 'exz-org-publish)
            (local-set-key (kbd "C-z c") 'org-publish-current-file)))

;; python
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key [backtab] 'indent-for-tab-command)
            ))

;; auto-complete
(add-hook 'auto-complete-mode-hook
          (lambda()
            (local-set-key (kbd "M-/") 'auto-complete)
            ))

;; tabbar
(global-set-key [M-left] 'tabbar-ruler-tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-ruler-tabbar-forward-tab)
(global-set-key [M-up] 'tabbar-ruler-up)
(global-set-key [M-down] 'tabbar-ruler-up)
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key [M-left] 'tabbar-ruler-tabbar-backward-tab)
            (local-set-key [M-right] 'tabbar-ruler-tabbar-forward-tab)
            (local-set-key [M-up] 'tabbar-ruler-up)
            (local-set-key [M-down] 'tabbar-ruler-up)
            ))
(global-set-key (kbd "C-z <left>") 'tabbar-ruler-tabbar-backward-tab)
(global-set-key (kbd "C-z <right>") 'tabbar-ruler-tabbar-forward-tab)
(global-set-key (kbd "C-z <up>") 'tabbar-ruler-up)
(global-set-key (kbd "C-z <down>") 'tabbar-ruler-up)

;;; exz-keybindings.el ends here
(provide 'exz-keybindings)

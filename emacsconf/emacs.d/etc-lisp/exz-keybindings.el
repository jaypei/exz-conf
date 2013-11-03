;;; Package --- keybindings
;;; Commentary:

;;; Code:

(global-set-key (kbd "C-?") 'redo)

;; prefix definition
(define-prefix-command 'exz-win-map)
(define-prefix-command 'exz-z-map)
(global-set-key (kbd "C-`") 'exz-win-map)
(global-set-key (kbd "C-x C-z") 'exz-z-map)
(global-set-key (kbd "C-z") 'exz-z-map)

;; copy
(global-set-key (kbd "C-z c") 'copy-region-as-kill)
(global-set-key (kbd "C-z y") 'copy-lines)

;; goto char
(define-key global-map (kbd "C-z f") 'exz-goto-char)

(global-set-key [(f7)] 'cua-mode)
;;(global-set-key [(f8)] 'cua-mode)
(global-set-key [f9] 'exz-load-ecb)
(global-set-key [f10] 'menu-bar-mode)
(global-set-key [f11] 'fullscreen)
(global-set-key [f12] 'speedbar)

;; ecb
(add-hook 'ecb-common-tree-buffer-after-create-hook
          (lambda ()
            (hl-line-mode)
            (local-set-key (kbd "C-z h e l l o")
                           (lambda ()
                             (interactive)
                             (message "ECB -- hello world!")))
            (global-set-key (kbd "C-` 1") 'ecb-goto-window-edit1)
            (global-set-key (kbd "C-` 2") 'ecb-goto-window-edit2)
            (global-set-key (kbd "C-` 3") 'ecb-goto-window-edit3)
            (global-set-key (kbd "C-` 4") 'ecb-goto-window-edit4)
            (global-set-key (kbd "C-` 5") 'ecb-goto-window-edit5)
            (global-set-key (kbd "C-` m") 'ecb-goto-window-methods)
            (global-set-key (kbd "C-` d") 'ecb-goto-window-directories)
            (global-set-key (kbd "C-` s") 'ecb-goto-window-sources)
            (global-set-key (kbd "C-` c") 'ecb-goto-window-compilation)
            (global-set-key (kbd "C-` h") 'ecb-goto-window-history)
            (global-set-key (kbd "C-` s") 'ecb-goto-window-speedbar)
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
(global-set-key (kbd "C-` b") 'windmove-left)
(global-set-key (kbd "C-` f") 'windmove-right)
(global-set-key (kbd "C-` n") 'windmove-down)
(global-set-key (kbd "C-` p") 'windmove-up)
(global-set-key (kbd "C-` k") 'delete-window)

;; org
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-` o") 'exz-org-publish)))


;;; exz-keybindings.el ends here
(provide 'exz-keybindings)

;; prefix definition
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)

;; undo / redo
(global-set-key (kbd "C-?") 'redo)

;; ecb
(global-set-key [(f12)] 'speedbar)
(global-set-key [(f9)] 'exz-load-ecb)


(add-hook 'ecb-common-tree-buffer-after-create-hook
          (lambda ()
            (hl-line-mode)
            (local-set-key (kbd "C-z h e l l o")
                           (lambda ()
                             (interactive)
                             (message "ECB -- hello world!")))
            (global-set-key (kbd "C-z g 1") 'ecb-goto-window-edit1)
            (global-set-key (kbd "C-z g 2") 'ecb-goto-window-edit2)
            (global-set-key (kbd "C-z g 3") 'ecb-goto-window-edit3)
            (global-set-key (kbd "C-z g 4") 'ecb-goto-window-edit4)
            (global-set-key (kbd "C-z g 5") 'ecb-goto-window-edit5)
            (global-set-key (kbd "C-z g m") 'ecb-goto-window-methods)
            (global-set-key (kbd "C-z g d") 'ecb-goto-window-directories)
            (global-set-key (kbd "C-z g s") 'ecb-goto-window-sources)
            (global-set-key (kbd "C-z g c") 'ecb-goto-window-compilation)
            (global-set-key (kbd "C-z g h") 'ecb-goto-window-history)
            (global-set-key (kbd "C-z g s") 'ecb-goto-window-speedbar)
            ))

(add-hook 'ecb-directories-buffer-after-create-hook
          (lambda ()
            (local-set-key (kbd "C-z o 1") 'ecb-open-source-in-editwin1)
            (local-set-key (kbd "C-z o 2") 'ecb-open-source-in-editwin2)
            (local-set-key (kbd "C-z o 3") 'ecb-open-source-in-editwin3)
            (local-set-key (kbd "C-z o 4") 'ecb-open-source-in-editwin4)
            (local-set-key (kbd "C-z o 5") 'ecb-open-source-in-editwin5)
            (local-set-key (kbd "SPC") 'ecb-open-source-in-editwin1)
            ))

(add-hook 'ecb-methods-buffer-after-create-hook
          (lambda ()
            (local-set-key (kbd "r") 'ecb-rebuild-methods-buffer)
            ))

;; org
(global-set-key (kbd "<f8> p") 'org-publish)

;; window move
(global-set-key (kbd "C-z C-b") 'windmove-left)
(global-set-key (kbd "C-z C-f") 'windmove-right)
(global-set-key (kbd "C-z C-n") 'windmove-down)
(global-set-key (kbd "C-z C-p") 'windmove-up)

(provide 'exz-keybindings)

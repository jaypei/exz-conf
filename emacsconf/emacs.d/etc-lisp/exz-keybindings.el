;; prefix - Ctrl-z
(define-prefix-command 'ctl-z-map)
(define-prefix-command 'ctl-point-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
(global-set-key (kbd "C-.") 'ctl-point-map)

;; undo / redo
(global-set-key (kbd "C-z u") 'undo)
(global-set-key (kbd "C-z r") 'redo)

;; ecb
(global-set-key [(f12)] 'speedbar)
(global-set-key [(f9)] 'ecb-activate)
(global-set-key (kbd "C-. g 1") 'ecb-goto-window-edit1)

;; (global-set-key (kbd "C-z 1") 'ecb-goto-window-edit1)
;; (global-set-key (kbd "C-z 2") 'ecb-goto-window-edit2)
;; (global-set-key (kbd "C-z 3") 'ecb-goto-window-edit3)
;; (global-set-key (kbd "C-z 4") 'ecb-goto-window-edit4)
;; (global-set-key (kbd "C-z 0") 'ecb-goto-window-directories)
;; (global-set-key (kbd "C-z 9") 'ecb-goto-window-sources)
;; (global-set-key (kbd "C-z 8") 'ecb-goto-window-methods)
;; (global-set-key (kbd "C-z 7") 'ecb-goto-window-compilation)

(add-hook 'ecb-common-tree-buffer-after-create-hook
          (lambda ()
            (local-set-key (kbd "C-a")
                           (lambda ()
                             (interactive)
                             (message "ECB is great!")))))

(add-hook 'ecb-directories-buffer-after-create-hook
          (lambda ()
            (hl-line-mode)
            (local-set-key (kbd "C-o 1") 'ecb-open-source-in-editwin1)
            (local-set-key (kbd "C-o 2") 'ecb-open-source-in-editwin2)
            (local-set-key (kbd "C-o 3") 'ecb-open-source-in-editwin3)
            (local-set-key (kbd "C-o 4") 'ecb-open-source-in-editwin4)))

;; org
(global-set-key (kbd "<f8> p") 'org-publish)

;; window move
(global-set-key (kbd "C-z C-b") 'windmove-left)
(global-set-key (kbd "C-z C-f") 'windmove-right)
(global-set-key (kbd "C-z C-n") 'windmove-down)
(global-set-key (kbd "C-z C-p") 'windmove-up)


(provide 'exz-keybindings)

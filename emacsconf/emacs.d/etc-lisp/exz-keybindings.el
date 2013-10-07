
;; ecb
(global-set-key [(f12)] 'speedbar)
(global-set-key [(control f11)] 'ecb-toggle-ecb-windows)

;; undo redo
(global-set-key (kbd "C-M-z") 'redo)
(global-set-key (kbd "C-z") 'undo)

;; window move
(global-set-key (kbd "C-c C-b") 'windmove-left)
(global-set-key (kbd "C-c C-f") 'windmove-right)
(global-set-key (kbd "C-c C-n") 'windmove-down)
(global-set-key (kbd "C-c C-p") 'windmove-up)


(provide 'exz-keybindings)

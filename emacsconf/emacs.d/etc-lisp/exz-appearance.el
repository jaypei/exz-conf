;; ==== colors =====
;; color-theme-molokai - https://github.com/alloy-d/color-theme-molokai
;; color-theme - http://www.emacswiki.org/emacs/ColorTheme
;; =================

;; font
(cond
 ((eq system-type 'darwin)
  (set-face-attribute 'default nil
                      :family "Inconsolata for Powerline"
                      :height 145
                      :weight 'normal))
 ((eq system-type 'gnu/linux)
  (set-face-attribute 'default nil
                      :family "Inconsolata-dz for Powerline"
                      :foundry "unknown"
                      :height 113))
 )

;; color-theme
(exz-add-search-path "site-lisp/color-theme")
(load-file "~/.emacs.d/site-lisp/color-theme/color-theme.el")
(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)
(color-theme-dark-laptop)

;; color schema
(set-background-color "black")
(set-foreground-color "white")
(set-face-foreground 'region "green")
(set-face-background 'region "blue")


(provide 'exz-appearance)

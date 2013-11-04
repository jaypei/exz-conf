;;; Package --- font, color, etc.
;;; Commentary:

;;; Code:


;; ==== colors =====
;; color-theme-molokai - https://github.com/alloy-d/color-theme-molokai
;; color-theme - http://www.emacswiki.org/emacs/ColorTheme
;; =================

;; font
(eval-when-compile (require 'cl)) 

(defun exz-set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil
                      :font (format "%s:pixelsize=%d" english english-size)) 
  (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
    (set-fontset-font (frame-parameter nil 'font) charset 
                      (font-spec :family chinese :size chinese-size)))) 

(if (display-graphic-p)
    ((lambda () (ecase system-type 
                  ;; Monaco for Powerline
                  ;; Inconsolata-dz for Powerline
                  (gnu/linux
                   (exz-set-font "Inconsolata-dz for Powerline" "文泉驿等宽微米黑" 15 18))
                  (darwin
                   (set-face-attribute 'default nil
                                       :font (format "Inconsolata for Powerline:pixelsize=16")))
                  ))))

;; color-theme
(exz-add-search-path "site-lisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)
(color-theme-dark-laptop)

;; color schema
;; (set-background-color "black")
;; (set-foreground-color "white")
;; (set-face-foreground 'region "green")
;; (set-face-background 'region "blue")

;; powerline
(exz-add-search-path "site-lisp/powerline")
(require 'powerline)
(powerline-default-theme)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on) ; color shell

;;; exz-appearance.el ends here
(provide 'exz-appearance)

;;; Package --- font, color, etc.
;;; Commentary:

;;; Code:

;; font
(eval-when-compile (require 'cl)) 

(defun exz-set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil
                      :font (format "%s:pixelsize=%d" english english-size)) 
  (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
    (set-fontset-font (frame-parameter nil 'font) charset 
                      (font-spec :family chinese :size chinese-size)))) 

(if (display-graphic-p)
    (ecase system-type 
      ;; Monaco for Powerline
      ;; Inconsolata-dz for Powerline
      (gnu/linux
       (exz-set-font "Inconsolata-dz for Powerline" "文泉驿等宽微米黑" 15 18))
      (darwin
       (set-face-attribute 'default nil
                           :font (format "Inconsolata for Powerline:pixelsize=16")))
      ))

;; color-theme
(exz-add-search-path "site-lisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-robin-hood)

(if (display-graphic-p)
    (progn 
      (exz-add-search-path "site-lisp/color-theme-tomorrow")
      (require 'color-theme-tomorrow)
      (color-theme-tomorrow--define-theme night-bright)
      ;(color-theme-dark-laptop)
      )
  (progn
    (color-theme-comidia)
    )
  )


;; powerline
(exz-add-search-path "site-lisp/powerline")
(require 'powerline)
(powerline-default-theme)

(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on) ; color shell

;;; exz-appearance.el ends here
(provide 'exz-appearance)

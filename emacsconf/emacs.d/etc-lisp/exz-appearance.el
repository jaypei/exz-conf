;;; Package --- font, color, etc.
;;; Commentary:

;;; Code:

;; color-theme
(defun color-theme-blackboard ()
  "Color theme by JD Huntington, based off the TextMate Blackboard theme, created 2008-11-27"
  (interactive)
  (color-theme-install
   '(color-theme-blackboard
     (
      ;; (background-color . "#0C1021")
      (background-color . "black")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#A7A7A7")
      (foreground-color . "#F8F8F8")
      (mouse-color . "sienna1"))
     ;; (default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (default ((t (:background "black" :foreground "#F8F8F8"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (font-lock-builtin-face ((t (:foreground "#F8F8F8"))))
     (font-lock-comment-face ((t (:italic t :foreground "#AEAEAE"))))
     (font-lock-constant-face ((t (:foreground "#D8FA3C"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-function-name-face ((t (:foreground "#FF6400"))))
     (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-reference-face ((t (:foreground "SlateBlue"))))
 
     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
 
     (font-lock-string-face ((t (:foreground "#61CE3C"))))
     (font-lock-type-face ((t (:foreground "#8DA6CE"))))
                                        ;(font-lock-variable-name-face ((t (:foreground "#FF6400"))))
     (font-lock-variable-name-face ((t (:foreground "#40E0D0"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     (region ((t (:background "#253B76"))))
     (mode-line ((t (:background "grey75" :foreground "black"))))
                                        ;(highlight ((t (:background "#222222"))))
     (highlight ((t (:background "#001"))))
     (highline-face ((t (:background "SeaGreen"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (zmacs-region ((t (:background "snow" :foreground "ble")))))))

(if (display-graphic-p)
    (progn
      ;; (exz-add-search-path "site-lisp/color-theme")
      ;; (require 'color-theme)
      ;; (color-theme-blackboard)
      (exz-add-search-path "site-lisp/color-theme-tomorrow")
      (require 'color-theme-tomorrow)
      (color-theme-tomorrow-night-bright)
      )
  (progn
    (exz-add-search-path "site-lisp/color-theme")
    (require 'color-theme)
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
    ;; (setq default-frame-alist '((background-color . "white")
    ;;                             (foreground-color . "gray")))
    (color-theme-initialize)
    (color-theme-robin-hood)
    (color-theme-midnight)
    )
  )


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
       (create-fontset-from-fontset-spec
        "-apple-Hannotate ST-medium-r-normal-*-16-*-*-*-*-*-fontset-mymonaco,
         ascii:-outline-Fantasque Sans Mono-medium-normal-normal-regular-16-*-*-*-m-0-iso10646-1,
         chinese-utf8:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-p-0-iso10646-1,
         chinese-gb2312:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-p-0-iso10646-1,
         latin-iso8859-1:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1,
         mule-unicode-0100-24ff:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
       
       (setq default-frame-alist (append '((font . "fontset-mymonaco")) default-frame-alist))
       (set-default-font "fontset-mymonaco")
       )))


;; powerline
(if (display-graphic-p)
    (progn
      (exz-add-search-path "site-lisp/powerline")
      (require 'powerline)
      (powerline-default-theme)

      (add-hook 'shell-mode-hook
                'ansi-color-for-comint-mode-on) ; color shell
      ))

;;; exz-appearance.el ends here
(provide 'exz-appearance)

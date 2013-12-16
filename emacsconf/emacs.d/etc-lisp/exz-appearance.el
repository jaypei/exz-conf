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
       (create-fontset-from-fontset-spec
        "-apple-Hannotate ST-medium-r-normal-*-18-*-*-*-*-*-fontset-mymonaco,
         ascii:-apple-Inconsolata for Powerline-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1,
         chinese-gb2312:-apple-Hannotate SC-medium-normal-normal-12-*-*-*-*-p-0-iso10646-1,
         chinese-utf8:-apple-Hannotate SC-medium-normal-normal-12-*-*-*-*-p-0-iso10646-1,
         latin-iso8859-1:-apple-Hannotate SC-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
         mule-unicode-0100-24ff:-apple-Hannotate SC-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")

       (setq default-frame-alist (append '((font . "fontset-mymonaco")) default-frame-alist))
       (set-default-font "fontset-mymonaco")
      )))


;; color-theme
(exz-add-search-path "site-lisp/color-theme")
(require 'color-theme)
(color-theme-initialize)

(if (display-graphic-p)
    (progn 
      (exz-add-search-path "site-lisp/color-theme-tomorrow")
      (require 'color-theme-tomorrow)
      (color-theme-tomorrow--define-theme night)
      ;(color-theme-dark-laptop)
      )
  (progn
    (color-theme-robin-hood)
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

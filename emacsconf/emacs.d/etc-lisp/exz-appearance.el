;;; Package --- font, color, etc.
;;; Commentary:

;;; Code:


;; color theme
(exz/when-aquamacs
 (custom-set-variables
  '(aquamacs-customization-version-id 0 t)
  '(cursor-type (quote box))
  '(indicate-empty-lines nil)
  '(default-frame-alist
     (quote
      ((foreground-color . "White")
       (background-color . "Black")
       (cursor-color . "White")
       (cursor-type (quote box))
       ))))
 (custom-set-faces
  '(aquamacs-variable-width ((t nil)))
  '(echo-area ((t nil)))
  '(mode-line-inactive ((t (:inherit aquamacs-variable-width :background "#2a2a2a" :foreground "#eaeaea"))))
  '(org-mode-default ((t (:inherit autoface-default))))
  '(tabbar-default ((t (:inherit nil :stipple nil :background "gray80" :foreground "black"))))
  '(text-mode-default ((t (:inherit autoface-default))))
  '(variable-pitch ((t nil))))
 (set-fringe-mode '(10 . 10)))

;; (require 'color-theme-sanityinc-tomorrow)
;; (load-theme 'sanityinc-tomorrow-bright t)
(require 'color-theme-tangotango)
(color-theme-tangotango)

(exz/when-osx
 (custom-set-faces
  '(default ((t (:inherit nil :stipple nil :background "#1d1f21" :foreground "White" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Fantasque_Sans_Mono"))))))


;; font
(eval-when-compile (require 'cl)) 

(defun exz/set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil
                      :font (format "%s:pixelsize=%d" english english-size)) 
  (dolist (charset '(kana han symbol cjk-misc bopomofo)) 
    (set-fontset-font (frame-parameter nil 'font) charset 
                      (font-spec :family chinese :size chinese-size)))) 

(exz/when-gui
  (exz/when-osx
    (if (boundp 'aquamacs-version)
        (exz/set-font "Fantasque Sans Mono" "Hannotate SC" 16 16)
      (progn
        (create-fontset-from-fontset-spec
         "-apple-Hannotate ST-medium-r-normal-*-16-*-*-*-*-*-fontset-mymonaco,
          ascii:-outline-Fantasque Sans Mono-medium-normal-normal-regular-16-*-*-*-m-0-iso10646-1,
          chinese-utf8:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-p-0-iso10646-1,
          chinese-gb2312:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-p-0-iso10646-1,
          latin-iso8859-1:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1,
          mule-unicode-0100-24ff:-apple-Hannotate SC-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1")
        (setq default-frame-alist (append '((font . "fontset-mymonaco")) default-frame-alist))
        (set-default-font "fontset-mymonaco"))))
  (exz/when-gnu-emacs
    (exz/set-font "Fantasque Sans Mono" "文泉驿等宽微米黑" 16 16)))
;; (exz/set-font "Inconsolata-dz for Powerline" "文泉驿等宽微米黑" 15 18))
    
    
;; powerline
(exz/when-gui 
  (setq powerline-default-separator 'wave)
  (powerline-default-theme))

;; (add-hook 'shell-mode-hook
;;           'ansi-color-for-comint-mode-on)

;; enable highlight current line
(global-hl-line-mode 1)

(require 'highlight-parentheses)

(exz/exec-by-hooks 'highlight-parentheses-mode
                   'emacs-lisp-mode-hook
                   'lisp-interaction-mode-hook
                   'python-mode-hook
                   'go-mode-hook
                   'c-mode-common-hook)

;;; exz-appearance.el ends here
(provide 'exz-appearance)

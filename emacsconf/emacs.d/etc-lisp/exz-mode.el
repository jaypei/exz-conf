;;; Package --- exz-mode
;;; Commentary:

(require 'tree-mode "tree-mode.el")

;;; Code:

(exz-load-file "site-lisp/graphviz-dot-mode.el") ; graphviz-mode

(setq default-major-mode 'text-mode)    ; text-mode by default
(setq column-number-mode t)

(require 'ido)                          ; ido-mode
(ido-mode t)

(if window-system
    (progn
     (tool-bar-mode -1)                 ; tool-bar-mode
     (scroll-bar-mode -1)))             ; scroll-bar-mode

(menu-bar-mode -1)                      ; menu-bar-mode

(exz-add-search-path "site-lisp/git-gutter") ; git-gutter
(require 'git-gutter)
(global-git-gutter-mode 1)

(show-paren-mode t)                     ; 括号匹配
(setq show-paren-style 'parentheses)

(mouse-avoidance-mode 'animate)         ; 鼠标自动让开

(auto-image-file-mode)                  ; 可自动打开图片

(global-font-lock-mode t)               ; 高亮

;; 一个简单的办法设置 auto-mode-alist, 免得写很多 add-to-list.
(mapcar
 (function (lambda (setting)
             (setq auto-mode-alist
                   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))

(setq-default indent-tabs-mode nil)     ; tab
(setq default-tab-width 4)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;;; exz-mode.el ends here
(provide 'exz-mode)

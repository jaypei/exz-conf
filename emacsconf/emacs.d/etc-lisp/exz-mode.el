
(require 'tree-mode "tree-mode.el")
(load-file "~/.emacs.d/site-lisp/graphviz-dot-mode.el")

;; 默认mode
(setq default-major-mode 'text-mode)
(setq column-number-mode t)

;; 默认关闭的bar mode
(if window-system
    (progn
     (tool-bar-mode -1)
     (scroll-bar-mode -1)))
(menu-bar-mode -1)

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

;; 让 Emacs 可以直接打开和显示图片
(auto-image-file-mode)

;; 进行语法加亮
(global-font-lock-mode t)

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

;; tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

(provide 'exz-mode)

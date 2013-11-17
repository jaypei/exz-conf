;;; Package --- exz-mode
;;; Commentary:

(require 'tree-mode "tree-mode.el")

;;; Code:

(exz-load-file "site-lisp/graphviz-dot-mode.el") ; graphviz-mode

;; git
(exz-add-search-path "site-lisp/git-gutter") ; git-gutter

(if (display-graphic-p)
    (progn
      (exz-add-search-path "site-lisp/fringe-helper")
      (exz-add-search-path "site-lisp/git-gutter-fringe")
      (require 'git-gutter-fringe)
      (set-face-foreground 'git-gutter-fr:modified "yellow")
      (set-face-foreground 'git-gutter-fr:added "blue")
      (set-face-foreground 'git-gutter-fr:deleted "white")
      )
  (progn
    (require 'git-gutter)
    ))

(global-git-gutter-mode 1)

(exz-add-search-path "site-lisp/git-commit-mode") ; git-commit-mode
(require 'git-commit-mode)

;; auto-complete
(exz-add-search-path "site-lisp/auto-complete")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat conf-root-dir "auto-complete/dict"))
(require 'auto-complete-config)
(ac-config-default)

;; flycheck
(exz-add-search-path "site-lisp/s")
(exz-add-search-path "site-lisp/dash")
(exz-add-search-path "site-lisp/f")
(exz-add-search-path "site-lisp/flycheck")
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; web mode
(exz-add-search-path "site-lisp/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.bash$" . sh-mode))
(setq web-mode-indent-style 1)
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)

;; ido
;; (require 'ido)                          ; ido-mode
;; (ido-mode t)

;; tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

;; window-number
(exz-add-search-path "site-lisp/window-number")
(require 'window-number)
(window-number-meta-mode)

;; others
(setq default-major-mode 'text-mode)    ; text-mode by default
(setq column-number-mode t)

(show-paren-mode t)                     ; 括号匹配
(setq show-paren-style 'parentheses)

(mouse-avoidance-mode 'animate)         ; 鼠标自动让开

(auto-image-file-mode)                  ; 可自动打开图片

(global-font-lock-mode t)               ; 高亮

;; 行号
;(setq linum-format " %d")
(global-linum-mode 1)


; disable menubar / scrollbar
(if (display-graphic-p)
    ((lambda()
       (tool-bar-mode -1)
       (scroll-bar-mode -1)))
  ((lambda ()
     (xterm-mouse-mode t))))

(menu-bar-mode -1)                      ; menu-bar-mode


;;; exz-mode.el ends here
(provide 'exz-mode)

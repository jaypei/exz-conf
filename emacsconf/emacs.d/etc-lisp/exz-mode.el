;;; Package --- exz-mode
;;; Commentary:

;;; Code:

(exz-add-search-path "site-lisp/s")
(exz-add-search-path "site-lisp/dash")
(exz-add-search-path "site-lisp/f")
(exz-add-search-path "site-lisp/flycheck")

(exz-load-file "site-lisp/graphviz-dot-mode.el") ; graphviz-mode

;; default mode
(setq default-major-mode 'text-mode)    ; text-mode by default

;; disable menubar / scrollbar
(if (display-graphic-p)
    ((lambda()
       (tool-bar-mode -1)
       (scroll-bar-mode -1)))
  ((lambda ()
     (xterm-mouse-mode t))))
(menu-bar-mode -1)                      ; menu-bar-mode

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

;; git-commit-mode
(exz-add-search-path "site-lisp/git-commit-mode")
(require 'git-commit-mode)

;; go-mode
(exz-add-search-path "site-lisp/go-mode")
(require 'go-mode)

;; auto-complete
(exz-add-search-path "site-lisp/auto-complete")
(require 'go-autocomplete)
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat conf-root-dir "auto-complete/dict"))
(require 'auto-complete-config)
(ac-config-default)

;; flycheck
(require 'flycheck)
;;(add-hook 'after-init-hook 'global-flycheck-mode)

;; web mode
(exz-add-search-path "site-lisp/web-mode")
(setq web-mode-indent-style 1)
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
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

;; show-paren-mode 括号匹配
(setq show-paren-style 'parentheses)
(show-paren-mode t)

;; mouse-avoidance-mode 鼠标自动让开
;;(mouse-avoidance-mode 'animate)

;; auto-image-file-mode 可自动打开图片
(auto-image-file-mode)

;; font-lock-mode 高亮
(global-font-lock-mode t)

;; linum-mode 行号
;;(setq linum-format " %d")
(global-linum-mode 1)
(add-hook 'speedbar-mode-hook (lambda () (linum-mode -1)))

;; yasnippet
(exz-add-search-path "site-lisp/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(yas-reload-all 1)

;; fill-column-indicator
(exz-add-search-path "site-lisp/fill-column-indicator")
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
(require 'fill-column-indicator)

;; tabbar
(exz-add-search-path "site-lisp/tabbar")
(exz-add-search-path "site-lisp/tabbar-ruler")
(setq tabbar-ruller-global-tabbar t)
(require 'tabbar-ruler)
(defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
  "Returns the name of the tab group names the current buffer belongs to.
 There are two groups: Emacs buffers (those whose name starts with '*', plus
 dired buffers), and the rest.  This works at least with Emacs v24.2 using
 tabbar.el v1.7."
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
              ((eq major-mode 'dired-mode) "emacs")
              (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

;; python-mode
(setq py-install-directory "~/.emacs.d/site-lisp/python-mode")
(exz-add-search-path "site-lisp/python-mode")
(require 'python-mode)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
        '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)


;;; exz-mode.el ends here
(provide 'exz-mode)

;;; Package --- exz-mode
;;; Commentary:

;;; Code:

(exz-add-search-path "site-lisp/s")
(exz-add-search-path "site-lisp/dash")
(exz-add-search-path "site-lisp/f")
(exz-add-search-path "site-lisp/popup")

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; highlight-80+
(exz-add-search-path "site-lisp/highlight-80+")
(exz-load-file "site-lisp/highlight-80+/highlight-80+-autoloads.el")
(add-hook 'lisp-interaction-mode-hook
          (lambda()
            (highlight-80+-mode)
            ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git
(exz-add-search-path "site-lisp/git-gutter") ; git-gutter
(exz-load-file "site-lisp/git-gutter/git-gutter-autoloads.el")

(if (display-graphic-p)
    (progn
      (exz-add-search-path "site-lisp/fringe-helper")
      (exz-add-search-path "site-lisp/git-gutter-fringe")
      (require 'git-gutter-fringe)
      (set-face-foreground 'git-gutter-fr:modified "red")
      (set-face-foreground 'git-gutter-fr:added "red")
      (set-face-foreground 'git-gutter-fr:deleted "red")
      ))
(global-git-gutter-mode 1)

(exz-add-search-path "site-lisp/magit") ; magit
(exz-load-file "site-lisp/magit/magit-autoloads.el")

;; graphviz-dot-mode
(exz-add-search-path "site-lisp/graphviz-dot-mode")
(exz-load-file "site-lisp/graphviz-dot-mode/graphviz-dot-mode-autoloads.el")

;; git-commit-mode
(exz-add-search-path "site-lisp/git-commit-mode")
(exz-load-file "site-lisp/git-commit-mode/git-commit-mode-autoloads.el")

;; go-mode
(exz-add-search-path "site-lisp/go-mode")
(exz-load-file "site-lisp/go-mode/go-mode-autoloads.el")
(add-hook 'go-mode-hook
          (lambda()
            (highlight-80+-mode)
            ))

;; markdown-mode
(exz-add-search-path "site-lisp/markdown-mode")
(exz-load-file "site-lisp/markdown-mode/markdown-mode-autoloads.el")
(add-to-list 'auto-mode-alist (cons "\\.md\\'" 'markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda()
            (highlight-80+-mode)
            ))

(setq abbrev-file-name
      "~/.emacs.d/abbrev_defs")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
(defun exz-load-auto-complete ()
  (interactive)
  (exz-add-search-path "site-lisp/auto-complete")
  (exz-load-file "site-lisp/auto-complete/auto-complete-autoloads.el")
  (setq ac-auto-start t)
  (setq ac-show-menu-immediately-on-auto-complete nil)
  (setq ac-auto-show-menu 0)
  (setq ac-use-menu-map t)
  ;;(require 'go-autocomplete)
  (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories
               (concat conf-root-dir "auto-complete/dict"))
  (ac-config-default)
  (setq global-auto-complete-mode 1)
  )

(exz-load-auto-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-mode
(defun exz-load-company ()
  (interactive)
  (exz-add-search-path "site-lisp/company")
  (setq company-begin-commands '(self-insert-command))
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-limit 20)
  (setq company-echo-delay 0)
  (setq company-idle-delay .3)
  (exz-load-file "site-lisp/company/company-autoloads.el")
  (exz-add-search-path "site-lisp/company-go")
  (add-hook 'go-mode-hook
            (lambda ()
              (require 'company-go)
              (setq company-minimum-prefix-length 0)
              (set (make-local-variable 'company-backends) '(company-go))
              ))
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'company-mode-hook
            (lambda ()
              (local-set-key (kbd "M-/") 'company-dabbrev-code)
              (local-set-key (kbd "M-?") 'company-complete)
              ))
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flycheck
(defun exz-load-flycheck ()
  (interactive)
  (exz-add-search-path "site-lisp/flycheck")
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (setq flycheck-idle-change-delay 0)
  (exz-load-file "site-lisp/flycheck/flycheck-autoloads.el")
  )

(exz-load-flycheck)

;; web mode
(exz-add-search-path "site-lisp/web-mode")
(setq web-mode-indent-style 1)
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(exz-load-file "site-lisp/web-mode/web-mode-autoloads.el")
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.bash$" . sh-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido
;; (require 'ido)                          ; ido-mode
;; (ido-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; window-number
(if (boundp 'aquamacs-version)
    (progn
      (exz-add-search-path "site-lisp/window-numbering")
      (require 'window-numbering)
      (setq window-numbering-assign-func
            (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
      (window-numbering-mode)
      )
  (progn
    (exz-add-search-path "site-lisp/window-number")
    (require 'window-number)
    (window-number-meta-mode)
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; show-paren-mode 括号匹配
(setq show-paren-style 'parentheses)
(show-paren-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-image-file-mode 可自动打开图片
(auto-image-file-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; linum-mode 行号
;; (setq linum-format 'dynamic)
;; (global-linum-mode 1)

;; (add-hook 'speedbar-mode-hook (lambda () (linum-mode -1)))
;; (add-hook 'sr-speedbar-mode-hook '(lambda () (linum-mode -1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; speedbar
(defun exz-load-sr-speedbar ()
  (interactive)
  (exz-add-search-path "site-lisp/sr-speedbar")
  ;; show all files
  (setq speedbar-show-unknown-files t)
  ;; turn off the ugly icons
  ;;(setq speedbar-use-images nil)
  ;; left-side pane
  (setq sr-speedbar-right-side nil)
  ;; don't refresh on buffer changes
  (setq sr-speedbar-auto-refresh nil)
  (require 'sr-speedbar)
  )

(exz-load-sr-speedbar)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yasnippet
(defun exz-load-yasnippet ()
  (interactive)
  (exz-add-search-path "site-lisp/yasnippet")
  (exz-load-file "site-lisp/yasnippet/yasnippet-autoloads.el")
  (setq yas/snippet-dirs '("~/.emacs.d/snippets"
                           "~/.emacs.d/site-lisp/yasnippet/snippets"))
  (yas-global-mode 1)

  (add-hook 'yas-minor-mode-hook
            (lambda ()
              (local-set-key (kbd "C-z TAB") 'yas-expand)
              ))
  )

(exz-load-yasnippet)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tabbar
;; (defun exz-load-tabbar ()
;;   "DOCSTRING"
;;   (interactive)
;;   (exz-add-search-path "site-lisp/tabbar")
;;   (exz-add-search-path "site-lisp/tabbar-ruler")
;;   (setq tabbar-ruller-global-tabbar t)
;;   (require 'tabbar-ruler)
;;   (defun my-tabbar-buffer-groups () ;; customize to show all normal files in one group
;;     "Returns the name of the tab group names the current buffer belongs to.
;;            There are two groups: Emacs buffers (those whose name starts with '*', plus
;;            dired buffers), and the rest.  This works at least with Emacs v24.2 using
;;            tabbar.el v1.7."
;;     (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
;;                 ((eq major-mode 'dired-mode) "emacs")
;;                 (t "user"))))
;;   (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
;;   )
;; (exz-load-tabbar)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; anything
(exz-add-search-path "site-lisp/anything")
(require 'anything-match-plugin)
(require 'anything-config)

;;; exz-mode.el ends here
(provide 'exz-mode)

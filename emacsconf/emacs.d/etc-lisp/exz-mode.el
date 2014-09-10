;;; Package --- exz-mode
;;; Commentary:

;;; Code:


;; default mode
(setq default-major-mode 'fundamental-mode
      aquamacs-scratch-file "/tmp/aquamacs-scratch-file"
      initial-major-mode 'lisp-interaction-mode
      initial-scratch-message ";; *scratch*\n\n")


;; disable menubar / scrollbar
(if (display-graphic-p)
    ((lambda()
       (tool-bar-mode -1)
       (scroll-bar-mode -1)))
  ((lambda ()
     (xterm-mouse-mode t))))
(menu-bar-mode -1)                      ; menu-bar-mode


;; highlight-80+
(exz-add-search-path "site-lisp/highlight-80+")
(exz-load-file "site-lisp/highlight-80+/highlight-80+-autoloads.el")
(add-hook 'lisp-interaction-mode-hook
          (lambda()
            (highlight-80+-mode)))


;; git-gutter
(require 'git-gutter-fringe)
(global-git-gutter-mode +1)
;; inactivate git-gutter-mode in asm-mode and image-mode
(custom-set-variables
 '(git-gutter:disabled-modes '(org-mode image-mode)))


;; go-mode
(add-hook 'go-mode-hook
          (lambda()
            (highlight-80+-mode)))


;; markdown-mode
(add-to-list 'auto-mode-alist (cons "\\.md\\'" 'markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda()
            (highlight-80+-mode)))
(setq abbrev-file-name
      "~/.emacs.d/abbrev_defs")


;; auto-complete
(defun exz-load-auto-complete ()
  (setq ac-auto-start t)
  (setq ac-show-menu-immediately-on-auto-complete t)
  (setq ac-auto-show-menu t)
  (setq ac-use-menu-map t)
  (require 'auto-complete)
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories
               (concat conf-root-dir "auto-complete/dict"))
  (ac-config-default)
  (setq global-auto-complete-mode 1)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))
(exz-load-auto-complete)


;; flycheck
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq flycheck-idle-change-delay 0)
(global-flycheck-mode 1)


;; web mode
(setq web-mode-indent-style 1)
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
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
(require 'ido)                          ; ido-mode
(ido-mode t)
(ido-vertical-mode t)


;; tab
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)


;; enable smartparents-mode
(smartparens-global-mode t)


;; window-number
(require 'window-number)
(window-number-meta-mode)


;; enable highlight current line
(global-hl-line-mode 1)


(require 'highlight-parentheses)
(exz/exec-by-hooks 'highlight-parentheses-mode
                   'emacs-lisp-mode-hook
                   'lisp-interaction-mode-hook
                   'python-mode-hook
                   'go-mode-hook
                   'c-mode-common-hook)
;; show-paren-mode 括号匹配
(setq show-paren-style 'parentheses)
(show-paren-mode t)


;; auto-image-file-mode 可自动打开图片
(auto-image-file-mode)


;; linum-mode 行号
;; (setq linum-format 'dynamic)
;; (global-linum-mode 1)


;; yasnippet
(defun exz-load-yasnippet ()
  (interactive)
  (setq yas/snippet-dirs '("~/.emacs.d/snippets"
                           "~/.emacs.d/site-lisp/yasnippet/snippets"))
  (yas-global-mode 1)
  (add-hook 'yas-minor-mode-hook
            (lambda ()
              (local-set-key (kbd "C-z TAB") 'yas-expand))))

(exz-load-yasnippet)


;; neotree
(unless (package-installed-p 'neotree)
  (exz-add-search-path "site-lisp/neotree")
  (exz-load-file "site-lisp/neotree/neotree-autoloads.el")
  (exz/debug "[NeoTree] Load local version."))


;; multi-term-mode
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))
(setq shell-file-name "/bin/zsh")
(custom-set-variables '(comint-prompt-read-only t))
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)


;; EasyPG
(setq epa-file-cache-passphrase-for-symmetric-encryption t)
(setq epa-file-inhibit-auto-save nil)


;; tramp
(setq tramp-chunksize 500)


;; slime
(setq inferior-lisp-program "clisp")
(slime-setup '(slime-fancy))
(slime-setup '(slime-repl))


;;; exz-mode.el ends here
(provide 'exz-mode)

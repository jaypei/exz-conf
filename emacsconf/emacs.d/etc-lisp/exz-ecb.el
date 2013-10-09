;; ============================
;; cedet:    http://cedet.sourceforge.net/
;; ecb:      https://github.com/alexott/ecb/
;; ============================

;; cedet
;;-------
(add-search-path "site-lisp/cedet")
(load-file "~/.emacs.d/site-lisp/cedet/common/cedet.el")
(require 'cedet)

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")

;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)


;; ecb
;;-------
(add-search-path "site-lisp/ecb")
(load-file "~/.emacs.d/site-lisp/ecb/ecb.el")
(require 'ecb)
(setq ecb-auto-activate nil)
(setq ecb-tip-of-the-day nil)
(setq stack-trace-on-error nil)

(setq ecb-layout-name "left3")
(setq ecb-show-sources-in-directories-buffer 'always)
;;(setq ecb-compile-window-height 12)
(setq ecb-windows-width 38)
;(setq ecb-fix-window-size t)

(custom-set-variables '(ecb-options-version "2.40"))

(provide 'exz-ecb)

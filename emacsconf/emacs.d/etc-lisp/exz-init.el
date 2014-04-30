;;; Package --- Summary
;;; Commentary:

;;; Code:

(message (concat "exz-init: user-home-dir: " user-home-dir))
(message (concat "exz-init: conf-root-dir: " conf-root-dir))

;; define basic functions
(defun exz-add-search-path (path)
  "Add PATH to 'load-path."
  (add-to-list 'load-path (concat conf-root-dir "/" path)))

(defun exz-load-file (path)
  "Load lib file in PATH."
  (load-file (concat conf-root-dir "/" path)))

; reload dotemacs
(defun exz-reload()
  (interactive)
  (load-file "~/.emacs.d/init.el") (message "dotEmacs reloaded successfully"))

;; load basic search path
(exz-add-search-path "etc-lisp")
(exz-add-search-path "site-lisp")
(exz-add-search-path "site-lisp/extra")

(when (equal (system-name) "jaypei-home")
  (setenv "GOPATH" "/home/jaypei/gocode")
  (setenv "PATH" (concat "/home/jaypei/bin:" (getenv "PATH")))
  (add-to-list 'exec-path "/home/jaypei/bin"))

(if (equal (system-name) "jaypei-mbp.local")
    (progn
      (setq exec-path (append exec-path '("/usr/local/bin")))
      (setq exec-path (append exec-path '("/Users/jaypei/gocode/bin")))
      (setenv "PATH"
              (concat (getenv "PATH") ":"
                      "/usr/local/bin"))
      (setenv "GOPATH" "/Users/jaypei/gocode")
      (setenv "PYMACS_PYTHON" "/usr/local/bin/python")
      (if (file-executable-p "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
        (setq magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"))
      (if (file-executable-p "/usr/local/Cellar/emacs/bin/emacsclient")
          (setq magit-emacsclient-executable "/usr/local/Cellar/emacs/bin/emacsclient"))
      (if (file-executable-p "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
          (setq magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"))))

;;; exz-init.el ends here
(provide 'exz-init)

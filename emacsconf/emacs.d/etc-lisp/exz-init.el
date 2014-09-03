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

(defun exz-add-exec-path (path)
  "Add PATH to os environ and exec-path."
  (add-to-list 'exec-path path)
  (setenv "PATH" (concat path ":" (getenv "PATH"))))

(defun exz/exec-by-hooks (fn &rest mode-hooks)
  (mapcar (lambda (x)
            (add-hook x fn))
          mode-hooks))

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
  (exz-add-exec-path "/home/jaypei/bin"))

(when (equal (system-name) "jaypei-mbp.local")
  (exz-add-exec-path "/Users/jaypei/bin")
  (exz-add-exec-path "/Users/jaypei/gocode/bin")
  (exz-add-exec-path "/usr/local/bin")
  (exz-add-exec-path "/Users/jaypei/gocode/bin")
  (exz-add-exec-path "/Users/jaypei/gocode/bin")
  (setenv "LC_ALL" "en_US.UTF-8")
  (setenv "GOPATH" "/Users/jaypei/gocode")
  (setenv "PYMACS_PYTHON" "/usr/local/bin/python")
  (if (file-executable-p "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
      (setq magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"))
  (if (file-executable-p "/usr/local/Cellar/emacs/bin/emacsclient")
      (setq magit-emacsclient-executable "/usr/local/Cellar/emacs/bin/emacsclient"))
  (if (file-executable-p "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
      (setq magit-emacsclient-executable "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")))

;; utils
(defun exz/debug (&rest args)
  (let ((format-string (car args))
        (other-args (cdr args)))
    (setf format-string (concat "[DEBUG] " format-string))
    (push format-string other-args)
    (apply 'message other-args)))

(defmacro exz/when-aquamacs (&rest body)
  (declare (indent 0) (debug t))
  `(when (boundp 'aquamacs-version)
     ,@body))

(defmacro exz/when-gui (&rest body)
  (declare (indent 0) (debug t))
  `(when (display-graphic-p)
     ,@body))

(defmacro exz/when-console (&rest body)
  (declare (indent 0) (debug t))
  `(unless (display-graphic-p)
     ,@body))

(defmacro exz/when-gnu-emacs (&rest body)
  (declare (indent 0) (debug t))
  `(when (string= system-type "gnu/linux")
     ,@body))

(defmacro exz/when-osx (&rest body)
  (declare (indent 0) (debug t))
  `(when (string= system-type "darwin")
     ,@body))

(defmacro exz/when-my-mbp (&rest body)
  (declare (indent 0) (debug t))
  `(when (equal (system-name) "jaypei-mbp.local")
     ,@body))

(defmacro exz/when-my-dell-bjhome (&rest body)
  (declare (indent 0) (debug t))
  `(when (equal (system-name) "jaypei-home")
     ,@body))


;;; exz-init.el ends here
(provide 'exz-init)

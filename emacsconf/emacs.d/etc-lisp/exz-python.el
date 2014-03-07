;; filename   : exz-python.el
;; created at : 2014-02-16 13:04:26
;; author     : jaypei <jaypei97159@gmail.com>

;;; Package --- Summary
;;; Commentary:

;;; Code:

;; python-mode
(setq py-install-directory "~/.emacs.d/site-lisp/python-mode")
(exz-add-search-path "site-lisp/python-mode")

;; pymacs
(exz-add-search-path "site-lisp/pymacs")
(exz-load-file "site-lisp/pymacs/pymacs-autoloads.el")

;; Initialize Rope                                                                                             
;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

(defun exz/eval-buffer-as-python ()
  "Run buffer content as python program."
  (interactive)
  (save-buffer t)
  (shell-command (concat python-shell-interpreter " " (buffer-file-name))))

(setq py-load-pymacs-p t)

(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
       (setq value (cons (format "%s%s" prefix element) value))))))

(defun ac-python-find ()
  "Python `ac-find-function'."
  (require 'thingatpt)
  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
    (if (null symbol)
        (if (string= "." (buffer-substring (- (point) 1) (point)))
            (point)
          nil)
      symbol)))

(defun ac-python-candidate ()
  "Python `ac-candidates-function'"
  (let (candidates)
    (dolist (source ac-sources)
      (if (symbolp source)
          (setq source (symbol-value source)))
      (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
             (requires (cdr-safe (assq 'requires source)))
             cand)
        (if (or (null requires)
                (>= (length ac-target) requires))
            (setq cand
                  (delq nil
                        (mapcar (lambda (candidate)
                                  (propertize candidate 'source source))
                                (funcall (cdr (assq 'candidates source)))))))
        (if (and (> ac-limit 1)
                 (> (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) cand) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))

(add-hook 'python-mode-hook
          (lambda ()
            (set (make-local-variable 'ac-find-function) 'ac-python-find)
            (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)))

(set-variable 'py-indent-offset 4)
(set-variable 'python-indent-guess-indent-offset nil)

; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;         '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
(setq py-smart-indentation t)

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map (kbd "C-c |")
              'py-execute-region-ipython)
            (define-key python-mode-map (kbd "C-c C-c")
              'exz/eval-buffer-as-python)
            (highlight-80+-mode)
            (if (functionp 'flycheck-mode)
                (flycheck-mode)))
          )

;;; exz-python.el ends here
(provide 'exz-python)

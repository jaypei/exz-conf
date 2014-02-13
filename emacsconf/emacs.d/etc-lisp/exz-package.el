;;; Package --- Summary
;;; Commentary:

;;; Code:
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
                         ;; ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'package)

(exz-add-search-path "site-lisp/el-get")
(when (require 'el-get nil t)

  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
  (custom-set-variables
   '(el-get-user-package-directory "~/.emacs.d/site-lisp/el-get"))
  (add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
  (unless (file-exists-p el-get-user-package-directory)
    (make-directory el-get-user-package-directory)))

;;; exz-package.el ends here
(provide 'exz-package)


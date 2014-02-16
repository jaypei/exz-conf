;;; Package --- ecb configuration
;;; Commentary: 

;; ============================
;; cedet:    http://cedet.sourceforge.net/
;; ecb:      https://github.com/alexott/ecb/
;; ============================

;;; Code:

(exz-add-search-path "site-lisp/cedet")
(exz-add-search-path "site-lisp/ecb")

(defun exz-ecb-add-source-path (&optional dir)
  (interactive)
  (let (my_file_name my_dir)
    (setf my_dir (ecb-fix-filename
                  (or dir
                      (ecb-file-name-directory
                       (read-file-name "Add source path: ")))))
    (setf my_file_name (file-name-base my_dir))
    (if (file-exists-p my_dir)
        (progn
          (ecb-add-source-path my_dir my_file_name "n")
          )
      (message "exz-ecb-addsource: %s not found, ignored." alias))
    ))

(defun exz-ecb-load ()
  (interactive)
  (exz-load-file "site-lisp/cedet/common/cedet.el")
  (require 'cedet)
  (global-ede-mode 1)
  (exz-load-file "site-lisp/ecb/ecb.el")

  (custom-set-variables
   '(ecb-options-version "2.40")
   '(ecb-source-path nil)
   '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
   '(ecb-tip-of-the-day nil)
   '(ecb-show-sources-in-directories-buffer 'always)
   ;;'(ecb-fix-window-size t)
   ;;'(ecb-compile-window-height 12)
   )
  ;; 减小在console下tree的宽度
  (if (display-graphic-p)
      ()
    (custom-set-variables
     '(ecb-tree-indent 1)
     '(ecb-tree-expand-symbol-before nil)
     '(ecb-tree-buffer-style (quote ascii-no-guides))
     ))

  (require 'ecb)
  ;; 解决因为ssh别名导致not-accessible ignored问题
  (setq ecb-ping-options (list "-c" "1" "127.0.0.1"))

  (ecb-activate)
  (ecb-layout-switch "left13")
  (exz-ecb-add-source-path "~/work/vimwiki/org")
  (exz-ecb-add-source-path "~/work")
  )

(provide 'exz-ecb)

;;; exz-ecb.el ends here

;;; Package --- ecb configuration
;;; Commentary: 

;; ============================
;; cedet:    http://cedet.sourceforge.net/
;; ecb:      https://github.com/alexott/ecb/
;; ============================

;;; Code:

(if (not (boundp 'aquamacs-version))
    (exz-add-search-path "site-lisp/cedet"))
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
          (ecb-add-source-path my_dir my_file_name "n"))
      (message "exz-ecb-addsource: %s not found, ignored." alias))))

(defun exz-ecb-load ()
  (interactive)
  (if (not (boundp 'aquamacs-version))
      (progn
        (exz-load-file "site-lisp/cedet/common/cedet.el")
        (require 'cedet)))
  (global-ede-mode 1)
  (exz-load-file "site-lisp/ecb/ecb.el")

  (custom-set-variables
   '(ecb-options-version "2.40")
   '(ecb-source-path nil)
   '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
   '(ecb-tip-of-the-day nil)
   '(ecb-show-sources-in-directories-buffer 'always))

  ;; 减小在console下tree的宽度
  (unless (display-graphic-p)
    (custom-set-variables
     '(ecb-tree-indent 1)
     '(ecb-tree-expand-symbol-before nil)
     '(ecb-tree-buffer-style (quote ascii-no-guides))))

  (require 'ecb)
  ;; 解决因为ssh别名导致not-accessible ignored问题
  (setq ecb-ping-options (list "-c" "1" "127.0.0.1"))

  (ecb-activate)
  (ecb-layout-switch "left13")
  (exz-ecb-add-source-path "~/work/vimwiki/org")
  (exz-ecb-add-source-path "~/work"))


;; ecb keymaps
(add-hook 'ecb-common-tree-buffer-after-create-hook
          (lambda ()
            (hl-line-mode)
            (global-set-key (kbd "C-z w 1") 'ecb-goto-window-edit1)
            (global-set-key (kbd "C-z w 2") 'ecb-goto-window-edit2)
            (global-set-key (kbd "C-z w 3") 'ecb-goto-window-edit3)
            (global-set-key (kbd "C-z w 4") 'ecb-goto-window-edit4)
            (global-set-key (kbd "C-z w 5") 'ecb-goto-window-edit5)
            (global-set-key (kbd "C-z w m") 'ecb-goto-window-methods)
            (global-set-key (kbd "C-z w d") 'ecb-goto-window-directories)
            (global-set-key (kbd "C-z w s") 'ecb-goto-window-sources)
            (global-set-key (kbd "C-z w c") 'ecb-goto-window-compilation)
            (global-set-key (kbd "C-z w h") 'ecb-goto-window-history)
            (global-set-key (kbd "C-z w s") 'ecb-goto-window-speedbar)
            (local-set-key (kbd "p") 'previous-line)
            (local-set-key (kbd "n") 'next-line)))

(add-hook 'ecb-directories-buffer-after-create-hook
          (lambda ()
            (local-set-key (kbd "r") 'ecb-update-directories-buffer)
            (local-set-key (kbd "1") 'ecb-open-source-in-editwin1)
            (local-set-key (kbd "2") 'ecb-open-source-in-editwin2)
            (local-set-key (kbd "3") 'ecb-open-source-in-editwin3)
            (local-set-key (kbd "4") 'ecb-open-source-in-editwin4)
            (local-set-key (kbd "5") 'ecb-open-source-in-editwin5)
            (local-set-key [f4] 'exz-ecb-add-source-path)))

(add-hook 'ecb-methods-buffer-after-create-hook
          (lambda ()
            (local-set-key (kbd "r") 'ecb-rebuild-methods-buffer)
            (local-set-key (kbd "1") 'ecb-jump-to-tag-in-editwin1)
            (local-set-key (kbd "2") 'ecb-jump-to-tag-in-editwin2)
            (local-set-key (kbd "3") 'ecb-jump-to-tag-in-editwin3)
            (local-set-key (kbd "4") 'ecb-jump-to-tag-in-editwin4)
            (local-set-key (kbd "5") 'ecb-jump-to-tag-in-editwin5)))

(provide 'exz-ecb)

;;; exz-ecb.el ends here

;;; Package --- Summary
;;; Commentary:

;;; Code:

(setq dired-recursive-copies t)         ; 可递归删除
(require 'dired-x)                      ; 特殊功能

;; 让 dired 可以递归的拷贝和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(setq dired-guess-shell-alist-user
      (list
       (list "//.chm$" "xchm")
       (list "//.rm$" "gmplayer")
       (list "//.rmvb$" "gmplayer")
       (list "//.avi$" "gmplayer")
       (list "//.asf$" "gmplayer")
       (list "//.wmv$" "gmplayer")
       (list "//.htm$" "w3m")
       (list "//.html$" "w3m")
       (list "//.mpg$" "gmplayer"))
      )

;;; exz-dired.el ends here
(provide 'exz-dired)

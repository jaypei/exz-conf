
(setq dired-recursive-copies t)         ; 可递归删除
(require 'dired-x)                      ; 特殊功能

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

(provide 'exz-dired)

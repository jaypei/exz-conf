
;; (require 'linum)

;; binding keys
;; undo and redo
(require 'redo "redo.el")
(require 'dirtree "dirtree.el")
(put 'downcase-region 'disabled nil)

(setq visible-bell t)    ;; 关闭滴滴声
(setq inhibit-startup-message t)    ;; 关闭起动时的那个“开机画面”

;; 不要在鼠标点击的那个地方插入剪贴板内容
(setq mouse-yank-at-point t)

(setq kill-ring-max 200)    ;; 用一个很大的 kill ring. 防止误删
(setq default-fill-column 80)    ;; fill-column 设为 80

;; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;; 防止页面滚动时跳动
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)

(setq ns-pop-up-frames nil)

;; 让 Emacs 可以直接打开和显示图片
(auto-image-file-mode)

;; 进行语法加亮
(global-font-lock-mode t)

;; 把这些缺省禁用的功能打开
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;; 关闭版本控制
(setq version-control nil)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(setq-default make-backup-files nil)

;; 让 dired 可以递归的拷贝和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(defadvice kill-ring-save (around slick-copy activate)
  "When called interactively with no active region, copy a single line instead."
  (if (or (use-region-p) (not (called-interactively-p)))
      ad-do-it
    (kill-new (buffer-substring (line-beginning-position)
                                (line-beginning-position 2))
              nil '(yank-line))
    (message "Copied line")))

(defadvice kill-region (around slick-copy activate)
  "When called interactively with no active region, kill a single line instead."
  (if (or (use-region-p) (not (called-interactively-p)))
      ad-do-it
    (kill-new (filter-buffer-substring (line-beginning-position)
                                       (line-beginning-position 2) t)
              nil '(yank-line))))

(defun yank-line (string)
  "Insert STRING above the current line."
  (beginning-of-line)
  (unless (= (elt string (1- (length string))) ?\n)
    (save-excursion (insert "\n")))
  (insert string))

(defun copy-lines(&optional arg) 
  "Function to copy lines"
  "\"C-c w\" copy one line, \"C-u 5 C-c w\" copy 5 lines"
  (interactive "p") 
  (save-excursion 
    (beginning-of-line) 
    (set-mark (point)) 
    (if arg 
        (next-line (- arg 1))) 
    (end-of-line) 
    (kill-ring-save (mark) (point)) 
    ) 
  ) 
(global-set-key (kbd "C-c w") 'copy-lines) 

;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

(provide 'exz-others)

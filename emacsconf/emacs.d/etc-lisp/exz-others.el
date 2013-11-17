;;; Package --- Summary
;;; Commentary:

;;; Code:

(require 'redo "redo.el")

(put 'downcase-region 'disabled nil)
(setq default-truncate-lines t)

(setq visible-bell t)                   ; 关闭滴滴声
(setq inhibit-startup-message t)        ; 关闭起动时的那个“开机画面”

(setq enable-local-variables :all)
(setq enable-local-eval t)

(setq mouse-yank-at-point t)            ; 不要在鼠标点击的地方插入剪切板内容

(setq kill-ring-max 200)                ; 用一个很大的 kill ring. 防止误删
(setq default-fill-column 80)           ; fill-column 设为 80

; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(setq enable-recursive-minibuffers t)   ; 可以递归的使用 minibuffer

;; 防止页面滚动时跳动
(setq scroll-margin 3
      scroll-conservatively 10000)

(setq ns-pop-up-frames nil)

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

;; duplicate current line
(defun duplicate-current-line (&optional n)
  "Duplicate current line, make more than 1 copy given a numeric argument."
  (interactive "p")
  (save-excursion
    (let ((nb (or n 1))
    	  (current-line (thing-at-point 'line)))
      ;; when on last line, insert a newline first
      (when (or (= 1 (forward-line 1)) (eq (point) (point-max)))
    	(insert "\n"))
      ;; now insert as many time as requested
      (while (> n 0)
    	(insert current-line)
    	(decf n)))))

;; goto-char
(defun exz-goto-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(defun exz-new-line-previous ()
  (interactive)
  (move-beginning-of-line 1)
  (insert "\n")
  (previous-line)
  (indent-for-tab-command))

(defun exz-new-line-forward ()
  (interactive)
  (move-end-of-line 1)
  (insert "\n")
  (indent-for-tab-command))

;; full screen
(defun fullscreen ()
  "Full screen."
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

;; window move
(defun window-move-up (&optional arg)
  "Current window move-up 2 lines."
  (interactive "P")
  (if arg
      (scroll-up arg)
    (scroll-up 2)))

(defun window-move-down (&optional arg)
  "Current window move-down 3 lines."
  (interactive "P")
  (if arg
      (scroll-down arg)
    (scroll-down 3)))

(defun other-window-move-up (&optional arg)
  "Other window move-up 1 lines."
  (interactive "p")
  (scroll-other-window arg))

(defun other-window-move-down (&optional arg)
  "Other window move-down 2 lines."
  (interactive "P")
  (if arg
      (scroll-other-window-down arg)
    (scroll-other-window-down 2)))

; tramp
(setq tramp-chunksize 500)

;;; exz-others.el ends here
(provide 'exz-others)

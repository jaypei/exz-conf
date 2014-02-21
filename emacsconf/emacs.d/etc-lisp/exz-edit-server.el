;; filename   : exz-edit-server.el
;; created at : 2014-02-20 12:23:25
;; author     : jaypei <jaypei97159@gmail.com>

;;; Package --- Summary
;;; Commentary:

;; chrome plugin: edit with emacs
;; listening: 127.0.0.1:9292

;;; Code:

(exz-add-search-path "site-lisp/edit-server")
(require 'edit-server)
(edit-server-start)

;;; exz-edit-server.el ends here
(provide 'exz-edit-server)


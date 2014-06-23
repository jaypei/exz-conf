;;; multi-eshell-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (multi-eshell multi-eshell-switch multi-eshell-go-back)
;;;;;;  "multi-eshell" "multi-eshell.el" (21413 10533 958341 442000))
;;; Generated autoloads from multi-eshell.el

(autoload 'multi-eshell-go-back "multi-eshell" "\
Switch to buffer multi-eshell-last-buffer.

\(fn &optional IGNORED)" t nil)

(autoload 'multi-eshell-switch "multi-eshell" "\
If current buffer is not an multi-eshell, switch to current multi-eshell buffer. Otherwise, switch to next multi-eshell buffer.

\(fn &optional IGNORED)" t nil)

(autoload 'multi-eshell "multi-eshell" "\
Creates a shell buffer. If one already exists, this creates a new buffer, with the name '*shell*<n>', where n is chosen by the function generate-new-buffer-name.

\(fn &optional NUMSHELLS)" t nil)

;;;***

;;;### (autoloads nil nil ("multi-eshell-pkg.el") (21413 10533 965884
;;;;;;  354000))

;;;***

(provide 'multi-eshell-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; multi-eshell-autoloads.el ends here

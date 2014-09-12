;;; confluence-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (confluence-search confluence-get-page) "confluence"
;;;;;;  "confluence.el" (21522 42402 0 0))
;;; Generated autoloads from confluence.el

(autoload 'confluence-get-page "confluence" "\
Loads a confluence page for the given SPACE-NAME and PAGE-NAME
into a buffer (if not already loaded) and switches to it.
Analogous to `find-file'.  Every time you navitage to a page with
this function (or M-. `confluence-get-page-at-point'), it is
saved off into a stack (`confluence-tag-stack') that you can then
pop back out of to return back through your navigation path (with
M-* `confluence-pop-tag-stack').

\(fn &optional PAGE-NAME SPACE-NAME ANCHOR-NAME)" t nil)

(autoload 'confluence-search "confluence" "\
Runs a confluence search for QUERY, optionally restricting the results to
the given SPACE-NAME.

\(fn &optional QUERY SPACE-NAME)" t nil)

;;;***

;;;### (autoloads nil nil ("confluence-edit.el" "confluence-pkg.el"
;;;;;;  "confluence-xml-edit.el") (21522 42403 108404 0))

;;;***

(provide 'confluence-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; confluence-autoloads.el ends here

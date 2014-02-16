;;; unit-test-match-plugin.el -- unit-tests for match-plugin.

;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/el-expectations.el")
;; (install-elisp "http://www.emacswiki.org/cgi-bin/wiki/download/el-mock.el")
(dont-compile
  (when (fboundp 'expectations)
    (require 'anything)
    (require 'anything-match-plugin)
    (expectations
      (desc "anything-mp-3-get-patterns-internal")
      (expect '((identity . "foo"))
        (anything-mp-3-get-patterns-internal "foo"))
      (expect '((identity . "foo") (identity . "bar"))
        (anything-mp-3-get-patterns-internal "foo bar"))
      (expect '((identity . "foo") (not . "bar"))
        (anything-mp-3-get-patterns-internal "foo !bar"))
      (expect '((identity . ".") (not . "bar") (identity . "foo"))
        (anything-mp-3-get-patterns-internal "!bar foo"))
      (desc "agp-command-line")
      (expect "grep -ih foo /f1"
        (agp-command-line "foo" '("/f1")))
      (expect "grep -ih foo /f1 | grep -ih bar"
        (agp-command-line "foo bar" '("/f1")))
      (expect "grep -ih foo /f1 | grep -ih -v bar"
        (agp-command-line "foo !bar" '("/f1")))
      (expect "grep -ih foo /f1 /f\\ 2 | grep -ih -v bar | grep -ih baz"
        (agp-command-line "foo !bar baz" '("/f1" "/f 2")))
      (expect (concat "grep -ih foo " (expand-file-name "~/.emacs.el"))
        (agp-command-line "foo" '("~/.emacs.el")))
      (expect "grep -ih f\\ o /f\\ 1"
        (agp-command-line "f  o" '("/f 1")))
      (expect "grep -ih foo /f1 | head -n 5"
        (agp-command-line "foo" '("/f1") 5))
      (expect "grep -ih foo /f1 | head -n 5 | nkf -w"
        (agp-command-line "foo" '("/f1") 5 "nkf -w"))
      (expect "cat /f1 | head -n 5 | nkf -w"
        (agp-command-line "" '("/f1") 5 "nkf -w"))
      (expect "tac /f1 | grep -ih foo"
        (agp-command-line "foo" '("/f1") nil nil t))
      (expect "tac /f1 | grep -ih foo | head -n 5 | nkf -w"
        (agp-command-line "foo" '("/f1") 5 "nkf -w" t))
      (expect "tac /f1 | head -n 5 | nkf -w"
        (agp-command-line "" '("/f1") 5 "nkf -w" t))
      (desc "anything-mp-1-search")
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-1-search "th+ r" nil t)))
      (desc "anything-mp-2-search")
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-2-search "h+ r" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-2-search "r th+" nil t)))
      (desc "anything-mp-3-search")
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "h+ r" nil t)))
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "th+ r" nil t)))
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "r th+" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "under hue" nil t)))
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "r th+ n" nil t)))
      (desc "anything-mp-3-search")
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "th der" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "th ders" nil t)))
      (desc "anything-mp-3-search not")
      (expect t
        (with-temp-buffer
          (insert "threshold\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "h !der" nil t)))
      (expect t
        (with-temp-buffer
          (insert "threshold\nthunder\n")
          (goto-char 1)
          (anything-mp-3-search "!der h" nil t)))
      (desc "anything-mp-3p-search")
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3p-search "th der" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char 1)
          (anything-mp-3p-search "h ders" nil t)))
      (desc "anything-mp-3p-search not")
      (expect t
        (with-temp-buffer
          (insert "\nthreshold\nthunder\n")
          (goto-char 1)
          (anything-mp-3p-search "th !der" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "threshold\nthunder\n")
          (goto-char 1)
          (anything-mp-3p-search "h !der" nil t)))
      (desc "anything-mp-3-search-backward")
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3-search-backward "h der" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3-search-backward "th ders" nil t)))
      (desc "anything-mp-3-search-backward not")
      (expect t
        (with-temp-buffer
          (insert "threshold\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3-search-backward "h !der" nil t)))
      (expect t
        (with-temp-buffer
          (insert "threshold\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3-search-backward "!der h" nil t)))
      (desc "anything-mp-3p-search-backward")
      (expect (non-nil)
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3p-search-backward "th der" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "fire\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3p-search-backward "h der" nil t)))
      (desc "anything-mp-3p-search-backward not")
      (expect t
        (with-temp-buffer
          (insert "\nthreshold\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3p-search-backward "th !der" nil t)))
      (expect nil
        (with-temp-buffer
          (insert "threshold\nthunder\n")
          (goto-char (point-max))
          (anything-mp-3p-search-backward "h !der" nil t)))
      (desc "anything-mp-1-match")
      (expect (non-nil)
        (anything-mp-1-match "thunder" "th+ r"))
      (desc "anything-mp-2-match")
      (expect (non-nil)
        (anything-mp-2-match "thunder" "h+ r"))
      (expect nil
        (anything-mp-2-match "thunder" "r th+"))
      (desc "anything-mp-3-match")
      (expect (non-nil)
        (anything-mp-3-match "thunder" "h+ r"))
      (expect (non-nil)
        (anything-mp-3-match "thunder" "th+ r"))
      (expect (non-nil)
        (anything-mp-3-match "thunder" "r th+"))
      (expect nil
        (anything-mp-3-match "thunder" "under hue"))
      (expect (non-nil)
        (anything-mp-3-match "thunder" "r th+ n"))
      (desc "anything-mp-3-match not")
      (expect (non-nil)
        (anything-mp-3-match "threshold" "th !der"))
      (expect (non-nil)
        (anything-mp-3-match "threshold" "!der th"))
      (desc "anything-mp-3-match")
      (expect (non-nil)
        (anything-mp-3-match "thunder" "h der"))
      (expect nil
        (anything-mp-3-match "thunder" "h ders"))
      (desc "anything-mp-3p-match")
      (expect (non-nil)
        (anything-mp-3p-match "thunder" "th der"))
      (expect nil
        (anything-mp-3p-match "thunder" "h der"))
      (desc "anything-mp-3p-match not")
      (expect (non-nil)
        (anything-mp-3p-match "threshold" "th !der"))
      (expect nil
        (anything-mp-3p-match "threshold" "h !der"))
      (desc "with identity match")
      (expect '(identity)
        (assoc-default 'match
                       (car (anything-compile-sources
                             '(((name . "FOO")
                                (candidates-in-buffer)))
                             '(anything-compile-source--candidates-in-buffer
                               anything-compile-source--match-plugin)))))
      (expect '(identity)
        (assoc-default 'match
                       (car (anything-compile-sources
                             '(((name . "FOO")
                                (match identity)))
                             '(anything-compile-source--match-plugin)))))
      (desc "functional")
      (expect '(("FOO" ("thunder")))
        (anything-test-candidates '(((name . "FOO")
                                     (candidates "fire" "thunder")))
                                  "th r"
                                  '(anything-compile-source--match-plugin)))
      (expect '(("FOO" ("one two")))
        (let ((anything-mp-space-regexp "\\\\ "))
          (anything-test-candidates '(((name . "FOO")
                                       (candidates "one two" "three four")))
                                    "e\\ t"
                                    '(anything-compile-source--match-plugin))))
      (expect '(("FOO" ("one two")))
        (let ((anything-mp-space-regexp "  "))
          (anything-test-candidates '(((name . "FOO")
                                       (candidates "one two" "three four")))
                                    "e  t"
                                    '(anything-compile-source--match-plugin))))
      (expect '(("FOO" ("thunder")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "fire\nthunder\nthanks\n"))))
                                     (candidates-in-buffer)))
                                  "th r"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("foo" "foobar")))
        (anything-test-candidates '(((name . "FOO")
                                     (candidates "foobar" "foo")))
                                  "foo"
                                  '(anything-compile-source--match-plugin)))
      (expect '(("FOO" ("foo" "foobar")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "foobar\nfoo\n"))))
                                     (candidates-in-buffer)))
                                  "foo"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("foo")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "foo\n"))))
                                     (candidates-in-buffer)))
                                  "foo"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("foo")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "bar\nfoo\ntest\n"))))
                                     (candidates-in-buffer)))
                                  "foo"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("foobar" "foo")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "foobar\nfoo\n"))))
                                     (candidates-in-buffer)))
                                  ""
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("foo" "foobar")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "foobar\nfoo\n"))))
                                     (candidates-in-buffer)
                                     (search-from-end)))
                                  "foo"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("elisp" "elp")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "elp\nelisp\n"))))
                                     (candidates-in-buffer)
                                     (search-from-end)))
                                  "el p"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("elisp" )))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "elp\nelisp\n"))))
                                     (candidates-in-buffer)
                                     (search-from-end)))
                                  "el+ isp"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      ;; prefix multi -> multi
      (expect '(("FOO" ("info.el" "elisp-info")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "info.el\nelisp-info\n"))))
                                     (candidates-in-buffer)))
                                  "el info"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      ;; multi not
      (expect '(("FOO" ("info.el")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "info.el\nelisp-info\n"))))
                                     (candidates-in-buffer)))
                                  "info !elisp"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("info.el")))
        (anything-test-candidates '(((name . "FOO")
                                     (init
                                      . (lambda ()
                                          (with-current-buffer (anything-candidate-buffer 'global)
                                            (insert "info.el\nelisp-info\n"))))
                                     (candidates-in-buffer)))
                                  "!elisp info"
                                  '(anything-compile-source--candidates-in-buffer
                                    anything-compile-source--match-plugin)))
      (expect '(("FOO" ("info.el")))
        (anything-test-candidates '(((name . "FOO")
                                     (candidates "info.el" "elisp-info.el")))
                                  "info !elisp"
                                  '(anything-compile-source--match-plugin)))
      (expect '(("FOO" ("info.el")))
        (anything-test-candidates '(((name . "FOO")
                                     (candidates "info.el" "elisp-info.el")))
                                  "!elisp info"
                                  '(anything-compile-source--match-plugin)))
      )))
;; (anything-compile-sources '(((name . "test"))) anything-compile-source-functions)

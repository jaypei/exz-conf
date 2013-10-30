(setq org-publish-project-alist
      '(("note-org"
         :base-directory "~/work/vimwiki/org"
         :publishing-directory "~/work/vimwiki/org2-publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"
    href=\"./style/emacs.css\"
    type=\"text/css\"/>")
        ("note-static"
         :base-directory "~/work/vimwiki/org2"
         :publishing-directory "~/work/vimwiki/org2-publish"
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "jaypei97159@gmail.com"
         )))

(provide 'exz-org)

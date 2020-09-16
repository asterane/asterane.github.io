(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("asterane-org"
         :base-directory "./org/"
         :base-extension "org"
         :publishing-directory "."
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4 ;; Could be whatever
         :html-extension "html"
         :body-only t ;; Only export between <body> </body>
         :auto-sitemap t
         )
        ("asterane-static"
         :base-directory "./org/"
         :base-extension "html\\|md\\|css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|php"
         :publishing-directory "."
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("asterane-all" :components ("asterane-org" "asterane-static"))
        ))

(defun asterane-publish ()
  "Publishes all projects regardless of file modification status."
    (let ((current-prefix-arg 4))
      (call-interactively 'org-publish-all)
      )
  )

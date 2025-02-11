(asdf:defsystem :commondoc-markdown-frontmatter
  :depends-on (:common-doc
               :commondoc-markdown
               :cl-yaml)
  :components ((:file "commondoc-markdown-frontmatter")))
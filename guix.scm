(use-modules (gnu packages lisp)
             (gnu packages lisp-xyz)
             (gnu packages)
             (guix packages)
             (fuglesteg packages lisp)
             (guix build-system asdf)
             (guix gexp)
             ((guix licenses) #:prefix license:))

(package
 (name "sbcl-commondoc-markdown-frontmatter")
 (version "1.0")
 (source (local-file (dirname (current-filename)) #:recursive? #t))
 (build-system asdf-build-system/sbcl)
 (inputs (list sbcl-cl-yaml
               sbcl-common-doc
               sbcl-commondoc-markdown))
 (synopsis "") (description "") (license license:expat) (home-page ""))
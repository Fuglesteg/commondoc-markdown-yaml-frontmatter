(uiop:define-package :commondoc-markdown-frontmatter
  (:use :cl)
  (:import-from :commondoc-markdown
                :markdown)
  (:import-from :common-doc
                :metadata)
  (:import-from :common-doc.format
                :parse-document)
  (:export :markdown-frontmatter))

(in-package :commondoc-markdown-frontmatter)

(defclass markdown-frontmatter (markdown) ())

(defmethod parse-document :around ((markdown markdown-frontmatter) (input string))
  "Parse yaml frontmatter and add it to the metadata of the returned node"
  (if (string= (subseq input 0 3) "---")
      (let* ((yaml-start-position (1+ (search (string #\Newline) input)))
             (yaml-end-position (+ yaml-start-position
                                   (search "---" (subseq input yaml-start-position))))
             (yaml-string (subseq input yaml-start-position yaml-end-position))
             (yaml (yaml:parse yaml-string))
             (parsed-document (call-next-method markdown (subseq input (+ 3 yaml-end-position)))))
        (setf (metadata parsed-document) yaml)
        parsed-document)
      (call-next-method)))

#!/usr/local/bin/sbcl --script


(defvar *path* "/path/to/file")
(defvar *name* "cat")

(defvar *user-name* "Name")


(let ((str (make-array '(0) :element-type 'base-char
			    :fill-pointer 0 :adjustable t)))

  (with-output-to-string (stream str)
    (uiop:run-program (list *name* *path*)
		      :output stream))

  (cond ((search "Name" str)
	 (format t "~%~%~18@{-~}~%   ~a~%~18@{-~}~%~a ~a~%~a ~a~%~%"
		 "GitHub token"
		 " [ USER ]:" *user-name*
		 "[ TOKEN ]:" (subseq str 14 54)))

	((format t "~%~%[ ERROR ]: Not found token!~%~%"))))

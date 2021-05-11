#!/usr/local/bin/sbcl --script


(defvar *path* "/home/bourne/anaconda3/envs/brain_skills/bin/")
(defvar *name* "jupyter")

(defvar *arg-1* "lab")
(defvar *arg-2* "list")


(let ((str (make-array '(0) :element-type 'base-char
			    :fill-pointer 0 :adjustable t)))

  (with-output-to-string (stream str)
    (uiop:run-program (list (concatenate 'string *path* *name*)
			    *arg-1*
			    *arg-2*) :output stream))

  ;; TODO: Implement search and display of all running servers
  (cond ((search "http://localhost:8888/?token=" str)
	 (format t "~%~30@{-~}~%  ~a~%~30@{-~}~%~a ~a~%~a ~a~%~%"
		 (subseq str 0 26)
		 "[ POINT ]:"
		 (subseq str 27 48)
		 "[ TOKEN ]:"
		 (subseq str 56 104)))

	((format t "~%~%[ ERROR ]: No server running!~%~%"))))

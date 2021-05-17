#!/usr/local/bin/sbcl --script


(defvar *path* "/home/bourne/anaconda3/envs/brain_skills/bin/")
(defvar *name* "jupyter")

(defvar *arg-1* "lab")
(defvar *arg-2* "list")


;; TODO: To func this block:
(let ((str (make-array '(0) :element-type 'base-char
			    :fill-pointer 0 :adjustable t)))

  (with-output-to-string (stream str)
    (uiop:run-program (list (concatenate 'string *path* *name*)
			    *arg-1*
			    *arg-2*) :output stream))

  (labels ((test (start)
	     (let* ((title (subseq str start (+ start 26)))
		    (point (subseq str (+ start 27) (+ start 48)))
		    (token (subseq str (+ start 56) (+ start 104))))

	       (cond ((search "http://" (subseq str start))
		      ;; TODO: Go title to up:
		      (format t "~%~30@{-~}~%  ~a~%~30@{-~}~%~a ~a~%~a ~a~%~%"
			      title
			      "[ POINT ]:" point
			      "[ TOKEN ]:" token)
		      ;; TODO: Recursion realisation:
		      (cond ((search "http://" (subseq str (+ start 27)))
			     (print (subseq str (+ start 27))))))

		     ((format t "~%~%[ ERROR ]: No server running!~%~%"))))))

    (test 0)))

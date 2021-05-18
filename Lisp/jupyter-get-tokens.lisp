#!/usr/local/bin/sbcl --script


(defvar *path* "/home/bourne/anaconda3/envs/brain_skills/bin/")
(defvar *name* "jupyter")

(defvar *arg-1* "lab")
(defvar *arg-2* "list")


(defun get-jupyter-tokens ()
  (let ((str (make-array '(0) :element-type 'base-char
			      :fill-pointer 0 :adjustable t)))

    (with-output-to-string (stream str)
      (uiop:run-program (list (concatenate 'string *path* *name*)
			      *arg-1*
			      *arg-2*) :output stream))

    (format t "~%~30@{-~}~%  ~a~%~30@{-~}~%~a" (subseq str 0 26) "")

    (labels ((print-token (start)
	       (let* ((point (subseq str (+ start 27) (+ start 48)))
		      (token (subseq str (+ start 56) (+ start 104)))
		      (next  (search "http://" (subseq str (+ start 104))))

		      (dir (cond (next

				  (subseq str
					  (+ start 104)
					  (+ start 104 (- next 1))))

				 ((subseq str
					  (+ start 104)
					  (- (length str) 1))))))

		 (cond ((search "http://" (subseq str start))
			(format t "~%~a ~a~a~%~a ~a~%~%"
				"[ POINT ]:" point dir
				"[ TOKEN ]:" token)

			(when next
			  (print-token (+ start next 77))))

		       ((format t "~%~%[ ERROR ]: No server running!~%~%"))))))

      (print-token 0))))


(get-jupyter-tokens)

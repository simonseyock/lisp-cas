(defun match(pattern expr)
	(if (consp pattern)
			(if (and (consp expr) (eq (length pattern) (length expr)))
					(gather-matches (mapcar #'match pattern expr))
					NIL)
			(if (is-matcher pattern)
					(list (list pattern expr))
					(eq pattern expr))))


(defun gather-matches(matches)
	(if (some #'null matches)
			NIL
			(or (reduce #'append (remove T matches)) T)))
				

(defun is-matcher(symb)
	(and (eq (type-of symb) 'symbol)
			 (eq (length (string symb)) 1)
			 (alpha-char-p (char (string symb) 0))))

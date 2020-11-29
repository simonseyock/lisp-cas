;; (setq simplifications ('(+ x 0) 'x))

;; (defun cas(expr rules)
;;	(reduce #'apply-rule (append (list expr) rules))
;;	)


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














;; (defmacro pipe(lis &rest operations)
;; 	(reduce (lambda (result op)
;; 						`(,@op ,result))
;; 					(cons lis operations)))

;; (defmacro curry(fun &rest params)
;; 	(lambda (&rest rest) (apply 'fun (append params rest))))

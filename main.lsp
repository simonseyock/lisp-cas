(load "substitute.lsp")
(load "evaluate.lsp")


(defvar *simplifications*
  (list
	 (list '(* x 1) 'x)
	 (list '(* 1 x) 'x)
	 (list '(* x 0) 0)
	 (list '(* 0 x) 0)
	 (list '(+ x 0) 'x)
	 (list '(+ 0 x) 'x)))


(defun apply-rules(expr rules)
	(reduce (lambda (prev rule)
						(cas-subst (first rule) (second rule) prev))
					rules
					:initial-value expr))


(defun cass(expr rules)
  (if (consp expr)
			(apply-rules (mapcar (lambda (e)
														 (cass e rules))
													 expr)
									 rules)
			expr))


(write (cass '(+ 0 (+ x 0)) *simplifications*))

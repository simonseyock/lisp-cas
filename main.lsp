

(load "substitute.lsp")
(load "evaluate.lsp")

(defvar *simplifications*
  (list (list '(* x 1) 'x)
		(list '(* 1 x) 'x)
		(list '(* x 0) 0)
		(list '(* 0 x) 0)
		(list '(+ x 0) 'x)
		(list '(+ 0 x) 'x)
	   ))

(defun cass(expr rules)
  (if (consp expr)
	  (mapcar (lambda (e)
				(let ((result (cass e rules)))
				  (reduce (lambda (prev r)
							(cas-subst (first r) (second r) prev))
						  rules
						  :initial-value result)))
			  expr)
	  expr))

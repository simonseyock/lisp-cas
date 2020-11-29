
(load "match.lsp")

(defun cas-eval (expr)
  (if (and (consp expr)
      (notany (lambda (e)
                (or (is-matcher e) (consp e)))
              expr))
      (eval expr)
      expr))

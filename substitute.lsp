(load "match.lsp")
(load "evaluate.lsp")


(defun replace-matches (replacement matches)
  (if (consp replacement)
      (mapcar (lambda (r)
                (replace-matches r matches))
              replacement)
      (reduce (lambda (val match)
                (if (eq val (first match))
                    (second match)
                    val))
              matches
              :initial-value replacement)))


(defun cas-subst (pattern replacement expr)
  (let ((matches (match pattern expr))
        (expr (cas-eval expr)))
    (cond
      ((null matches)
       (if (consp expr)
           (mapcar (lambda (e)
                     (cas-subst pattern replacement e))
                   expr)
           expr))
      ((consp matches)
       (replace-matches replacement matches))
      (t replacement))))

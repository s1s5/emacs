(defvar point-stack nil "a list to store cursor position. Each entry is a list of the form (bufferObject pointPosition)")

(defun point-stack-push ()
  "Push current location and buffer info onto stack."
  (interactive)
  (message "Location marked.")
  (setq point-stack (cons (list (current-buffer) (point)) point-stack)))

(defun point-stack-pop ()
  "Pop a location off the stack and move to buffer"
  (interactive)
  (if (null point-stack)
      (message "Stack is empty.")
    (switch-to-buffer (caar point-stack))
    (goto-char (cadar point-stack))
    (setq point-stack (cdr point-stack))))


(defun toggle-off-input-method ()
  (interactive)
  (if current-input-method (deactivate-input-method)))

;; Enable ANSI color support in Eshell.
;; 'eshell-output-filter-functions' is the correct hook for post-processing Eshell output.
(add-hook 'eshell-output-filter-functions 'ansi-color-apply)

;; Password prompt detection for comint-mode (used by shell and eshell).
;; This tells Emacs to recognize "[sudo]" as a password prompt, allowing
;; for hidden input. The hook ensures it's set when a shell buffer is created.
(add-hook 'shell-mode-hook
          (lambda ()
            (setq comint-password-prompt-regexp "\\[sudo\\]")))

;; Open *shell* buffers in the same window.
;; This prevents new shell buffers from splitting your window unnecessarily.
(add-to-list 'same-window-buffer-names "*shell*")

;; Echo commands in comint-mode.
;; When t, commands you type in shell/eshell will be echoed back to the buffer.
(setq comint-process-echoes t)

;; Associate interpreters with major modes.
;; This helps Emacs use the correct major mode when editing files
;; associated with these interpreters (e.g., 'jperl' with 'perl-mode').
(setq interpreter-mode-alist
      (append '(("jperl" . perl-mode)
                ("sh" . fundamental-mode)
                ("bash" . fundamental-mode))
              interpreter-mode-alist))

; (add-hook 'after-save-hook 'my/make-file-executable)

;; Increase the number of commands stored in the shell command history.
;; 'comint-input-ring-size' controls the history size for comint-mode buffers.
(setq comint-input-ring-size 1024)

;; よくわからないけど、エラーがでる/home/shogo/config/init_emacs/05-shell.el. Invalid face: ansi-color-blue
;;; (set-face-attribute 'ansi-color-blue nil :foreground "#87CEFA") ;; Sky Blue

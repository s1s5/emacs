(ido-mode t)
(require 'ido)
(icomplete-mode 1)

(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys ()
  ;; (define-key ido-completion-map (kbd "C-f") 'ido-next-match)
  ;; (define-key ido-completion-map (kbd "C-b") 'ido-prev-match)
  (define-key ido-completion-map (kbd "C-f") (lambda ()
                                               (interactive)
                                               (ido-next-match)
                                               (popwin:display-buffer (get-buffer (car ido-cur-list)))
                                               ))
  (define-key ido-completion-map (kbd "C-b") (lambda ()
                                               (interactive)
                                               (ido-prev-match)
                                               (popwin:display-buffer (get-buffer (car ido-cur-list)))
                                               ))
  )

(defun my-custom-ido-switch-buffer ()
  (interactive)
  (ido-switch-buffer)
  (display-buffer (get-buffer (car ido-cur-list)))
  )

(add-hook 'ido-setup-hook 'ido-define-keys)
(setq ido-default-buffer-method 'display)

(setq my-unignored-buffers '("*shell*"))
(defun my-ido-ignore-func (name)
  (and
   (or (string-match "^magit-\*" name)
       (string-match "^\*" name)
       )
   (not (member name my-unignored-buffers))
   )
  )
(setq ido-ignore-buffers '("\\` " my-ido-ignore-func))

;; find-fileするときにido-modeうっとおしいので使わない
(define-key (cdr ido-minor-mode-map-entry) [remap find-file] nil)

;; 同じバッファでも今カーソルのあるWindowで開く
(setq ido-default-buffer-method 'selected-window)
(setq ido-default-file-method 'selected-window)


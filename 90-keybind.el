;;;; global key-map

;; unset unused keys
(global-unset-key (kbd "C-l"))
(global-unset-key (kbd "<f1>"))
(global-unset-key (kbd "<f2>"))
(global-unset-key (kbd "<f3>"))
(global-unset-key (kbd "<f4>"))
(global-unset-key (kbd "<f5>"))
(global-unset-key (kbd "<f6>"))
(global-unset-key (kbd "<f7>"))
(global-unset-key (kbd "<f8>"))
(global-unset-key (kbd "<f9>"))
(global-unset-key (kbd "<f10>"))
(global-unset-key (kbd "<f11>"))
(global-unset-key (kbd "<f12>"))
(global-unset-key (kbd "C-M-v"))
(global-unset-key (kbd "M-u"))
(global-unset-key (kbd "M-l"))
(global-unset-key (kbd "M-t"))
(global-unset-key (kbd "M-k"))
(global-unset-key (kbd "M-j"))
(global-unset-key (kbd "M-c"))
(global-unset-key (kbd "M-p"))
(global-unset-key (kbd "C-/"))
; (global-unset-key (kbd "C-_"))  ; これがundo
(global-unset-key (kbd "C-\\"))
(global-unset-key (kbd "C-x h"))
(global-unset-key (kbd "C-x C-h"))
(global-unset-key (kbd "C-M-f"))
; (global-set-key (kbd "M-s") nil)

(global-unset-key (kbd "M->"))
(global-unset-key (kbd "M-<"))

;; mailに飛ぶ機能を消す
(global-unset-key "\C-xm")
(global-unset-key "\C-b")

;; 基本的な設定
;;;; キー操作
(global-set-key [delete] 'delete-char)
(global-set-key [backspace] 'delete-backward-char)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "C-b") 'backward-char)
(global-set-key (kbd "M-<") 'beginning-of-buffer)
(global-set-key (kbd "M->") 'end-of-buffer)


;;;;;; 分割したWindowの切り替えを\C-oでできるように
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-o") 'other-window-or-split)

;;;; よく使う操作
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-i") 'indent-region)
(global-set-key (kbd "C-l") 'recenter)
(global-set-key (kbd "C-/") 'undo)
(global-set-key (kbd "C-\\") 'undo)
(global-set-key (kbd "C-c C-c") 'comment-region)
;; (global-set-key (kbd "C-M-n") 'forward-list)
;; (global-set-key (kbd "C-M-p") 'backward-list)
(global-set-key (kbd "<f9>") 'all-indent)

;; バッファ間移動
(windmove-default-keybindings)  ;; Shift + 矢印でバッファ移動
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; popwin
(global-set-key (kbd "C-x C-l") 'popwin:display-last-buffer)

;; helm
;; (define-key global-map (kbd "M-x")     'helm-M-x)
; (global-set-key (kbd "C-x C-r") 'helm-recentf)  ; 動かなくなった
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
; (global-set-key (kbd "M-r") 'helm-resume)
; (global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-j") #'helm-rg)
(defun set-c-c++-helm-do-ag ()
  (define-key c++-mode-map (kbd "M-j") 'helm-do-ag)
  )
(add-hook 'c++-mode-hook 'set-c-c++-helm-do-ag)

(global-set-key (kbd "M-k") 'helm-do-ag-project-root)
; (global-set-key (kbd "M-u") 'helm-ls-git-ls)  ; 動かなくなった


;; auto complete
; (global-set-key (kbd "M-u") 'auto-complete)

;; flycheck
(global-set-key "\M-p" 'flycheck-previous-error)
(global-set-key "\M-n" 'flycheck-next-error)

;; magit
(global-set-key (kbd "<f2>") 'magit-status)

(add-hook
 'nxml-mode-hook
 '(lambda () 
    (define-key nxml-mode-map (kbd "M-h") 'backward-kill-word)
    )
 )

;; helm-agの結果の編集の仕方
;; Please check latest version. You can switch to edit mode by C-c C-e.
;; You edit something.
;; And you can save by C-c C-c(abort by C-c C-k)

;; tagjump
(global-set-key (kbd "M-*") 'pop-tag-mark)

;; M-?をunsetしたいができない
(global-unset-key (kbd "M-%"))
(global-unset-key (kbd "M-?"))
(global-unset-key (kbd "M-i"))
(global-set-key (kbd "M-i") 'my-gemini-cli-chat-combined)

(global-set-key (kbd "<f4>") 'query-replace-regexp)


;; デフォルトのInput Methodを無効化
(setq default-input-method nil)

;; C-\ のバインドを強制的に解除 (Global Map)
(global-unset-key (kbd "C-\\"))

;; input-method関連のコマンドを無効化（念押し）
;; 誤ってコマンドを叩いても何も起きないようにする
(defun toggle-input-method () (interactive) (message "Emacs IME is disabled."))
(defun set-input-method (input-method) (interactive) (message "Emacs IME is disabled."))

; agent-shell
(global-set-key (kbd "<f8>") 'agent-shell-goose-start-agent)

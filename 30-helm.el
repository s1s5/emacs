(require 'helm)
(require 'helm-files)
(require 'helm-command)
(require 'helm-tags)

;; ディレイは0.02秒
(setq helm-input-idle-delay 0.002)

;; minibuffer で C-h が効かない
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;;  C-x C-f でタブ補完（選択）できない
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
;; TAB で補完する. dottida?
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

;; 自動補完を無効
;; (custom-set-variables '(helm-ff-auto-update-initial-value nil))
(setq helm-ff-auto-update-initial-value nil)

;; C-hでバックスペースと同じように文字を削除
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
;; TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能
; (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)


;; Disable helm in some functions
(add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

;; Emulate `kill-line' in helm minibuffer
;; minibuffer で C-k を押すと先頭から削除されるし kill ring にも追加されない
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

;;helm-find-files でタブを 2 回押すと新しいファイル用のバッファが作成されるのを防ぐ
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

;; 候補のフィルタリングのロジックがストレス
(defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
  "Transform the pattern to reflect my intention"
  (let* ((pattern (ad-get-arg 0))
         (input-pattern (file-name-nondirectory pattern))
         (dirname (file-name-directory pattern)))
    (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
    (setq ad-return-value
          (concat dirname
                  (if (string-match "^\\^" input-pattern)
                      ;; '^' is a pattern for basename
                      ;; and not required because the directory name is prepended
                      (substring input-pattern 1)
                    (concat ".*" input-pattern))))))

;; *を補完時につけるとメジャーモードでフィルタするようになっとるので消す
(defun helm-buffers-list-pattern-transformer (pattern)
  (if (equal pattern "")
      pattern
    ;; Escape '.' to match '.' instead of an arbitrary character
    (setq pattern (replace-regexp-in-string "\\." "\\\\." pattern))
    (let ((first-char (substring pattern 0 1)))
      (cond ((equal first-char "*")
             (concat " " pattern))
            ((equal first-char "=")
             (concat "*" (substring pattern 1)))
            (t
             pattern)))))

(add-to-list 'helm-source-buffers-list
             '(pattern-transformer helm-buffers-list-pattern-transformer))

(set-face-foreground 'helm-selection "#E2804A")
(set-face-background 'helm-selection nil)
(set-face-attribute 'helm-selection nil :underline '(:color "#E2804A" :style wave) :inherit nil)

;; (set-back-foreground 'helm-selection "#111144")
(set-face-foreground 'helm-buffer-file "#fafad2")
(set-face-background 'helm-buffer-file "#C9A64C")
(set-face-foreground 'helm-ff-file     "#fafad2")
(set-face-foreground 'helm-grep-file   "#fafad2")


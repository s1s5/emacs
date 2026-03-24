(use-package shell-maker :ensure t)

;; agent-shellで進捗バー/ヘッダー完全無効
(use-package agent-shell
  :ensure t
  :after shell-maker
  :config
  ;; エージェント設定
  (setq agent-shell-agents '(("goose" "goose" "acp" nil))
        agent-shell-goose-authentication
        (agent-shell-make-goose-authentication
         :openai-api-key "your-api-key"))

  ;; モードライン/ヘッダー完全抑制 ← これで進捗バー消滅
  :hook (agent-shell-mode . (lambda ()
                              ;; ヘッダー・モードライン非表示
                              (setq-local header-line-format nil)
                              (setq-local mode-line-format nil)

                              ;; 再描画最小化
                              (setq-local jit-lock-defer-time 3.0)
                              (setq-local scroll-conservatively 100000)

                              ;; キー設定
                              (local-set-key (kbd "RET") 'newline)
                              (local-set-key (kbd "C-c C-c") 'shell-maker-submit)
                              (local-set-key (kbd "C-c C-k") 'agent-shell-interrupt)
                              )
                          )
  )

;; グローバル抑制
(setq header-line-format nil)
(blink-cursor-mode -1)
(setq jit-lock-defer-time 1.0)

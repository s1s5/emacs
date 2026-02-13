;;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;; --------------------------------------------------
;;;; general configuration
;;;; --------------------------------------------------

;; 自動保存とかしない
(setq auto-save-default nil)
(setq auto-save-visited-name nil)
(setq auto-save-mode nil )

;; delete autosave file when exit
(setq delete-auto-save-files t)

;; backupファイル作成しない
(setq make-backup-files nil)
(setq backup-inhibited t)

;; tabの幅は4
(setq-default tab-width 4)

;; ベルはほんとになくなればいい
;; (setq visible-bell t) <= Ctrl+gで落ちる様になる, https://qiita.com/ongaeshi/items/696407fc6c42072add54
(setq ring-bell-function 'ignore)

;; paren blink
(show-paren-mode t)

;; show the region
(transient-mark-mode t)

;; erase tool bar
; (tool-bar-mode 0)

;; Don't consider upper or lower when completion
;(setq completion-ignore-case t)

;; Don't blink the cursor
(blink-cursor-mode nil)

;; show the number of char the place where the cursor is
(column-number-mode t)

;; show the number of line the place where the cursor is
(line-number-mode t)

;; scroll each line
(setq scroll-step 1)

;; show the file name at the title bar
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; show the current function name at the mode line
(which-function-mode 1)

;; 一行が長い場合に折り返し表示する
(setq truncate-partial-width-windows nil)

;; gzとかを直接編集可能に
(auto-compression-mode t)

;; show the time at the mode line
;; (display-time nil)

(setq lazy-highlight-initial-delay 0)

; (mouse-wheel-mode t)
;(setq mouse-wheel-follow-mouse t)
;(setq font-lock-support-mode 'jit-lock-mode)
;(setq font-lock-maximum-decoration t)

;; This is for python mode.
(setq-default indent-tabs-mode nil)

;; don't show password
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

;; M-x disk. This command does save file, reload file , etc ...
(autoload 'disk "disk" "Save, revert, or find file." t)


;; partial-completion-mode とはオンにしておくと、例えば、C-x bで「s-k.el<TAB>」とかすると、「skk-kakasi.el」と展開してくれたりします。
;; (partial-completion-mode 1)

;; incremental MiniBuffer Completion preview
;; (icomplete-mode 1)

;; バッファの自動再読み込み
(global-auto-revert-mode 1)

;; 同じ名前のファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; emacs -nw で起動した時にメニューバーを消す
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;; http://stackoverflow.com/questions/2706527/make-emacs-stop-asking-active-processes-exist-kill-them-and-exit-anyway
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))

;; ファイルの最後には改行が必要。
(setq require-final-newline t)

;; C-l の時の動作 middle top bottom
(setq recenter-positions '(middle))

;; avoid "Symbolic link to ...."
(setq vc-follow-symlinks t)

(require 'tramp)
(setq tramp-default-method "ssh")
(setq my-tramp-ssh-completions
      '((tramp-parse-sconfig "~/.ssh/config")
        (tramp-parse-netrc "~/.netrc")))
(mapc (lambda (method)
        (tramp-set-completion-function method my-tramp-ssh-completions))
            '("scp" "sftp" "ssh" "ftp")) ;;  "rsync" "scpc" "scpx"

;; windowの分割条件
(setq split-height-threshold nil)
(setq split-width-threshold nil)

;; シンボリックリンクを開いてもリンク元のファイルのパスで開かれる
(setq-default find-file-visit-truename t)

;; デフォルトでdisableな関数を使った時に、これから有効にするか聞かれるのがうっとおしいのでOFFにする
(setq disabled-command-function 'ignore)

; (setq ns-pop-up-frames nil)

;; スクラッチのモード変更、最初のメッセージを表示しない
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message "")

;; lockファイル(.#で始まるファイル)を作成しない
(setq create-lockfiles nil)

(aset char-width-table ?… 1)
(aset char-width-table ?▼ 1)
(aset char-width-table ?▲ 1)
(aset char-width-table ?★ 1) ; どっちにしていいかわからない、temrinalレベルでだめっぽい
(aset char-width-table ?→ 1)
(aset char-width-table ?↓ 1)
(aset char-width-table ?↑ 1)
(aset char-width-table ?← 1)
(aset char-width-table ?’ 1)
(aset char-width-table ?♡ 1)
(aset char-width-table ?‘ 1)
(aset char-width-table ?■ 1)
(aset char-width-table ?♩ 1)
(aset char-width-table ?┴ 1)
(aset char-width-table ?┘ 1)
(aset char-width-table ?─ 1)
(aset char-width-table ?└ 1)
(aset char-width-table ?┐ 1)
(aset char-width-table ?│ 1)
(aset char-width-table ?┬ 1)
(aset char-width-table ?┌ 1)
(aset char-width-table ?┼ 1)
(aset char-width-table ?①  1)
(aset char-width-table ?② 1)
(aset char-width-table ?※ 1)
(aset char-width-table ?× 1)
(aset char-width-table ?③ 1)
(aset char-width-table ?★ 1)
(aset char-width-table ?□ 1)
(aset char-width-table ?└ 1)
(aset char-width-table ?├ 1)
(aset char-width-table ?≪ 1)
(aset char-width-table ?≫ 1)
; (aset char-width-table ?❗️ 1)
(aset char-width-table ?○ 1)
(aset char-width-table ?∟ 1) 
(setq warning-minimum-level :error)
(aset char-width-table ?⇒ 1)

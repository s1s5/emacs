;;;; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;; --------------------------------------------------
;;;; general configuration
;;;; --------------------------------------------------

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

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
; (defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
;   "Prevent annoying \"Active processes exist\" query when you quit Emacs."
;   (flet ((process-list ())) ad-do-it))
(setq confirm-kill-processes nil)

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

; (aset char-width-table ?… 1)
; (aset char-width-table ?▼ 1)
; (aset char-width-table ?▲ 1)
; (aset char-width-table ?★ 1) ; どっちにしていいかわからない、temrinalレベルでだめっぽい
; (aset char-width-table ?→ 1)
; (aset char-width-table ?↓ 1)
; (aset char-width-table ?↑ 1)
; (aset char-width-table ?← 1)
; (aset char-width-table ?’ 1)
; (aset char-width-table ?♡ 1)
; (aset char-width-table ?‘ 1)
; (aset char-width-table ?■ 1)
; (aset char-width-table ?♩ 1)
; (aset char-width-table ?┴ 1)
; (aset char-width-table ?┘ 1)
; (aset char-width-table ?─ 1)
; (aset char-width-table ?└ 1)
; (aset char-width-table ?┐ 1)
; (aset char-width-table ?│ 1)
; (aset char-width-table ?┬ 1)
; (aset char-width-table ?┌ 1)
; (aset char-width-table ?┼ 1)
; (aset char-width-table ?①  1)
; (aset char-width-table ?② 1)
; (aset char-width-table ?※ 1)
; (aset char-width-table ?× 1)
; (aset char-width-table ?③ 1)
; (aset char-width-table ?★ 1)
; (aset char-width-table ?□ 1)
; (aset char-width-table ?└ 1)
; (aset char-width-table ?├ 1)
; (aset char-width-table ?≪ 1)
; (aset char-width-table ?≫ 1)
; ; (aset char-width-table ?❗️ 1)
; (aset char-width-table ?○ 1)
; (aset char-width-table ?∟ 1) 
; (setq warning-minimum-level :error)
; (aset char-width-table ?⇒ 1)


(add-to-list
 'display-buffer-alist
 '("\\*Warnings\\*"
   (display-buffer-no-window)))
;; 警告バッファを自動でポップアップさせない
(setq display-warning-minimum-level :error)

; リンクそのものを訪問する
(setq find-file-visit-truename nil)
(setq vc-follow-symlinks nil)


(defun my-setup-ambiguous-width ()
  (let ((table (make-char-table nil)))
    ;; 記号やギリシャ文字などの曖昧幅の範囲を2カラムに設定
    (set-char-table-range char-width-table '(#x00A1  .  #x00FF) 1)
    (set-char-table-range char-width-table '(#x0370  .  #x03FF) 1) ; ギリシャ文字
    (set-char-table-range char-width-table '(#x0400  .  #x1FFF) 1)
    (set-char-table-range char-width-table '(#x2010  .  #x205E) 1) ; 記号・ダッシュ
    (set-char-table-range char-width-table '(#x2100  .  #x218F) 1) ; 文字様記号
    (set-char-table-range char-width-table '(#x2190  .  #x21FF) 1) ; 文字様記号
    (set-char-table-range char-width-table '(#x2200  .  #x22FF) 1) ; 数学記号
    (set-char-table-range char-width-table '(#x2300  .  #x23FF) 1) ; 技術記号
    (set-char-table-range char-width-table '(#x2400  .  #x24FF) 1) ; 
    (set-char-table-range char-width-table '(#x2500  .  #x257F) 1) ; 罫線
    (set-char-table-range char-width-table '(#x2580  .  #x259F) 1) ; ブロック要素
    (set-char-table-range char-width-table '(#x25A0  .  #x25FF) 1) ; 幾何学図形
    (set-char-table-range char-width-table '(#x2600  .  #x26FF) 1) ; シンボル
    (set-char-table-range char-width-table '(#x2700  .  #x2704) 1) ; 
    (set-char-table-range char-width-table '(#x2705  .  #x2705) 2) ;
    (set-char-table-range char-width-table '(#x2706  .  #x273F) 1) ; 
    (set-char-table-range char-width-table '(#x2740  .  #x2740) 2) ; 
    (set-char-table-range char-width-table '(#x2741  .  #x274F) 1) ; 
    (set-char-table-range char-width-table '(#x2750  .  #x2757) 1) ; Dingbats (❗️ はここ)
    (set-char-table-range char-width-table '(#x2758  .  #x275F) 1) ; Dingbats (❗️ はここ)
    (set-char-table-range char-width-table '(#x2760  .  #x27BF) 1) ; Dingbats (❗️ はここ)
    (set-char-table-range char-width-table '(#x2800  .  #x2DFF) 1) ; 
    (set-char-table-range char-width-table '(#x2DE0  .  #x2DFF) 2) ; 
    (set-char-table-range char-width-table '(#x2E00  .  #xFFFF) 2) ; 
    (set-char-table-range char-width-table '(#x1F000 . #x1F2FF) 1) ; Emoticons / Supplemental Symbols
    ; (set-char-table-range char-width-table '(#xFE0F . #xFFFF) 0) ; VS16 (U+FE0F) 単体の幅を 0 にして、先行文字の幅を邪魔させない

    (dolist (c '(
                 ;; 時計・UI
                 ?⌚ ?⌛ ?⏩ ?⏪ ?⏫ ?⏬ ?⏰ ?⏳ ?〈 ?〉 ?♿ ?⚓ ?⛎ 00
                    
                    ;; 幾何・ブロック
                    ?◽ ?◾ ?⚪ ?⚫ ?⬛ ?⬜ ?⭐ ?⭕
                    
                    ;; 天気・物体
                    ?☔ ?☕ ?⚓ ?⚡ ?⚽ ?⚾ ?⛄ ?⛅ ?⛔ ?⛪ ?⛲ ?⛳ ?⛵ ?⛺ ?⛽
                    
                    ;; 星座
                    ?♈ ?♉ ?♊ ?♋ ?♌ ?♍ ?♎ ?♏ ?♐ ?♑ ?♒ ?♓
                    
                    ;; 記号系（UI）
                    ?➕ ?➖ ?➗ ?➰ ?➿
                    
                    ;; 手・装飾
                    ?✊ ?✋ ?✨
                    
                    ;; Dingbats（厳選）
                    ?❄ ?❌ ?❎ ?❓ ?❔ ?❕ ?❗ ?❀

                    
                    ))
      (aset char-width-table c 2))

    (aset char-width-table ?❄ 1)
    (aset char-width-table ?❐ 1)
    (aset char-width-table ?❑ 1)
    (aset char-width-table ?❒ 1)
    (aset char-width-table ?❖ 1)
    
    (set-char-table-range composition-function-table '(#xFE00 . #xFE0F) nil)
    ;; ターミナル表示用テーブルも強制的に合わせる
    (when (fboundp 'set-terminal-char-width)
      (set-terminal-char-width #x25B2 2))

    ))


(add-hook 'after-init-hook #'my-setup-ambiguous-width)
(add-hook 'tty-setup-hook #'my-setup-ambiguous-width)



;;; П
;;; о
;;; -япои.
;;; 일본
;;; 어로,
;;; 📝
;;; 🔍
;;; 💻
;;; 🌐
;;; ✗  : #x2717
;;; ✓  : #x2713
;;; ✅ : #x2705 
;;; ❌ : #x274C

; (with-eval-after-load 'mule
;   )
; 
; (with-eval-after-load 'mule
;   ;; 絵文字プロトコルを強制的に Wide (2) に上書き
;   (let ((table (make-char-table nil)))
;     ;; ❗️ (U+2757) を含む範囲を強制的に 2 カラムへ
;     (set-char-table-range char-width-table #x2757 2)
;     ;; VS16 (U+FE0F) 単体の幅を 0 にして、先行文字の幅を邪魔させない
;     (set-char-table-range char-width-table #xFE0F 0)
;     
;     ;; 矢印記号（U+2190など）を含む範囲を Unicode 優先にする
;     (set-char-table-range char-code-property-table '(#x2100 . #x21FF) 'unicode)
;     
;     ;; その上で、Emacsが「2カラム分」の空白をターミナルに予約するように強制
;     (set-char-table-range char-width-table '(#x2100 . #x21FF) 2)
;     
;     ;; 広範囲にわたる絵文字・記号の再定義
;     (dolist (range '((#x2100 . #x27BF)    ; Letterlike Symbols ～ Dingbats
;                      (#x1F300 . #x1F9FF))) ; Miscellaneous Symbols and Pictographs
;       (set-char-table-range char-width-table range 2))))
; 
; (when (not (display-graphic-p))
;   ;; U+2757 の合成ルールをテーブルから抹消する
;   (set-char-table-range composition-function-table #x2757 nil)
;   ;; ついでに Variation Selector も無効化
;   (set-char-table-range composition-function-table #xFE0F nil))


;; ターミナルでの描画遅延と最適化によるゴミ残りを防ぐ
(setq redisplay-dont-pause t)
(setq fast-but-imprecise-scrolling nil)

;; 画面更新時の「行全体の書き換え」をより確実にする（tmux環境で有効）
(setq tty-erase-display t)

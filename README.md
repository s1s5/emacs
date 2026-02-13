```
;; 警告抑制は基本オフ推奨（必要なら有効化）
;; (setq byte-compile-warnings '(not obsolete))

(require 'package)
(require 'cl-lib)

(defun ensure-dir (dir)
  (unless (file-directory-p dir)
    (make-directory dir t)))

;; ディレクトリ作成
(ensure-dir "~/.config/elisp")
(ensure-dir "~/.config/elisp-packages")

;; emacs ディレクトリを ~/.config 配下へ
(setq user-emacs-directory "~/.config/emacs/")

;; package 保存先変更
(setq package-user-dir "~/.config/elisp-packages")

;; リポジトリ
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; init-loader を自動インストール
(defvar bootstrap-packages '(init-loader))

(let ((missing
       (cl-loop for p in bootstrap-packages
                unless (package-installed-p p)
                collect p)))
  (when missing
    (package-refresh-contents)
    (mapc #'package-install missing)))

(require 'init-loader)

;; elisp ディレクトリを load-path に追加
(add-to-list 'load-path "~/.config/elisp")

;; init-loader 設定
(setq init-loader-show-log-after-init 'error-only)

;; 統一ディレクトリからロード
(init-loader-load "~/.config/elisp")

;; 99-custom.elでカスタマイズ
```

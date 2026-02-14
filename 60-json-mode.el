(when (require 'json-mode nil t)
  
  ;; json ファイルに json-mode を適用
  (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
  
  (defun my-json-mode-indent-setup ()
    ;; タブ禁止
    (setq indent-tabs-mode nil)
    
    ;; インデント幅 2
    (setq tab-width 2)
    (setq js-indent-level 2)
    (setq json-mode-indent-level 2)

    ;; electric-indent 有効ならそのまま活かす
    )

  (add-hook 'json-mode-hook #'my-json-mode-indent-setup))

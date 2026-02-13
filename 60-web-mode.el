;;; 62-web-mode.el --- 

;; Copyright (C) 2016  Shogo Sawai

;; Author: Shogo Sawai <sawai@sizebook.co.jp>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 


;;; Code:
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  ; (set-face-foreground 'web-mode-html-tag-bracket-face "#666")
  )
(add-hook 'web-mode-hook 'web-mode-hook)

(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'")
        ;; ("blade"  . "\\.blade\\.")
        )
      )

(add-hook
 'web-mode-hook
 '(lambda ()
    (set-face-foreground 'web-mode-html-tag-face "#00bfff")
    (set-face-foreground 'web-mode-html-tag-bracket-face "#00bfff")
    (set-face-foreground 'web-mode-html-attr-name-face "#ff7f50")
    (set-face-foreground 'web-mode-html-attr-value-face "#7fffd4")
    )
 )

;; copy from https://cortyuming.hateblo.jp/entry/2015/07/07/083326
; (progn
;   (setq web-mode-content-types-alist
;         '(("jsx" . "\\.js[x]?\\'" . "tsx" . "\\.ts[x]?\\'")))
;   (add-hook 'web-mode-hook
;             (lambda ()
;               (when (equal web-mode-content-type "tsx")
;                 (add-to-list 'web-mode-comment-formats '("tsx" . "//" ))
;                 (flycheck-add-mode 'javascript-eslint 'web-mode)
;                 (flycheck-mode t)
;                 )))
;   )

;;; 62-web-mode.el ends here

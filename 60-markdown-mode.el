;;; 60-markdown-mode.el --- 

;; Copyright (C) 2016  Shogo Sawai

;; Author: Shogo Sawai <sawai@pinemint>
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

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))

(add-hook
 'markdown-mode-hook
 '(lambda ()
    (set-face-foreground 'markdown-list-face "#C0D7BB")
    (set-face-foreground 'markdown-markup-face "#9BC9B6")
    (set-face-foreground 'markdown-header-delimiter-face "#9BC9B6")
    (set-face-foreground 'markdown-italic-face nil)
    (set-face-background 'markdown-italic-face nil)
    (set-face-foreground 'font-lock-variable-name-face nil)
    (set-face-background 'font-lock-variable-name-face nil)
    ))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "`") nil)
  (define-key gfm-mode-map (kbd "`") nil))

;;; 60-markdown-mode.el ends here

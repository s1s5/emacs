;;; 37-magit.el --- 

;; Copyright (C) 2015  Shogo Sawai

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

(require 'magit)

;; -- tutorial -- 
;; M-x magit-status
;; <select file> -> e (you can see diff)
;; <select file> -> s (git add <file>) (S -> all files staged)
;; c -> commit window, C-c C-c -> commit
;; f -> fetch/ F -> git pull
;; P -> git push (M-x magit-push)
;; u -> unstage
;; k -> delete file
;; l -> log
;; z : create stash 
;; A : stash pop
;; b : git checkout / B : git checkout -b 
;; see -> http://gom.hatenablog.com/entry/20090524/1243170341

;; cursorが載っていない状態でのaddedのface
(set-face-foreground 'magit-diff-added "#00FF00")
(set-face-background 'magit-diff-added "#000000")
;; cursorが載っている状態のaddedのface
(set-face-foreground 'magit-diff-added-highlight "#00FF00")
(set-face-background 'magit-diff-added-highlight "#000000")
;; cursor載っていない状態のremoved
(set-face-foreground 'magit-diff-removed "#FF0000")
(set-face-background 'magit-diff-removed "#000000")
;; cursor載っている状態のremoved
(set-face-foreground 'magit-diff-removed-highlight "#FF0000")
(set-face-background 'magit-diff-removed-highlight "#000000")
;; lineを選択してstageしようとするときのface
(set-face-background 'magit-diff-lines-boundary "blue")

(set-face-foreground 'magit-section-highlight nil)
(set-face-foreground 'magit-section-heading nil)
(set-face-foreground 'magit-section-secondary-heading nil)
(set-face-foreground 'magit-section-heading-selection nil)

(set-face-background 'magit-section-highlight "#000")
(set-face-background 'magit-section-heading "#000")
(set-face-background 'magit-section-secondary-heading "#000")
(set-face-background 'magit-section-heading-selection "#000")

(set-face-foreground 'magit-diff-file-heading nil)
(set-face-foreground 'magit-diff-file-heading-highlight nil)
(set-face-foreground 'magit-diff-file-heading-selection nil)
(set-face-foreground 'magit-diff-hunk-heading nil)
(set-face-foreground 'magit-diff-hunk-heading-highlight nil)
(set-face-foreground 'magit-diff-hunk-heading-selection nil)
(set-face-foreground 'magit-diff-hunk-region nil)
(set-face-foreground 'magit-diff-lines-heading nil)
(set-face-foreground 'magit-diff-lines-boundary nil)
(set-face-foreground 'magit-diff-conflict-heading nil)
(set-face-foreground 'magit-diff-added "#00ff00")
(set-face-foreground 'magit-diff-removed "#ff0000")
(set-face-foreground 'magit-diff-our nil)
(set-face-foreground 'magit-diff-base nil)
(set-face-foreground 'magit-diff-their nil)
(set-face-foreground 'magit-diff-context nil)
(set-face-foreground 'magit-diff-added-highlight "#00ff00")
(set-face-foreground 'magit-diff-removed-highlight "#ff0000")
(set-face-foreground 'magit-diff-our-highlight nil)
(set-face-foreground 'magit-diff-base-highlight nil)
(set-face-foreground 'magit-diff-their-highlight nil)
(set-face-foreground 'magit-diff-context-highlight nil)
(set-face-foreground 'magit-diff-whitespace-warning nil)
(set-face-foreground 'magit-diffstat-added nil)
(set-face-foreground 'magit-diffstat-removed nil)

(set-face-background 'magit-diff-file-heading "#000")
(set-face-background 'magit-diff-file-heading-highlight "#000")
(set-face-background 'magit-diff-file-heading-selection "#000")
(set-face-background 'magit-diff-hunk-heading  "#000")
(set-face-background 'magit-diff-hunk-heading-highlight nil)
(set-face-background 'magit-diff-hunk-heading-selection nil)
(set-face-background 'magit-diff-hunk-region nil)
(set-face-background 'magit-diff-lines-heading nil)
(set-face-background 'magit-diff-lines-boundary nil)
(set-face-background 'magit-diff-conflict-heading nil)
(set-face-background 'magit-diff-added nil)
(set-face-background 'magit-diff-removed nil)
(set-face-background 'magit-diff-our nil)
(set-face-background 'magit-diff-base nil)
(set-face-background 'magit-diff-their nil)
(set-face-background 'magit-diff-context nil)
(set-face-background 'magit-diff-added-highlight nil)
(set-face-background 'magit-diff-removed-highlight nil)
(set-face-background 'magit-diff-our-highlight nil)
(set-face-background 'magit-diff-base-highlight nil)
(set-face-background 'magit-diff-their-highlight nil)
(set-face-background 'magit-diff-context-highlight nil)
(set-face-background 'magit-diff-whitespace-warning nil)
(set-face-background 'magit-diffstat-added nil)
(set-face-background 'magit-diffstat-removed nil)

(set-face-foreground 'magit-branch-current "#8859C1")
(set-face-foreground 'magit-branch-local "#8859C1")
(set-face-foreground 'magit-head "#8859C1")
(set-face-foreground 'magit-log-author "#9BC9B6")
(set-face-foreground 'magit-log-date "#E2804A")
(set-face-foreground 'magit-log-graph "#E2804A")

(set-face-foreground 'smerge-refined-added "#000000")
(set-face-foreground 'smerge-markers "#000000")
(set-face-background 'smerge-markers nil)

;; (set-face-attribute 'smerge-markers nil
;;                     :inverse-video nil)
; (set-face-foreground 'magit-popup-argument "#E25B3D")
; (set-face-foreground 'magit-popup-disabled-argument "#E2804A")

; (defun disable-magit-highlight-in-buffer () 
;   (face-remap-add-relative 'magit-item-highlight '()))
; (add-hook 'magit-status-mode-hook 'disable-magit-highlight-in-buffer)

; (add-hook 'magit-commit-mode-hook 'disable-magit-highlight-in-buffer)
; (add-hook 'magit-log-mode-hook 'disable-magit-highlight-in-buffer)
; (add-hook 'magit-diff-mode-hook 'disable-magit-highlight-in-buffer)

(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

;; Command: magit-section-show
;; Command: magit-section-hide

(add-hook
 'magit-mode-hook
 '(lambda () 
    (define-key magit-mode-map (kbd "M-s") 'magit-section-show)
    (define-key magit-mode-map (kbd "M-h") 'magit-section-hide)
    )
 )

(eval-after-load "magit-log"
  '(progn
     (custom-set-variables
      '(magit-log-margin '(t "%Y/%m/%d %H:%M" magit-log-margin-width t 16)))))

;;; 37-magit.el ends here


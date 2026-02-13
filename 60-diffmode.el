;;; 60-diffmode.el ---                               -*- lexical-binding: t; -*-

;; Copyright (C) 2016  sawai

;; Author: sawai <sawai@mint>
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

(add-hook 'diff-mode-hook
          (lambda ()
            (set-face-foreground 'diff-added "#00ff00")
            (set-face-background 'diff-added nil)
            (set-face-foreground 'diff-changed "#00ffff")
            (set-face-background 'diff-changed nil)
            (set-face-foreground 'diff-context "#888888")
            (set-face-background 'diff-context nil)
            (set-face-foreground 'diff-file-header "#ffffff")
            (set-face-background 'diff-file-header "#222222")
            (set-face-foreground 'diff-function "#ddffdd")
            (set-face-background 'diff-function nil)
            (set-face-foreground 'diff-header "#ffdddd")
            (set-face-background 'diff-header "#444444")
            (set-face-foreground 'diff-hunk-header "#ddddff")
            (set-face-background 'diff-hunk-header "#444444")
            (set-face-foreground 'diff-index "#ffffff")
            (set-face-background 'diff-index nil)
            (set-face-foreground 'diff-indicator-added "#88ff88")
            (set-face-background 'diff-indicator-added nil)
            (set-face-foreground 'diff-indicator-changed "#88ffff")
            (set-face-background 'diff-indicator-changed nil)
            (set-face-foreground 'diff-indicator-removed "#ff8888")
            (set-face-background 'diff-indicator-removed nil)
            (set-face-foreground 'diff-nonexistent "#ff88aa")
            (set-face-background 'diff-nonexistent nil)
            (set-face-foreground 'diff-refine-added "#88ffaa")
            (set-face-background 'diff-refine-added nil)
            (set-face-foreground 'diff-refine-changed "#88aaff")
            (set-face-background 'diff-refine-changed nil)
            (set-face-foreground 'diff-refine-removed "#ff88aa")
            (set-face-background 'diff-refine-removed nil)
            (set-face-foreground 'diff-removed "#ff0000")
            (set-face-background 'diff-removed nil)
            ))
;;; 60-diffmode.el ends here

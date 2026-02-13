;; ポップアップで候補等を表示するように変更
(setq pop-up-windows nil)

(require 'popwin)

; (setq display-buffer-function 'popwin:display-buffer)
; (setq special-display-function 'popwin:special-display-popup-window)

; (setq helm-swoop-split-window-function 'popwin:display-buffer)
; (setq helm-samewindow nil)

;; (push '(dired-mode :position top) popwin:special-display-config)
;; ;  (push '("*Completions*" :height 0.3) popwin:special-display-config)
;; (push '("*grep*" :height 0.3) popwin:special-display-config)
;; (push '("*compilation*" :height 0.3 :noselect t :stick t) popwin:special-display-config)
;; (push '("helm" :regexp t :height 0.4) popwin:special-display-config)
;; (push '("*Helm Swoop*" :height 0.4) popwin:special-display-config)

(setq popwin:special-display-config
      '(
        (dired-mode :position bottom)
        ("*grep*" :noselect t :height 0.4)
        ("*compilation*" :height 0.4 :noselect t :stick t)
        ("*helm-ag*" :height 0.4)
        ("*Helm Swoop*" :height 0.4)
        ("*magit-edit-log*" :height 0.5)
        ("*magit-commit*" :noselect t :height 30 :width 80 :stick t)
        ("*magit-diff*" :noselect t :height 30 :width 80)
        ("*magit-edit-log*" :noselect t :height 15 :width 80)
        ;; ("*magit-process*" :noselect t :height 15 :width 80)
        ("*magit-process" :regexp t :noselect t :height 0.4)
        ("*Completions*" :height 0.4 :noselect t)
        ("*Ido Completions*" :height 0.4 :noselect t)
        ("*Compile-Log*" :height 0.4 :noselect t :stick nil)
        ("helm" :regexp t :height 0.4)
        ("*helm lsgit*" :height 0.4)
))


(setq popwin:popup-window-position 'bottom)


;; Special Display Config
;; :regexp : If the value is non-nil, PATTERN will be used as regexp to matching buffer.
;; :width, :height : Specify width or height of the popup window. If no size specified, popwin:popup-window-width or popwin:popup-window-height will be used. See also position keyword.
;; :position : The value must be one of (left top right bottom). The popup window will shown at the position of the frame. If no position specified, popwin:popup-window-position will be used.
;; :noselect : If the value is non-nil, the popup window will not be selected when it is shown.
;; :dedicated : If the value is non-nil, the popup window will be dedicated to the original popup buffer. In this case, when another buffer is selected in the popup window, the popup window will be closed immedicately and the selected buffer will be shown on the previously selected window.
;; :stick : If the value is non-nil, the popup window will be stuck when it is shown.
;; :tail : If the value is non-nil, the popup window will show the last contents.

; (when (require 'popwin)
;   (setq helm-samewindow nil)
;   (setq display-buffer-function 'popwin:display-buffer)
;   )

;; find-fileとかhelmを使ったときにバッファとかカーソルの位置が気に入らないのを修正！
(setq helm-display-function 'popwin:pop-to-buffer)

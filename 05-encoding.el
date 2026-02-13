; -*- mode: emacs-lisp; coding: utf-8 -*-

;;;; encoding configuration 'euc-jp or 'utf-8 or ...
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;日本語環境:UTF-8
(set-language-environment "Japanese")
;;(set-language-environment "English")
; (set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
; (set-keyboard-coding-system 'utf-8)



;;;; http://bogytech.blogspot.com/search/label/%E6%96%87%E5%AD%97%E5%B9%85
;;      for japanese
(toggle-enable-multibyte-characters 1)
; (set-language-environment "Japanese")
; (load "ja-compatible")

;; set default coding system
(setq default-buffer-file-coding-system 'utf-8-ja)
; (set-default-coding-systems 'utf-8-ja-unix)
; (set-terminal-coding-system 'utf-8-ja-unix)
; (set-keyboard-coding-system 'utf-8-ja-unix)
; (set-file-name-coding-system 'utf-8-ja-unix) ; <= Invalid coding system: utf-8-ja-unix
(set-selection-coding-system 'ctext)
(setq sendmail-coding-system 'iso-2022-jp)

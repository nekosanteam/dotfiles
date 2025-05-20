;;; -*- lexical-binding: t -*-

;;; 言語設定
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8)

;;; MELPA (必要な時)
(when nil
  (progn
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
    (package-refresh-contents)
    (package-initialize)))

;;; w32-ime, tr-ime [MELPA]
(use-package tr-ime
  :config
  (tr-ime-advanced-install)
  (setq default-input-method "W32-IME")
  (w32-ime-initialize)
  (wrap-function-to-control-ime 'universal-argument nil)
  )

;;; 矩形選択モード(C-RET で開始。C-z,C-x,C-c,C-v は設定しない)
(setq cua-enable-cua-keys nil)

;;; whitespace
(use-package whitespace
  :config
  (setq whitespace-style '(face tabs trailing space-before-tab missing-newline-at-eof))
  (global-whitespace-mode 1))

;;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style
   '((java-mode . "java") (awk-mode . "awk") (other . "whitesmith")))
 '(column-number-mode t)
 '(cua-mode t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(consult consult-denote denote denote-markdown denote-menu orderless
             tr-ime w32-ime))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Migu 1M" :foundry "outline" :slant normal :weight regular :height 98 :width normal)))))

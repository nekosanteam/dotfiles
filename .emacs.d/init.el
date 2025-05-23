;;; -*- lexical-binding: t -*-

;;; 言語設定
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8)

;;; MELPA (必要な時)
(when nil
  (progn
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
    (package-refresh-contents)
    (package-initialize))
  )

;;; w32-ime, tr-ime [MELPA]
(use-package tr-ime
  :config
  (tr-ime-advanced-install)
  (setq default-input-method "W32-IME")
  (w32-ime-initialize)
  (w32-ime-wrap-function-to-control-ime 'universal-argument)
  (w32-ime-wrap-function-to-control-ime 'read-string)
  (w32-ime-wrap-function-to-control-ime 'read-char)
  (w32-ime-wrap-function-to-control-ime 'read-from-minibuffer)
  (w32-ime-wrap-function-to-control-ime 'y-or-n-p)
  (w32-ime-wrap-function-to-control-ime 'yes-or-no-p)
  (w32-ime-wrap-function-to-control-ime 'map-y-or-n-p)
  (w32-ime-wrap-function-to-control-ime 'register-read-with-preview)
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

;;; markdown-mode
(use-package markdown-mode
  :mode
  (("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . gfm-mode))
  )

;;; orderless, vertico, consult, marginalia
(use-package orderless
  :config
  (setq completion-styles '(orderless)))

(use-package vertico
  :config
  (setq vertico-count 20)
  (vertico-mode))

(use-package marginalia
  :config
  (marginalia-mode))

(use-package consult
  :bind
  (("C-x b" . consult-buffer))
  )

;;; denote
(use-package denote-menu)

(use-package denote
  :hook (dired-mode . denote-dired-mode)
  :bind
  (("C-c n n" . denote)
   ("C-c n d" . list-denotes)
   ("C-c n l" . denote-link)
   ("C-c n b" . denote-backlinks))
  :config
  (setq my-denote-directory-env (or (getenv "OneDriveCommercial") (getenv "OneDrive") (getenv "HOME") (getenv "USERPROFILE")))
  (setq denote-directory (expand-file-name "Applications/notes" my-denote-directory-env))
  (setq my-denote-subdirectory-name (expand-file-name (format-time-string "%Y/%m") denote-directory))
  (unless (file-directory-p my-denote-subdirectory-name)
    (make-directory my-denote-subdirectory-name t))
  (setq denote-use-directory my-denote-subdirectory-name)
  (setq denote-file-type 'markdown-yaml)
  )

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
   '(cmake-mode consult consult-denote denote denote-markdown denote-menu
		edit-indirect marginalia markdown-mode orderless
		tr-ime vertico w32-ime))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Migu 1M" :foundry "outline" :slant normal :weight regular :height 98 :width normal)))))

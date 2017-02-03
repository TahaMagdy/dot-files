;; Removing the tool bar
(tool-bar-mode -1)
;; Removing scroll bar
(scroll-bar-mode -1)
j
;; Hide startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Size
(set-face-attribute 'default nil :height 160)

;; Start Emacs in a fullscreen
(custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized)))))

(load "package")
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'evil)
(evil-mode t)

(add-to-list 'load-path "~/.emacs.d/emacs-powerline")
(require 'powerline)


 
(setq package-archive-enable-alist '(("melpa" deft magit)))

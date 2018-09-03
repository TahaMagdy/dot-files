(require 'ido)
(ido-mode 'buffers) ;; only use this line to turn off ido for file names!
(setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
               "*Messages*" "Async Shell Command"))


;; Emacs.app open files in an existing frame instead of a new frame
(setq ns-pop-up-frames nil)

; No title bar icon
;(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;(add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; assuming you are using a dark theme
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)



; NO Buffers for messages
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

; Line numbers
(global-linum-mode t)

;; Removing the tool bar
(tool-bar-mode -1)
;; Removing scroll bar
(scroll-bar-mode -1)


;; Column number
(setq column-number-mode t)

;; NO F*!@$% tabs
(setq-default indent-tabs-mode nil)

(setq exec-path-from-shell-arguments '("-l"))




;; Hide startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq package-archive-enable-alist '(("melpa" deft magit)))

;; Size
(set-face-attribute 'default nil :height 160)

;; Disable alarms completely
(setq ring-bell-function 'ignore)

;; Automatically removes trailing whitespaces when file is saved
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
(setq auto-save-default nil)


;; parenthesis matching
(show-paren-mode)
(setq show-paren-delay 0.4)


;; Clear the shell
; c-l to clear :"d
(put 'erase-buffer 'disabled nil)
(global-set-key (kbd "C-l")     'erase-buffer)



(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Add themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'solarized-dark t)
;(set-face-attribute 'region nil :background "#d4d4d4") ;; selection color


; A function to toggle window split
(defun window-split-toggle ()
  "toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

; Silencing the f!2&^(% third-party warnings
(setq ad-redefinition-action 'accept)






; A function to toggle window split
(defun window-split-toggle ()
  "toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

; Silencing the f!2&^(% third-party warnings
(setq ad-redefinition-action 'accept)


(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("wanted" (or
                   (name . "^\\*ansi-term\\*$")
			       (mode . haskell-mode)
			       (mode . python-mode)
			       (mode . c-mode)
			       (mode . c++-mode)))
	       ("unwanted" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Completions\\*$")
			 (name . "^\\*Messages\\*$")))
	       ))))
(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "default")))
(setq ibuffer-show-empty-filter-groups nil)





;; My Packages; Compiled?
(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; evil pakage
(evil-mode 1)
; evil mappings
(evil-add-hjkl-bindings occur-mode-map 'emacs
(kbd "/")       'evil-search-forward
(kbd "n")       'evil-search-next
(kbd "N")       'evil-search-previous
(kbd "C-d")     'evil-scroll-down
(kbd "C-u")     'evil-scroll-up
(kbd "C-w C-w") 'other-window)
; * Scrolling & Buffers
(global-set-key (kbd "C-d")     'evil-scroll-down)
(global-set-key (kbd "C-u")     'evil-scroll-up)
(global-set-key (kbd "s-=")     'next-buffer)
(global-set-key (kbd "s--")     'previous-buffer)
(global-set-key (kbd "s-x")     'execute-extended-command)
(global-set-key (kbd "s-[")     'window-split-toggle)
(global-set-key (kbd "s-b")     'switch-to-buffer)              ; b -> buffer list
(global-set-key (kbd "s-w")     'switch-to-buffer-other-window) ; w -> window
(global-set-key (kbd "s-k")     'kill-this-buffer)                   ; k -> kill
(global-set-key (kbd "s-p")     'company-select-previous)
(global-set-key (kbd "s-n")     'company-select-next)
(global-set-key (kbd "s-0")     'scroll-other-window-down)
(global-set-key (kbd "s-9")     'scroll-other-window)
; * jk <3
(evil-escape-mode)
(setq-default evil-escape-key-sequence "jk" )
(setq-default evil-escape-delay 0.1)

(with-eval-after-load 'evil
  ;; the following two lines enable vim  in "named" buffers
  ;; if there is a buffer vim does not work in;
  ;; add the buffer name in a line like the following.
  (add-to-list 'evil-buffer-regexps '("*Packages*" . normal))
  (add-to-list 'evil-buffer-regexps '("*Custom Themes*" . normal))
  (with-eval-after-load 'package
    ;; movement keys j,k,l,h set up for free by defaulting to normal mode.
    ;; mark, unmark, install
    (evil-define-key 'normal package-menu-mode-map (kbd "m") #'package-menu-mark-install)
    (evil-define-key 'normal package-menu-mode-map (kbd "u") #'package-menu-mark-unmark)
    (evil-define-key 'normal package-menu-mode-map (kbd "x") #'package-menu-execute))
  )








;; Company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'haskell-mode-hook 'company-mode)
; tell company-mode to get completions from ghc-mod
(add-to-list 'company-backends 'company-ghc)




(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Haskell
; Interactive mode
(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)


; NOTE: you need to add ghc-mod





; Git-Gutter


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "89336ca71dae5068c165d932418a368a394848c3b8881b2f96807405d8c6b5b6" "4c7a1f0559674bf6d5dd06ec52c8badc5ba6e091f954ea364a020ed702665aa1" "f7eb64b27901812bbdbb91654c2a2e98555fa8d5b256144199925d6c7c0bd3bd" "c924950f6b5b92a064c5ad7063bb34fd3facead47cd0d761a31e7e76252996f7" default)))
 '(fci-rule-color "#3C3D37")
 '(frame-brackground-mode (quote dark))
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "  ")
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote ghci))
 '(haskell-tags-on-save t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (solarized-theme gruber-darker-theme auto-complete-clang-async ido-grid-mode idomenu ido-vertical-mode ## ibuffer-vc git-gutter cl-lib-highlight flycheck haskell-emacs ghci-completion evil-escape company-ghc company-cabal)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values (quote ((TeX-master . t))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-face-attribute 'region nil :background "#FEDEFF")


;; C/C++
(require 'auto-complete)
(require 'auto-complete-config)

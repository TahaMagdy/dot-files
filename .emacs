;; Emacs.app open files in an existing frame instead of a new frame
(setq ns-pop-up-frames nil)


;; Hide the mac-menu-bar
(setq ns-auto-hide-menu-bar t)

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

;;; Highlight text beyond 80th column
;(require 'whitespace)
;(setq whitespace-style '(face lines-tail))
;(setq whitespace-line-column 80)
;(global-whitespace-mode t)

;; Automatically removes trailing whitespaces when file is saved
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
(setq auto-save-default nil)


;; parenthesis matching
(show-paren-mode)
(setq show-paren-delay 0.4)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((((class color) (background light)) (:background "selectedTextBackgroundColor")))))

; Start emacs in a fullscreen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
    ("c924950f6b5b92a064c5ad7063bb34fd3facead47cd0d761a31e7e76252996f7" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "b747fb36e99bc7f497248eafd6e32b45613ee086da74d1d92a8da59d37b9a829" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "4c7a1f0559674bf6d5dd06ec52c8badc5ba6e091f954ea364a020ed702665aa1" "f7eb64b27901812bbdbb91654c2a2e98555fa8d5b256144199925d6c7c0bd3bd" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote ghci))
 '(haskell-tags-on-save t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (company-quickhelp ruby-compilation ob-ipython ein-mumamo ein ipython solarized-theme silkworm-theme dracula-theme company-jedi flycheck swift3-mode helm-sage ecb ruby-dev flyspell-correct latex-preview-pane auctex markdown-mode emacsql-mysql jedi 0blayout company-ghci yasnippet use-package relative-line-numbers org magit linum-relative iedit helm-swoop find-file-in-project evil-escape eldoc-extension company-ghc))))





;;;;;;;;;;;;;;;;;
(load "package")
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)




(evil-mode t)

; helm
(add-to-list 'load-path "~/.emacs.d/emacs-async")
(add-to-list 'load-path "~/.emacs.d/helm")
;(require 'helm-config)
(helm-mode t)

;; Mappings
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

; * Helm mappings
(global-set-key (kbd "s-m") #'helm-M-x)                         ; m -> modes
(global-set-key (kbd "s-f") #'helm-find-files)                  ; f -> files
(global-set-key (kbd "s-s") #'helm-swoop)                       ; s -> swoop
(define-key helm-map (kbd "s-p") 'helm-previous-line)
(define-key helm-map (kbd "s-n") 'helm-next-line)
(define-key helm-map (kbd "s-l") 'helm-execute-persistent-action) ; to right
(define-key helm-map (kbd "s-h") 'helm-find-files-up-one-level)   ; to lift



;; find-file-in-a-directory-recursively [expensive in case of huge number of files]
(global-set-key (kbd "M-i") #'find-file-in-current-directory)   ; i -> in-current



;; escape
(evil-escape-mode)
(setq-default evil-escape-key-sequence "jk" )
(setq-default evil-escape-delay 0.1)

;; LaTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)


;; IPython
(setq ein:use-auto-complete t)
; C-c C-k ein:worksheet-kill-cell -> delete a cell
;C-c C-a         ein:worksheet-insert-cell-above
;C-c C-b         ein:worksheet-insert-cell-below
;C-c C-c         ein:worksheet-execute-cell
;C-c C-e         ein:worksheet-toggle-output
;C-c TAB         ein:completer-complete
;C-c C-k         ein:worksheet-kill-cell
;C-c C-l         ein:worksheet-clear-output
;C-c C-n         ein:worksheet-goto-next-input
;C-c C-p         ein:worksheet-goto-prev-input
;C-c C-t         ein:worksheet-toggle-cell-type
;C-c C-u         ein:worksheet-change-cell-type
;C-c <down>      ein:worksheet-move-cell-down
;C-c <up>        ein:worksheet-move-cell-up


;;;;;;;;;;;;;;;;;

;; Add themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'solarized-dark t)
(set-face-attribute 'region nil :background "#d4d4d4") ;; selection color

;; Relative numbers
(global-relative-line-numbers-mode)
(defun relative-abs-line-numbers-format (offset)
  "the default formatting function.
return the absolute value of offset, converted to string."
  (if (= 0 offset)
      (number-to-string (line-number-at-pos))
    (number-to-string (abs offset))))
(setq relative-line-numbers-format 'relative-abs-line-numbers-format)


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

;; Silencing the f!2&^(% third-party warnings
(setq ad-redefinition-action 'accept)

;; Enable company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'haskell-mode-hook 'company-mode)
; instruct company-mode to get completions from ghc-mod
(add-to-list 'company-backends 'company-ghc)

;; Clear the shell
; c-l to clear :"d
(put 'erase-buffer 'disabled nil)
(global-set-key (kbd "C-l")     'erase-buffer)

;; makes emacs recognizes the paths in $path
(setenv "path" (concat (getenv "home") "/.cabal/bin:/.local/bin:/library/frameworks/python.framework/versions/2.7/bin:/library/frameworks/python.framework/versions/3.5/bin:~/computerscience/sage/sagemath:/usr/local/mysql/bin:/usr/local/bin/:/users/taha/.cabal/bin:/opt/local/bin:/opt/local/sbin:" (getenv "path")))
;    prepend them to `exec-path'
(setq exec-path
      (reverse
       (append
        (reverse exec-path)
        (list (concat (getenv "home") "/.local/bin") (concat (getenv "home") "/.cabal/bin")))))
(exec-path-from-shell-initialize)

;;;;;;;




;; Python
; * pyhton mode

; FlyCheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


; Jedi
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)
(elpy-enable)

(setq elpy-rpc-backend "jedi")
(company-quickhelp-mode 1)
(eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

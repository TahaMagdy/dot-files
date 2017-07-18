;; Emacs.app open files in an existing frame instead of a new frame
(setq ns-pop-up-frames nil)

;; Removing the tool bar
(tool-bar-mode -1)
;; Removing scroll bar
(scroll-bar-mode -1)

;; Column number
(setq column-number-mode t)

;; NO F*!@$% tab
(setq-default indent-tabs-mode nil)



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
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote ghci))
 '(haskell-tags-on-save t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (helm-sage ecb ruby-dev flyspell-correct latex-preview-pane auctex markdown-mode emacsql-mysql jedi 0blayout elpy haskell-emacs company-ghci yasnippet use-package relative-line-numbers org magit linum-relative iedit helm-swoop find-file-in-project evil-escape eldoc-extension company-ghc))))

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
(global-set-key (kbd "s-k")     'kill-buffer)                   ; k -> kill
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


;;;;;;;;;;;;;;;;;

;; Add themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'espresso t)
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

;; Haskell
; * Hasktags: Generates ctags for haskell programs
;   c-] to jump to the definition of a function
;   c-o to jump back
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
    (setenv "path" (concat my-cabal-path path-separator (getenv "path")))
      (add-to-list 'exec-path my-cabal-path))

; * hindent: A Haskell indenter
;   m-q to reformat a block
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

; * Interactive mode
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l")     'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z")     'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c")   'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c")   'haskell-process-cabal)))

; *  It is so important

                        ;; options
                        ;;ghci       [ok]
                        ;;cabal-repl [ok]
                        ;;cabal-dev
                        ;;cabal-ghci
                        ;;stack-ghci

; * Indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


; * Ghci-completion
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)

; * Compile
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))


;; Python
; * pyhton mode
(elpy-enable)
; * remove f@*^! warnings
(setq python-shell-completion-native-enable nil)
(define-key elpy-mode-map (kbd "C-c C-l")   'elpy-shell-send-region-or-buffer)

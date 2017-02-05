;; Removing the tool bar
(tool-bar-mode -1)
;; Removing scroll bar
(scroll-bar-mode -1)


;; Hide startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq package-archive-enable-alist '(("melpa" deft magit)))

;; Size
(set-face-attribute 'default nil :height 160)

; Disable alarms completely
(setq ring-bell-function 'ignore)

; Start Emacs in a fullscreen
(custom-set-variables
   '(initial-frame-alist (quote ((fullscreen . maximized)))))

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
; Mappings
(evil-add-hjkl-bindings occur-mode-map 'emacs
  (kbd "/")       'evil-search-forward
  (kbd "n")       'evil-search-next
  (kbd "N")       'evil-search-previous
  (kbd "C-d")     'evil-scroll-down
  (kbd "C-u")     'evil-scroll-up
  (kbd "C-w C-w") 'other-window)
;(require 'evil)

;; Escape 
(evil-escape-mode)
(setq-default evil-escape-key-sequence "jk" )
(setq-default evil-escape-delay 0.1)

;; making the global emacs more like vim
(global-set-key (kbd "C-d")     'evil-scroll-down)
(global-set-key (kbd "C-u")     'evil-scroll-up) ;; Solve the conflict of emacs' C-u

;; Helm
(add-to-list 'load-path "~/.emacs.d/emacs-async")
(add-to-list 'load-path "~/.emacs.d/helm")
;(require 'helm-config)
(helm-mode t)
(global-set-key (kbd "C-l") #'helm-M-x) ;; helm commands
(global-set-key (kbd "M-f") #'helm-find-files) ;; helm files
(global-set-key (kbd "M-p") #'helm-swoop) ;; helm files


;;;;;;;;;;;;;;;;;

;; Add themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'espresso t)

;; relative numbers && Customization 
(global-relative-line-numbers-mode)
(defun relative-abs-line-numbers-format (offset)
  "The default formatting function.
Return the absolute value of OFFSET, converted to string."
  (if (= 0 offset)
      (number-to-string (line-number-at-pos))
    (number-to-string (abs offset))))
(setq relative-line-numbers-format 'relative-abs-line-numbers-format)

;; find-file-in-project
(global-set-key (kbd "M-i") #'find-file-in-current-directory) ;; helm files

(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
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

;; Haskell
; * hasktags: Generates ctags for haskell programs
;   C-] to jump to the definition of a function 
;   C-o to jump back
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
    (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
      (add-to-list 'exec-path my-cabal-path))
(custom-set-variables '(haskell-tags-on-save t))
; * hindent: A Haskell indenter  
;   M-q to reformat a block
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
; * interactive mode
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))
; * integrated REPL capabilities instead of ghci
(custom-set-variables '(haskell-process-type 'cabal-repl))
; * Stack building tool
(custom-set-variables '(haskell-process-type 'stack-ghci '(haskell-process-type 'chosen-process-type) ))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))


; * Makes emacs recognize the executable files in PATH
;    Prepend .local/bin and .cabal/bin to PATH environment variable 
(setenv "PATH" (concat (getenv "HOME") "/.local/bin:" (getenv "PATH")))
(setenv "PATH" (concat (getenv "HOME") "/.cabal/bin:" (getenv "PATH")))
;    Prepend them to `exec-path'
(setq exec-path
      (reverse
       (append
        (reverse exec-path)
        (list (concat (getenv "HOME") "/.local/bin") (concat (getenv "HOME") "/.cabal/bin")))))


;;(eval-after-load 'haskell-mode
;;          '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))


;; init.el

;; Set up package archives
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Ensure that packages are always installed
(setq use-package-always-ensure t)

;; Setting up the fonts to look cooler
(set-face-attribute 'default nil
		    :family "Aporetic Sans Mono"
		    :height 140)

;; Setting up theme to something nice (In the end nothing is set)
(use-package acme-theme)
(use-package nordic-night-theme)
(use-package modus-themes)

;; Telegram for fun
(use-package telega)

;; (use-package spacious-padding
;;   :config
;;   (setq spacious-padding-subtle-frame-lines
;; 	'(:mode-line-active error))
;;   (setq x-underline-at-descent-line t)

;;   (spacious-padding-mode 1))

(global-unset-key (kbd "C-z"))
;; (use-package evil
;;   :init
;;   (setq evil-undo-system 'undo-fu)
;;   (setq evil-want-integration t) ;; needed by evil-collection
;;   (setq evil-want-keybinding nil)
;;   (setq evil-want-C-u-scroll t) ;; allow C-u to scroll up
;;   :config
;;   (evil-mode 1))

;; (use-package evil-collection
;;   :after evil
;;   :config
;;   (evil-collection-init))

;; (use-package evil-surround
;;   :after evil
;;   :config
;;   (global-evil-surround-mode 1))

;; (use-package evil-commentary
;;   :after evil
;;   :config
;;   (evil-commentary-mode))

;; (use-package evil-nerd-commenter
;;   :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; (use-package evil-leader
;;   :after evil
;;   :config
;;   (global-evil-leader-mode)
;;   (evil-leader/set-leader "<SPC>")
;;   (evil-leader/set-key
;;     "f" 'find-file
;;     "b" 'consult-buffer
;;     "k" 'kill-buffer
;;     "g" 'magit-status
;;     "p" 'project-switch-project))


;; Store Emacs customizations in a separate file so as to not pollute this one
(setq custom-file (expand-file-name "custom-vars.el" user-emacs-directory))

;; Store backups and auto-saves in another place.
(setq backup-directory-alist `(("." . "~/.config/emacs/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.config/emacs/auto-saves/" t)))
(setq auto-save-list-file-prefix "~/.config/emacs/auto-saves/.saves-")

;; Create these directories if they don't exist
(make-directory "~/.config/emacs/backups" t)
(make-directory "~/.config/emacs/auto-saves" t)

;; Load the customizations if the file exists)
(when (file-exists-p custom-file)
  (load custom-file))

;; Better UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(global-display-line-numbers-mode t)

(use-package nyan-mode
  :config
  (setq nyan-animate-nyancat t)
  (nyan-mode))

;; Completion system
(use-package vertico
  :init
  (vertico-mode))

;; Orderless flexible matching
(use-package orderless
  :init
  (setq completion-styles '(orderless)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia (Finally, a margin that is big enough for the proof)
(use-package marginalia
  :init
  (marginalia-mode))

;; Consult for powerful search commands
(use-package consult
  :bind
  (("C-s" . consult-line)
   ("C-x b" . consult-buffer)
   ("M-y" . consult-yank-pop)))

;; Embark: context actions
(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick actions
   ("C-;" . embark-dwim)        ;; smart actions
   ("C-h B" . embark-bindings)) ;; show bindings
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

;; Seamless integration of Embar and Consult
(use-package embark-consult
  :after (embark consult)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package paredit
  :hook
  (emacs-lisp-mode . enable-paredit-mode)
  (lisp-mode . enable-paredit-mode)
  (lisp-interaction-mode . enable-paredit-mode)
  (scheme-mode . enable-paredit-mode))

(use-package expand-region
  :bind (("C-=" . 'er/expand-region)))

;; project management
(use-package project
  :config
  (setq project-switch-commands
        '((project-find-file "Find file")
          (project-find-dir "Find directory")
          (project-find-regexp "Find regexp")
          (project-eshell "Eshell")))
  :bind (("C-c p p" . project-switch-project)
         ("C-c p f" . project-find-file)
         ("C-c p s" . project-find-regexp)))

;; Which-key: display keybindings
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (which-key-add-key-based-replacements
    "C-c p" "Project"))

;;Corfu: popup completion
(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-auto t))

;; Cape: extra completion sources
(use-package cape
  :init
  ;; Add useful default sources
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)               ;; dynamic abbrev (buffer words)
  (add-to-list 'completion-at-point-functions #'cape-keyword)               ;; Emacs keywords
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)           ;; Elisp in org-mode blocks
  (add-to-list 'completion-at-point-functions #'cape-file)                  ;; file paths
  (add-to-list 'completion-at-point-functions #'cape-tex)
  (add-to-list 'completion-at-point-functions #'lsp-completion-at-point))   ;; LaTeX commands

;; Modeline
;; (use-package doom-modeline
;;   :init (doom-modeline-mode 1)
;;   :custom
;;   (doom-modeline-icon t)  ;; needs all-the-icons
;;   (doom-modeline-major-mode-icon t)
;;   (doom-modeline-buffer-encoding nil)) ;; turn off U/UTF-8 thing if you dislike 

;;; Org stuff
;; Org mode for notes
(global-set-key (kbd "C-c a") 'org-agenda)

;; Capture templates
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "Add todo" entry
	 (file+headline "~/org/agenda/inbox.org" "Tasks")
         "* TODO %?\n  %i\n  %a")

	("m" "Add meeting" entry
	 (file+headline "~/org/agenda/inbox.org" "Meetings")
	 "* %? \n<%^{Date} %^t-%^t>\n")))

(use-package org
  :config
  (make-directory "~/org/agenda" t)
  (setq org-agenda-files '("~/org/agenda/"))
  (setq org-default-notes-file "~/org/agenda/inbox.org"))

(setq org-agenda-start-with-log-mode t)
(setq org-agenda-span 'week) ;; show the whole week
(setq org-agenda-start-on-weekday 1) ;; start on Monday
(setq org-agenda-time-grid
      '((daily today require-timed)
        (800 1000 1200 1400 1600 1800 2000)
        "......" "----------------"))

;; Magit for Git integration
(use-package magit
  :bind (("C-x g" . magit-status))) ;; Open Magit status with "C-x g"

;; markdown
(use-package markdown-mode)

;; Eglot (changing to lsp-mode for a more complete lsp experience)
;; (use-package eglot
;;   :after (eglot-java)
;;   :hook ((go-mode . eglot-ensure)
;; 	 (java-mode . eglot-java-mode)
;; 	 (js-mode . eglot-ensure)
;; 	 (typescript-mode . eglot-ensure)
;; 	 (tsx-ts-mode . eglot-ensure)
;; 	 (web-mode . eglot-ensure)
;; 	 (python-mode . eglot-ensure)
;; 	 (haskell-mode . eglot-ensure)
;; 	 (rust-mode . eglot-ensure)
;; 	 (c-mode . eglot-ensure)
;; 	 (c++-mode . eglot-ensure))
;;   ;; tell Eglot not to mess with Corfu
;;   :config
;;   (setq eglot-stay-out-of '(completion)))

;; (use-package eglot-java)

;; Lsp-mode
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :bind (:map lsp-mode-map
	      ("C-c r" . lsp-rename)
	      ("C-c a" . lsp-execute-code-action)
	      ("C-c f" . lsp-format-buffer)
              ("C-c d" . lsp-describe-thing-at-point)
              ("C-c i" . lsp-find-implementation)
              ("C-c t" . lsp-find-type-definition)
              ("C-c h" . lsp-ui-doc-glance))
  :hook ((go-mode . lsp-deferred)
	 (java-mode . lsp-deferred)
	 (js-mode . lsp-deferred)
	 (typescript-ts-mode . lsp-deferred)
	 (tsx-ts-mode . lsp-deferred)
	 (web-mode . lsp-deferred)
	 (python-mode . lsp-deferred)
	 (rust-ts-mode . lsp-deferred)
	 (haskell-mode . lsp-deferred)
	 (haskell-literate-mode . lsp-deferred)
	 (c-mode . lsp-deferred)
	 (c++-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-enable-snippet t
	lsp-completion-provider :none)
  (lsp-enable-which-key-integration) ;; Because I use Corfu
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode)))

(use-package lsp-haskell
  :after lsp-mode
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-position 'bottom
	lsp-ui-doc-show-with-cursor t
	lsp-ui-doc-show-with-mouse t
	lsp-ui-doc-delay 0.2
	lsp-ui-sideline-enable t
	lsp-ui-sideline-show-code-actions t
	lsp-ui-sideline-show-diagnostics t
	lsp-ui-sideline-show-hover nil))

(use-package lsp-java
  :after lsp
  :config (add-hook 'java-mode-hook #'lsp))

;; Formatting
(use-package reformatter)

(reformatter-define prettier-format
  :program "prettier"
  :args `("--stdin-filepath" ,buffer-file-name)
  :group 'prettier)

(use-package auctex)
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))
(setq LaTeX-item-indent 0)

(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . LaTeX-math-mode)
         (LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . TeX-source-correlate-mode))
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-save-query nil
        TeX-PDF-mode t
        TeX-command-default "LatexMk")

  (add-to-list 'TeX-command-list
               '("LatexMk" "latexmk -pdf %s" TeX-run-TeX nil t
                 :help "Run LatexMk"))

  ;; Use Evince for PDF viewing
  (setq TeX-view-program-selection '((output-pdf "Evince")))
  (setq TeX-source-correlate-start-server t))

(defun my/auto-compile-latex ()
  (when (eq major-mode 'LaTeX-mode)
    (TeX-command "LatexMk" 'TeX-master-file -1)))

(add-hook 'after-save-hook #'my/auto-compile-latex)


(use-package dash)
(use-package magit-section)
(use-package lean4-mode
  :commands lean4-mode
  :vc (:url "https://github.com/leanprover-community/lean4-mode.git"
       :rev :last-release
       ;; Or, if you prefer the bleeding edge version of Lean4-Mode:
       ;; :rev :newest
       ))

(defun my/apply-ansi-colors ()
  (ansi-color-apply-on-region (point-min) (point-max)))

(add-hook 'compilation-filter-hook 'my/apply-ansi-colors)


(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

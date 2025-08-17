;; init.el

;; Set up package archives
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
				("gnu" . "https://elpa.gnu.org/packages/")
				("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

;; Set to big number :)
(setq gc-cons-threshold 100000000)

;; Increase the amount of data which emacs reads from the process
(setq read-process-output-max (* 1024 1024))

;; make tabs appear as 2 spaces
(setq-default tab-width 2)
(setq c-basic-offset 2)
(setq c-default-style
			'((java-mode . "linux")))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Ensure that packages are always installed
(setq use-package-always-ensure t)

;; Setting up the fonts to look cooler
;; (set-face-attribute 'default nil
;; 					:family "Aporetic Serif Mono"
;; 					:height 160)

(set-face-attribute 'default nil
										:family "Google Sans Code"
										:height 160)

;; (set-face-attribute 'default nil
;; 					:family "Envy Code R"
;; 					:height 160)

(require 'epa-file)
(setq epg-pinentry-mode 'loopback)
(setq-default plstore-cache-passphrase-for-symmetric-encryption t)


(use-package emacs

  :custom
  (tab-always-indent t)
  (text-mode-ispell-word-completion nil)
  (make-directory "~/.config/emacs/backups" t)
  (make-directory "~/.config/emacs/auto-saves" t)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

;; Setting up theme to something nice
(use-package acme-theme)
(use-package nordic-night-theme)
(use-package modus-themes)
(use-package standard-themes)
(use-package ef-themes
	:config
	(ef-themes-select 'ef-symbiosis))
;; (use-package color-theme-sanityinc-tomorrow
;;   :config
;;   (load-theme 'sanityinc-tomorrow- t))

;; Transparent background
;; (set-frame-parameter nil 'alpha-background 80)
;; (add-to-list 'default-frame-alist '(alpha-background . 80))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;; Telegram for fun
;; (use-package telega)

(use-package spacious-padding
  :config
  (setq spacious-padding-subtle-frame-lines
	'(:mode-line-active error))
  (setq x-underline-at-descent-line t)
	(setq mode-line-right-align-edge 'right-margin)
  (spacious-padding-mode 1))

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


;; (setq visible-bell nil)
;; (setq ring-bell-function 'ignore)
(use-package mode-line-bell
	:config
	(mode-line-bell-mode))

;; No explanation needed
(use-package nyan-mode
  :config
  (setq nyan-animate-nyancat t)
	(setq nyan-wavy-trail t)
  (nyan-mode))

;; Completion system
(use-package vertico
  :init
  (vertico-mode))

(if (eq system-type 'darwin)
		(progn (setq mac-command-modifier 'meta)
					 (setq mac-option-modifier 'super)))


;; Orderless flexible matching
(use-package orderless
  :init
  (setq completion-styles '(orderless)
				completion-category-defaults nil
				completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia
;; -- For having useful information in the mini-buffer
(use-package marginalia
  :init
  (marginalia-mode))

(defun brian/highlight-line ()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil))

(defun brian/kill-line ()
  (interactive)
  (move-beginning-of-line nil)
  (kill-line)
  (kill-line))

(defvar-keymap brians-prefixmap
  :doc "My prefix map."
  "s" #'consult-line
  "C-s" #'consult-line
  "l" #'brian/highlight-line
  "C-l" #'brian/highlight-line
  "k" #'brian/kill-line
  "C-k" #'brian/kill-line)

(keymap-set global-map "C-z" brians-prefixmap)
(keymap-set global-map "M-o" 'other-window)

;; Consult for powerful search commands
(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("C-c s" . consult-grep)
   ("C-c f" . consult-find)
   ("M-y" . consult-yank-pop)))

;; Embark: context actions
(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick actions
   ("C-;" . embark-dwim)        ;; smart actions
   ("C-h B" . embark-bindings)) ;; show bindings
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

;; Seamless integration of Embark and Consult
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
(declare-function cape-tex "cape")
(declare-function cape-keyword "cape")
(use-package cape
  :init
  ;; Add useful default sources
  (add-to-list 'completion-at-point-functions #'cape-dabbrev) ;; dynamic abbrev (buffer words)
  (add-to-list 'completion-at-point-functions #'cape-keyword) ;; Emacs keywords
  (add-to-list 'completion-at-point-functions #'cape-elisp-block) ;; Elisp in org-mode blocks
  (add-to-list 'completion-at-point-functions #'cape-file) ;; file paths
  (add-to-list 'completion-at-point-functions #'cape-tex))   ;; LaTeX commands

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
        (800 1000 1200 1400 1600 1800 2000 2200)
        "......" "----------------"))

(use-package org-gcal
	:init
	(setq org-gcal-client-id "1014346309811-viv3keeo0figiquiepd0pnr1771nge6r.apps.googleusercontent.com"
				org-gcal-client-secret "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"
				org-gcal-fetch-file-alist '(("3a46f53a0303c2a70787c81e7a1d0bdaed5b33867847d9559e11de5d7d0fe9b9@group.calendar.google.com" . "~/org/agenda/appointments.org")
																		("80c53f39ec9db4abfa94b0284b32a2e8ba3fe89ba87543bf5cb335db0f3b97b0@group.calendar.google.com" . "~/org/agenda/breaks.org")
																		("7344aa12c6072ab694a538c5aec4cc2f9f7b835eeadf6e67a4ec366fb1ee7879@group.calendar.google.com" . "~/org/agenda/dailyroutine.org")
																		("e0f4db8fea2c0fd571c4dcc0330247dfc654ffde8ffd24645b3806530dc415d0@group.calendar.google.com" . "~/org/agenda/girlfriend.org")
																		("551613974112816c1243a2a23bc39877b2f8541ad40a32c52e434adb442ef511@group.calendar.google.com" . "~/org/agenda/research.org")
																		("9365c6c83b0ddf9fa549ce142e8f48ce3ce87dc88f2a56b56b97c10cc47e07b1@group.calendar.google.com" . "~/org/agenda/spikehome.org"))
				epg-pinentry-mode 'loopback
				plstore-cache-passphrase-for-symmetric-encryption t)
	:hook
	((org-agenda-mode . (lambda () (org-gcal-sync)))
	 (org-capture-mode . (lambda () (org-gcal-sync)))))

(use-package denote
  :ensure t
  :hook
  (;; If you use Markdown or plain text files, then you want to make
   ;; the Denote links clickable (Org renders links as buttons right
   ;; away)
   (text-mode . denote-fontify-links-mode-maybe)
   ;; Apply colours to Denote names in Dired.  This applies to all
   ;; directories.  Check `denote-dired-directories' for the specific
   ;; directories you may prefer instead.  Then, instead of
   ;; `denote-dired-mode', use `denote-dired-mode-in-directories'.
   (dired-mode . denote-dired-mode))
  :bind
  ;; Denote DOES NOT define any key bindings.  This is for the user to
  ;; decide.  For example:
  ( :map global-map
    ("C-c n n" . denote)
    ("C-c n d" . denote-dired)
    ("C-c n g" . denote-grep)
    ;; If you intend to use Denote with a variety of file types, it is
    ;; easier to bind the link-related commands to the `global-map', as
    ;; shown here.  Otherwise follow the same pattern for `org-mode-map',
    ;; `markdown-mode-map', and/or `text-mode-map'.
    ("C-c n l" . denote-link)
    ("C-c n L" . denote-add-links)
    ("C-c n b" . denote-backlinks)
    ("C-c n q c" . denote-query-contents-link) ; create link that triggers a grep
    ("C-c n q f" . denote-query-filenames-link) ; create link that triggers a dired
    ;; Note that `denote-rename-file' can work from any context, not just
    ;; Dired bufffers.  That is why we bind it here to the `global-map'.
    ("C-c n r" . denote-rename-file)
    ("C-c n R" . denote-rename-file-using-front-matter)

    ;; Key bindings specifically for Dired.
    :map dired-mode-map
    ("C-c C-d C-i" . denote-dired-link-marked-notes)
    ("C-c C-d C-r" . denote-dired-rename-files)
    ("C-c C-d C-k" . denote-dired-rename-marked-files-with-keywords)
    ("C-c C-d C-R" . denote-dired-rename-marked-files-using-front-matter))

  :config
  ;; Remember to check the doc string of each of those variables.
  (setq denote-directory (expand-file-name "~/Documents/notes/"))
	(setq denote-file-type 'text)
  (setq denote-save-buffers nil)
  (setq denote-known-keywords '("emacs" "parsing" "fixpoint" "java" "qe"))
  (setq denote-infer-keywords t)
  (setq denote-sort-keywords t)
  (setq denote-prompts '(title keywords))
  (setq denote-excluded-directories-regexp nil)
  (setq denote-excluded-keywords-regexp nil)
  (setq denote-rename-confirmations '(rewrite-front-matter modify-file-name))

  ;; Pick dates, where relevant, with Org's advanced interface:
  (setq denote-date-prompt-use-org-read-date t)

  ;; Automatically rename Denote buffers using the `denote-rename-buffer-format'.
  (denote-rename-buffer-mode 1))

;; Magit for Git integration
(use-package magit
  :bind (("C-x g" . magit-status))) ;; Open Magit status with "C-x g"

;; markdown
(use-package markdown-mode)

;; Typst
(use-package typst-ts-mode)

;; Eglot (changing to lsp-mode for a more complete lsp experience)
(use-package eglot
  :after (eglot-java)
  :defer t
  :hook ((go-mode . eglot-ensure)
		 (java-mode . eglot-ensure)
		 (js-mode . eglot-ensure)
		 (typescript-mode . eglot-ensure)
		 (elm-mode . eglot-ensure)
		 (tsx-ts-mode . eglot-ensure)
		 (typst-ts-mode . eglot-ensure)
		 (web-mode . eglot-ensure)
		 (python-mode . eglot-ensure)
		 (haskell-mode . eglot-ensure)
		 (rust-mode . eglot-ensure)
		 (c-mode . eglot-ensure)
		 (c++-mode . eglot-ensure))
  :bind
  (("C-c l r" . eglot-rename)
   ("C-c l a" . eglot-code-actions))
  :config
  (setq-default eglot-workspace-configuration
                '((haskell
                   (plugin
                    (stan
                     (globalOn . :json-false))))))  ;; disable stan
  (add-to-list 'eglot-server-programs
			   '(typst-ts-mode . ("tinymist")))
  :custom
  (eglot-autoshutdown t) ;; shutdown language server after closing last file
  (eglot-confirm-server-initiated-edits nil) ;; allow edits without confirmation
  )

(use-package yasnippet
  :ensure t
  :hook (eglot-managed-mode . yas-minor-mode))

(use-package eglot-java)

(use-package haskell-mode)

;; Lsp-mode
;; (use-package lsp-mode
;;   :init
;;   (setq lsp-keymap-prefix "C-c l")
;;   :bind (:map lsp-mode-map
;; 			  ("C-c r" . lsp-rename)
;; 			  ("C-c a" . lsp-execute-code-action)
;; 			  ("C-c f" . lsp-format-buffer)
;;               ("C-c d" . lsp-describe-thing-at-point)
;;               ("C-c i" . lsp-find-implementation)
;;               ("C-c t" . lsp-find-type-definition)
;;               ("C-c h" . lsp-ui-doc-glance))
;;   :hook ((go-mode . lsp-deferred)
;; 		 (java-mode . lsp-deferred)
;; 		 (js-mode . lsp-deferred)
;; 		 (typescript-ts-mode . lsp-deferred)
;; 		 (tsx-ts-mode . lsp-deferred)
;; 		 (web-mode . lsp-deferred)
;; 		 (python-mode . lsp-deferred)
;; 		 (rust-ts-mode . lsp-deferred)
;; 		 (haskell-mode . lsp-deferred)
;; 		 (elm-mode . lsp-deferred)
;; 		 (haskell-literate-mode . lsp-deferred)
;; 		 (c-mode . lsp-deferred)
;; 		 (c++-mode . lsp-deferred))
;;   :commands (lsp lsp-deferred)
;;   :config
;;   (setq lsp-enable-snippet t
;; 		lsp-completion-provider :none)
;;   (lsp-enable-which-key-integration)
;;   (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode)))

;; (use-package lsp-haskell
;;   :after lsp-mode
;;   :config
;;   (setq lsp-haskell-server-path "haskell-language-server-wrapper"))

;; (use-package lsp-ui
;;   :after lsp-mode
;;   :commands lsp-ui-mode
;;   :hook (lsp-mode . lsp-ui-mode)
;;   :config
;;   (setq lsp-ui-doc-position 'bottom
;; 		lsp-ui-doc-show-with-cursor t
;; 		lsp-ui-doc-show-with-mouse t
;; 		lsp-ui-doc-delay 0.2
;; 		lsp-ui-sideline-enable t
;; 		lsp-ui-sideline-show-code-actions nil
;; 		lsp-ui-sideline-show-diagnostics t
;; 		lsp-ui-sideline-show-hover nil))

(use-package elm-mode)

(use-package flycheck)

;; (use-package lsp-java
;;   :after lsp
;;   :config (add-hook 'java-mode-hook #'lsp))

;; Formatting
(use-package reformatter)

(reformatter-define prettier-format
  :program "prettier"
  :args `("--stdin-filepath" ,buffer-file-name)
  :group 'prettier)

(use-package auctex)
(add-to-list 'auto-mode-alist '("\\.tex\\'" . LaTeX-mode))
(setq LaTeX-item-indent 0)
(use-package latex-preview-pane)

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
	(setq TeX-view-program-list
				'(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %q")))
	(setq TeX-view-program-selection '((output-pdf "Skim")))
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
                (shell-command-to-string "agda --emacs-mode locate")))

;; Local Variables:
;; byte-compile-warnings: (not free-vars noruntime)
;; End:

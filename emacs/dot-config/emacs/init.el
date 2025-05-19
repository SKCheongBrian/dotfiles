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

;; Theme
;; TODO!

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

;; Which-key: display keybindings
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))

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
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)     ;; dynamic abbrev (buffer words)
  (add-to-list 'completion-at-point-functions #'cape-keyword)     ;; Emacs keywords
  (add-to-list 'completion-at-point-functions #'cape-symbol)      ;; Lisp symbols
  (add-to-list 'completion-at-point-functions #'cape-elisp-block) ;; Elisp in org-mode blocks
  (add-to-list 'completion-at-point-functions #'cape-file)        ;; file paths
  (add-to-list 'completion-at-point-functions #'cape-tex))        ;; LaTeX commands

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

;; Eglot
(use-package eglot
  :after (eglot-java)
  :hook ((go-mode . eglot-ensure)
	 (java-mode . eglot-java-mode)
	 (python-mode . eglot-ensure)
	 (haskell-mode)
	 (rust-mode . eglot-ensure)
	 (c-mode . eglot-ensure)
	 (c++-mode . eglot-ensure))
  ;; tell Eglot not to mess with Corfu
  :config
  (setq eglot-stay-out-of '(completion)))

(use-package eglot-java)


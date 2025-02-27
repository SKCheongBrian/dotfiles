;;; Customisations
;;  Put customisation settings in another file
;;  so that this init.el is not overly cluttered
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

;;; Package Manager
;;  Load the package manager
;;  Initialise the installed packages
;;  Add the MELPA repository
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;;; Set up use-package
;;  powerful tool for configuring packages in a streamlined way
(when (< emacs-major-version 29)
  (unless (packages-installed-p 'use-package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

;; Configure warnings when installing packages
(add-to-list 'display-buffer-alist
	     '("\\`\\*\\(Warnings\\|Compile-Log\\)\\*\\'"
	       (display-buffer-no-window)
	       (allow-no-window .t )))

(setq make-backup-files nil)
(setq backup-inhibited nil)
(setq create-lockfiles nil)

(mapc
 (lambda (string)
   (add-to-list 'load-path (locate-user-emacs-file string)))
 '("brian-modules"))

(require 'brian-options)
(require 'brian-keyboard-quit-dwim)
(require 'brian-themes-and-icons)
(require 'brian-minibuffer)
(require 'brian-dired)
(require 'brian-whichkey)
(require 'brian-eglot)
(require 'brian-reveal)
(require 'brian-modeline)


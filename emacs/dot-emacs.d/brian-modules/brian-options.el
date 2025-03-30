(setq make-backup-files nil)
(setq backup-inhibited nil)
(setq create-lockfiles nil)
(global-display-line-numbers-mode)

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

(setq visible-bell nil)
(setq ring-bell-function 'flash-mode-line)

(let ((mono-spaced-font "JetBrainsMono Nerd Font")
      (proportionately-spaced-font "Sans"))
  (if (eq system-type 'darwin)
      (progn (set-face-attribute 'default nil :family mono-spaced-font :height 160)
	     (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.2)
	     (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.2)
	     (setq mac-command-modifier 'meta))
    (progn (set-face-attribute 'default nil :family mono-spaced-font :height 120)
	   (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
	   (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))))

(use-package rainbow-mode
  :ensure t
  :hook (emacs-lisp-mode text-mode lisp-mode prog-mode))


(provide 'brian-options)

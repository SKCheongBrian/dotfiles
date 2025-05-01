
(use-package autothemer
  :ensure t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/rose-pine-emacs")
(load-theme 'rose-pine-color t)       ;; main

;;; Use icon fonts in various places
;;  Some stylistic refinement of emacs
(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(provide 'brian-themes-and-icons)

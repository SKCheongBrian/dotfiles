(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialization))

(use-package eglot
  :ensure nil
  :config
  (add-hook 'haskell-mode-hook 'eglot-ensure)
  (setq eglot-sync-connect nil)
  (setq eglot-autoshutdown t))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package haskell-mode
  :ensure t)

(provide 'brian-eglot)

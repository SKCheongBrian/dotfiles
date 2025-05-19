(use-package magit
  :ensure t
  :bind (("C-c g" . magit)))

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'diff-hl-mode))
  

(provide 'brian-git)

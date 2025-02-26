(use-package ox-reveal
  :ensure t
  :config
  (setq org-reveal-root "file:///home/briancheong/slides/reveal.js")
  (setq org-reveal-title-slide nil))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

(provide 'brian-reveal)

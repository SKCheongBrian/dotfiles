(setq make-backup-files nil)
(setq backup-inhibited nil)
(setq create-lockfiles nil)
(setq visible-bell 1)
(global-display-line-numbers-mode)

(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(provide 'brian-options)

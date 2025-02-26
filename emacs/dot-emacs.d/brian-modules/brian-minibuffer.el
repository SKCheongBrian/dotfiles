;;; Configure minibuffer and related

;; Default minibuffer is minimal. Does not help with
;; discoverability. Instead we use the `vertico' package
;; to produce a vertical layout. Making it much easier
;; to see what what the available options are.
(use-package vertico
  :ensure t
  :hook (after-init . vertico-mode))

;; The `marginalia' package is a nice complement to the
;; vertical layout, as it uses the free space to show
;; helpful information about the options shown there.
;; For example, `marginalia' can add a brief description
;; of each command in the `M-x' list of commands.
(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode))

;; The `orderless' package allows us to search things
;; well... not in order as the name suggests.
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic))
  (setq completion-category-defaults nil)
  (setq completion-category-overrides nil))

;; The `savehist' package keeps a record of user inputs
;; and stores them across sessions. Thus the user will
;; always see their latest choices closer to the top
;; (such as with `M-x')
(use-package savehist
  :ensure nil ; it is built in
  :hook (after-init . savehist-mode))

;; The `corfu' package provides a popup interface for
;; in-buffer completion. Conceptually, this is similar
;; to what we do in the minibuffer, though it is meant
;; for text expansion inside of a regular file.
;; Usually good for programming
(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :bind (:map corfu-map ("<tab>" . corfu-complete))
  :config
  (setq tab-always-indent 'complete)
  (setq corfu-preview-current nil)
  (setq corfu-min-width 20)

  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation after `corfu-popupinfo-delay'

  ;; Sort by input history (no need to modify `corfu-sort-function').
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))
  

(provide 'brian-minibuffer)

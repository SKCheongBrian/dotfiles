;;; spike-theme.el --- Nice theme for the goodest boy

(deftheme spike
  "The theme for the good boy.")

(let ((bg "#0f0f0f")
      (fg "#f4decd")
      (black "#0f0f0f")
      (black-b "#6c756f")
      (red "#f16e65")
      (red-b "#f16e65")
      (green "#7ec97e")
      (green-b "#7ec97e")
      (orange "#ef934d")
      (orange-b "#ef934d")
      (blue "#71b4d6")
      (blue-b "#71b4d6")
      (magenta "#e28dc6")
      (magenta-b "#e28dc6")
      (cyan "#7ec9a3")
      (cyan-b "#7ec9a3")
      (white "#d9cdb5")
      (white-b "#f4decd"))
  (custom-theme-set-faces
   'spike

   ;; basic ui
   `(default ((t (:foreground ,fg :background ,bg))))
   `(cursor ((t (:background ,white))))
   `(fringe ((t (:foreground ,black-b :background ,bg))))
   `(region ((t (:foreground ,bg :background ,white))))
   `(hl-line ((t (:background "#1e1f1e"))))

   ;; modeline
      ;; Mode line
   `(mode-line
     ((t (:foreground ,blue
          :background "#272a28"
          :box nil))))

   `(mode-line-inactive
     ((t (:foreground ,black-b
          :background ,bg
          :box nil))))

   `(mode-line-buffer-id
     ((t (:weight bold))))

   ;; Search: current match and other matches
   `(isearch ((t (:foreground ,bg :background ,orange :weight bold))))
   `(lazy-highlight ((t (:foreground ,cyan :background "#272a28"))))
   `(isearch-fail ((t (:foreground ,bg :background ,red))))

   ;; Matching and mismatched parentheses
   `(show-paren-match
     ((t (:foreground ,cyan :background "#272a28" :weight bold))))
   `(show-paren-mismatch
     ((t (:foreground ,bg :background ,red :weight bold))))

   ;; Line numbers
   `(line-number ((t (:foreground ,black-b :background ,bg))))
   `(line-number-current-line
     ((t (:foreground ,orange :background ,bg :weight bold))))

   ;; Prompts, links, and general messages
   `(minibuffer-prompt ((t (:foreground ,blue :weight bold))))
   `(link ((t (:foreground ,cyan :underline t))))
   `(error ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,orange))))
   `(success ((t (:foreground ,green))))

   ;; Dired: directory listings
   `(dired-directory ((t (:foreground ,blue :weight bold))))
   `(dired-symlink ((t (:foreground ,cyan))))
   `(dired-marked ((t (:foreground ,magenta :weight bold))))
   `(dired-flagged ((t (:foreground ,red :weight bold))))

   ;; Diffs: muted backgrounds for added and removed lines
   `(diff-added ((t (:foreground ,green :background "#182518"))))
   `(diff-removed ((t (:foreground ,red :background "#2b1918"))))
   `(diff-changed ((t (:foreground ,orange :background "#2b2218"))))
   `(diff-header ((t (:foreground ,white :background "#272a28"))))
   `(diff-file-header
     ((t (:foreground ,blue :background "#272a28" :weight bold))))

   ;; Completion: emphasize the matching part
   `(completions-common-part ((t (:foreground ,cyan :weight bold))))
   `(completions-first-difference ((t (:foreground ,orange))))

   ;; Headers and hover highlights
   `(header-line
     ((t (:foreground ,white :background "#1e1f1e" :box nil))))
   `(highlight ((t (:background "#272a28"))))

   ;; Secondary selections, e.g. mouse-based selections
   `(secondary-selection
     ((t (:foreground ,fg :background "#3b403c"))))


     ;; Syntax
   `(font-lock-comment-face ((t (:foreground ,black-b))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-constant-face ((t (:foreground ,magenta))))
   `(font-lock-keyword-face ((t (:foreground ,red))))
   `(font-lock-function-name-face ((t (:foreground ,orange))))
   `(font-lock-variable-name-face ((t (:foreground ,blue))))
   `(font-lock-type-face ((t (:foreground ,cyan))))
   `(font-lock-warning-face ((t (:foreground ,red :weight bold))))))

(provide-theme 'spike)

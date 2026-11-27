;;; spike-theme.el --- Nice theme for the goodest boy -*- lexical-binding: t; -*-

;;; Commentary:
;; A theme not inspired by Spike but he is my dog so it's dedicated to him.

;;; Code:
(deftheme spike
  "The theme for the good boy.")

(let* (;; Backgrounds
       (bg        "#1A1A1A")
       (bg-alt    "#242624")
       (bg-hl     "#3A3A3A")
       (bg-select "#4A4A4A")

       ;; Foregrounds
       (fg        "#E6E6C2")
       (fg-muted  "#81968A")

       ;; ANSI-inspired palette
       (black     bg)
       (black-b   fg-muted)

       (red       "#E77B5A")
       (red-b     red)

       (green     "#5AE79F")
       (green-b   green)

       (yellow    "#E2E75A")
       (yellow-b  yellow)

       (orange    "#E7A85A")

       (blue      "#63B7E9")
       (blue-b    blue)

       (magenta   "#CC88E9")
       (magenta-b magenta)

       (cyan      "#00DADA")
       (cyan-b    cyan)

       (white     fg)
       (white-b   fg))

  (custom-theme-set-faces
   'spike

   ;; Basic UI
   `(default ((t (:foreground ,fg :background ,bg))))
   `(cursor ((t (:background ,fg))))
   `(fringe ((t (:foreground ,black-b :background ,bg))))
   `(region ((t (:background ,bg-select :extend t))))
   `(hl-line ((t (:background ,bg-hl :extend t))))

   ;; Mode line
   `(mode-line
     ((t (:foreground ,orange
          :background ,bg-alt
          :box nil))))

   `(mode-line-inactive
     ((t (:foreground ,fg-muted
          :background ,bg
          :box nil))))

   `(mode-line-buffer-id
     ((t (:weight bold))))

   ;; Search
   `(isearch
     ((t (:foreground ,bg :background ,yellow :weight bold))))

   `(lazy-highlight
     ((t (:foreground ,cyan :background ,bg-hl))))

   `(isearch-fail
     ((t (:foreground ,bg :background ,red))))

   ;; Parentheses
   `(show-paren-match
     ((t (:foreground ,cyan :background ,bg-hl :weight bold))))

   `(show-paren-mismatch
     ((t (:foreground ,bg :background ,red :weight bold))))

   ;; Line numbers
   `(line-number
     ((t (:foreground ,fg-muted :background ,bg))))

   `(line-number-current-line
     ((t (:foreground ,orange :background ,bg :weight bold))))

   ;; Prompts, links, messages
   `(minibuffer-prompt
     ((t (:foreground ,blue :weight bold))))

   `(link
     ((t (:foreground ,cyan :underline t))))

   `(error
     ((t (:foreground ,red :weight bold))))

   `(warning
     ((t (:foreground ,orange))))

   `(font-latex-warning-face
     ((t (:foreground ,orange :weight bold))))

   `(success
     ((t (:foreground ,green))))

   ;; Dired
   `(dired-directory
     ((t (:foreground ,blue :weight bold))))

   `(dired-symlink
     ((t (:foreground ,cyan))))

   `(dired-marked
     ((t (:foreground ,magenta :weight bold))))

   `(dired-flagged
     ((t (:foreground ,red :weight bold))))

   ;; Diffs
   `(diff-added
     ((t (:foreground ,green :background "#193428"))))

   `(diff-removed
     ((t (:foreground ,red :background "#36231E"))))

   `(diff-changed
     ((t (:foreground ,orange :background "#352D20"))))

   `(diff-header
     ((t (:foreground ,white :background ,bg-alt))))

   `(diff-file-header
     ((t (:foreground ,blue :background ,bg-alt :weight bold))))

   ;; Completion
   `(completions-common-part
     ((t (:foreground ,cyan :weight bold))))

   `(completions-first-difference
     ((t (:foreground ,orange))))

   ;; Headers and highlights
   `(header-line
     ((t (:foreground ,white :background ,bg-alt :box nil))))

   `(highlight
     ((t (:background ,bg-hl))))

   `(secondary-selection
     ((t (:foreground ,fg :background ,bg-select))))

   ;; Syntax highlighting
   `(font-lock-comment-face
     ((t (:foreground ,fg-muted))))

   `(font-lock-doc-face
     ((t (:foreground ,fg-muted))))

   `(font-lock-string-face
     ((t (:foreground ,green))))

   `(font-lock-constant-face
     ((t (:foreground ,magenta))))

   `(font-lock-keyword-face
     ((t (:foreground ,red))))

   `(font-lock-function-name-face
     ((t (:foreground ,orange))))

   `(font-lock-variable-name-face
     ((t (:foreground ,blue))))

   `(font-lock-type-face
     ((t (:foreground ,cyan))))

   `(font-lock-builtin-face
     ((t (:foreground ,magenta))))

   `(font-lock-preprocessor-face
     ((t (:foreground ,orange))))

   `(font-lock-warning-face
     ((t (:foreground ,red :weight bold))))))

(provide-theme 'spike)

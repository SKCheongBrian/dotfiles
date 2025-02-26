;;; Setting up preferred font
;;  As of now, I will be using the JetBrains Mono Nerd font as my
;;  mono font. Sans for the rest
(let ((mono-spaced-font "JetBrainsMono Nerd Font")
      (proportionately-spaced-font "Sans"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 120)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

(provide 'brian-fonts)

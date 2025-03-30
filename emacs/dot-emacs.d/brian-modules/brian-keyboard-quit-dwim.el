;; make C-g a bit more helpful
(defun brian/keyboard-quit-dwim ()
  "Do-What-I-Mean behaviour for a general `keyboard-quit'.

The generic `keyboard-quit' does not do the expected thing when
the minibuffer is open.  Whereas we want it to close the
minibuffer, even without explicitly focusing it.

The DWIM behaviour of this command is as follows:

- When the region is active, disable it.
- When the minibuffer is open, but not focused, close the minibuffer
- When the Completions buffer is selected, close it.
- In every other case use the regular `keyboard-quit'."
  (interactive)
  (cond
   ((region-active-p)
    (keyboard-quit))
   ((derived-mode-p 'completion-list-mode)
    (delete-completion-window))
   ((> (minibuffer-depth) 0)
    (abort-recursive-edit))
   (t
    (keyboard-quit))))

(defun brian/enter-line-below ()
  "Insert line below and move cursor there no matter where you are on the line."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(defun brian/enter-line-above ()
  "Enter a line above and move cursor there no matter where you are on the line."
  (interactive)
  (move-beginning-of-line 1)
  (newline-and-indent)
  (previous-line))
  

(define-key global-map (kbd "C-g") #'brian/keyboard-quit-dwim)
(define-key global-map (kbd "C-<return>") #'brian/enter-line-below)
(define-key global-map (kbd "M-<return>") #'brian/enter-line-above)

(provide 'brian-keyboard-quit-dwim)

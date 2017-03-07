;; Customizations relating to editing a buffer.

;; Key binding to use "hippie expand" for text autocompletion
;; http://www.emacswiki.org/emacs/HippieExpand
(global-set-key (kbd "M-/") 'hippie-expand)

;; Lisp-friendly hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; Highlights matching parenthesis
(show-paren-mode 1)

;; Highlight current line
(global-hl-line-mode 1)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; When you visit a file, point goes to the last place where it
;; was when you previously visited the same file.
;; http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)
;; keep track of saved places in ~/.emacs.d/places
(setq save-place-file (concat user-emacs-directory "places"))

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)


;; comments
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)

;; yay rainbows!
;; (global-rainbow-delimiters-mode t)

(setq electric-indent-mode nil)

;; prefer C-z for undo
(global-unset-key "\C-z")
(global-set-key "\C-z" 'undo)

;; map a bunch of C-x C-* keys to C-c C-*, for easier dvorak
(global-set-key (kbd "C-c C-s") 'save-buffer)
(global-set-key (kbd "C-c C-e") 'eval-last-sexp)
(global-set-key (kbd "C-c o") 'other-window)
(global-set-key (kbd "C-c 1") 'delete-other-windows)
(global-set-key (kbd "C-c C-b") 'ibuffer)
(global-set-key (kbd "C-c b") 'ido-switch-buffer)
(global-set-key (kbd "C-c k") 'ido-kill-buffer)
(global-set-key (kbd "C-c C-f") 'ido-find-file)
(global-set-key (kbd "C-c C-c C-f") 'find-file)

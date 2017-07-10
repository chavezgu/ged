;;; Complete functionality

;;; Steal this from EOS
(use-package dabbrev
  :init
  (setq dabbrev-case-fold-seach nil))

(use-package hippie-exp
  :init
  ;; force hippie-expand completions to be case-sensitive
  (defadvice hippie-expand (around hippie-expand-case-fold activate)
    "Try to do case-sensitive matching (not effective with all functions)."
    (let ((case-fold-search nil))
      ad-do-it))
  :bind
  (("M-/" . hippie-expand))
  :config
  ;; Steal all this from EOS
  (setq hippie-expand-try-functions-list
        '(;; Try to expand word "dynamically", searching the current buffer.
          try-expand-dabbrev
          ;; Try to expand word "dynamically", searching all other buffers.
          try-expand-dabbrev-all-buffers
          ;; Try to expand word "dynamically", searching the kill ring.
          try-expand-dabbrev-from-kill
          ;; Try to complete text as a file name, as many characters as unique.
          try-complete-file-name-partially
          ;; Try to complete text as a file name.
          try-complete-file-name
          ;; Try to expand word before point according to all abbrev tables.
          try-expand-all-abbrevs
          ;; Try to complete the current line to an entire line in the buffer.
          try-expand-list
          ;; Try to complete the current line to an entire line in the buffer.
          try-expand-line
          ;; Try to complete the current line to an entire line in a different
          ;; buffer.
          try-expand-line-all-buffers
          ;; Try to complete as an Emacs Lisp symbol, as many characters as
          ;; unique.
          try-complete-lisp-symbol-partially
          ;; Try to complete word as an Emacs Lisp symbol.
          try-complete-lisp-symbol)))


;;; STOLEN from EOS
(use-package company
  :ensure t
  :diminish company-mode
  ;; Contrary to EOS, I like this binding
  :bind (("C-." . company-complete))
  :init
  (use-package company-quickhelp
    :ensure t
    :init (add-hook 'company-mode-hook #'company-quickhelp-mode)
    :config (setq company-quickhelp-delay 2))
  :config
  (global-company-mode)
  (add-to-list 'company-backends 'company-gtags)
  (setq company-backends (delete 'company-semantic company-backends))
  (setq company-backends (delete 'company-clang company-backends))
  (setq company-selection-wrap-around t
        ;; do or don't automatically start completion after <idle time>
        company-idle-delay 1.0
        ;; at least 3 letters need to be there though
        company-minimum-prefix-length 3
        ;; show completion numbers for hotkeys
        company-show-numbers t
        ;; align annotations to the right
        company-tooltip-align-annotations t
        company-search-regexp-function #'company-search-flex-regexp)
  (bind-keys :map company-active-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous)
             ("C-d" . company-show-doc-buffer)
             ("C-l" . company-show-location)
             ("<tab>" . company-complete)))

(use-package smart-tab
  :ensure t
  :defer t
  :diminish ""
  :init
  (global-smart-tab-mode 1)
  (setq smart-tab-using-hippie-expand t)
  :config
  (add-to-list 'smart-tab-disabled-major-modes 'shell-mode))

(provide 'ged-completion)

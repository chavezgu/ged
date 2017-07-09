;;; General development

;;; Git configuration
(use-package magit
  :ensure t
  :bind
  (("C-x g" . ged-check-magit)))

;;; Dont' check
(defun ged-check-magit ()
  (interactive)
  (if (not (file-remote-p default-directory))
      (magit-status)
    (message "Don't run magit on remote repos")))

;; Electric pair
(electric-pair-mode 1)

;;; Show matching parenthesis
(show-paren-mode t)

;; Emacs is the best platform for editing elisp, duh, so it goes directly here
(use-package paredit
  :ensure t
  :diminish paredit-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'ielm-mode-hook 'paredit-mode))

;;; Snippets
(use-package yasnippet
  :ensure t
  :bind (("M-=" . yas-insert-snippet))
  :diminish yas-minor-mode
  :init
  (yas-global-mode))

;;; Markdown for the people who don't know org-mode
(use-package markdown-mode
  :ensure t)

;;; Yaml for docker stuff
(use-package yaml-mode
  :ensure t)

(provide 'ged-dev)

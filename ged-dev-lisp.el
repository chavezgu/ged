;;; Configuration for lisps

;;; Emacs Lisp settings
(use-package paredit
  :ensure t
  :diminish paredit-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'ielm-mode-hook 'paredit-mode))


;;; Scheme settings
(setq geiser-active-implementations '(guile))

(use-package geiser
  :ensure t)

;;; Common Lisp development settings
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy slime-company))

(use-package slime
  :ensure t)

(provide 'ged-dev-lisp)
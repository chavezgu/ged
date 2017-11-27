;;; Configuration for lisps

;;; Emacs Lisp settings
(use-package paredit
  :ensure t
  :diminish paredit-mode
  :init
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
  (add-hook 'ielm-mode-hook 'paredit-mode))


;;; Shamelessly copied from
;;;  https://github.com/purcell/elisp-slime-nav/blob/34938422929800839e2f935aca890cd4a229ca99/elisp-slime-nav.el#L119
(defun ged--read-elisp-symbol-at-point ()
  "Return the symbol at point as a string."
  (let* ((sym-at-point (symbol-at-point))
         (at-point (and sym-at-point (symbol-name sym-at-point))))
    at-point))

(defun ged-describe-elisp-at-point (sym-name)
  (interactive (list (ged--read-elisp-symbol-at-point)))
  (let ((symbol (intern sym-name)))
    (if (fboundp symbol)
        (describe-symbol symbol)
      (message "No docs"))))

(use-package xref
  :ensure t
  :config
  (dolist (hook '(emacs-lisp-mode-hook ielm-mod-ehook))
    (add-hook hook (lambda ()
                     (local-set-key (kbd "M-.") 'xref-find-definitions)
                     (local-set-key (kbd "M-,") 'xref-pop-marker-stack)
                     (local-set-key (kbd "C-M-.") 'xref-find-definitions-other-window)
                     (local-set-key (kbd "C-c C-d d") 'ged-describe-elisp-at-point)
                     (local-set-key (kbd "C-c C-d C-d") 'ged-describe-elisp-at-point)))))

(provide 'ged-dev-lisp)

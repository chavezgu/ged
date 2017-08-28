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

;;; Docker is the new hot stuff in town.
(use-package docker
  :init
  (setq docker-containers-show-all nil))

;;; Use flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (progn
    (setq-default flycheck-disabled-checkers
                  '(emacs-lisp-checkdoc json-jsonlint json-python-json))))

;;; Disable M-o under diff
(add-hook 'diff-mode-hook
          #'(lambda ()
              (define-key diff-mode-map "\M-o" nil)))

(provide 'ged-dev)

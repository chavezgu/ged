;;; General development

;;; Git configuration
(use-package magit
  :ensure t
  :bind
  (("C-x g" . ged-check-magit))
  :config
  (setq-default magit-log-section-commit-count 0))

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

(use-package yasnippet-snippets
  :ensure t)

;;; Markdown for the people who don't know org-mode
(use-package markdown-mode
  :ensure t)

;;; Yaml for docker stuff
(use-package yaml-mode
  :ensure t)

;; Docker is the new hot stuff in town.
;; Own fork
(use-package docker
  :load-path "~/projects/docker.el/"
  ;; Since we use our own fork, we have to download the dependencies first.
  :init
  (use-package tablist
    :ensure t)
  (use-package docker-tramp
    :ensure t)
  :config
  (progn
    (require 'docker-containers)
    (setq docker-containers-show-all nil)))

;;; Use flycheck
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init (global-flycheck-mode)
  :config
  (progn
    (setq-default flycheck-disabled-checkers
                  '(emacs-lisp-checkdoc json-jsonlint json-python-json))
    (setq-default flycheck-emacs-lisp-load-path 'inherit)))

(use-package ag
  :ensure t)

;;; Disable M-o under diff
(add-hook 'diff-mode-hook
          #'(lambda ()
              (define-key diff-mode-map "\M-o" nil)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode))

(use-package ggtags
  :ensure t
  :config
  (setq ggtags-enable-navigation-keys nil))

(provide 'ged-dev)
(diminish "autofill-mode")

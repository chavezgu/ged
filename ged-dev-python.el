;;; Python dev settings

;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "~/.virtualenvs")

(use-package virtualenvwrapper
  :ensure t
  :config
  (progn
    (venv-initialize-interactive-shells)
    (setq venv-location (or (getenv "WORKON_HOME")
                            "~/.virtualenvs"))))

(provide 'ged-dev-python)

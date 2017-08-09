;;; Web stuff

;;; Javascript
(setq-default js-indent-level 2)

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config (js2-imenu-extras-setup))

(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

(use-package web-mode
  :ensure t
  :config
  (setq web-mode-code-indent-offset 2))

(provide 'ged-dev-web)

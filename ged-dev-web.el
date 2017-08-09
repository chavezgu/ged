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

(provide 'ged-dev-web)

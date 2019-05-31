;;; Web stuff

;;; Javascript
(setq-default js-indent-level 2)

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :config (js2-imenu-extras-setup))

(use-package js-comint
  :ensure t)

(use-package json-mode
  :ensure t
  :mode "\\.json\\'")

(use-package web-mode
  :ensure t
  :config
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode)))

(provide 'ged-dev-web)

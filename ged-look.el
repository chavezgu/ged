;;; Look and feel and window management

;;; Show the where the columns ends
(use-package fill-column-indicator
  :ensure t
  :init
  (setq fci-rule-column 80)
  (setq fci-rule-width  2)
  (setq fci-rule-color "darkred")
  (add-hook 'after-change-major-mode-hook 'fci-mode))

;;; tango-dark is nice on the eyes
(load-theme 'tango-dark)

;;; No startup screen
(setq-default inhibit-startup-screen t)

;;; No toolbars
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;;; Inconsolata is the best font
(custom-set-faces
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 110 :width normal)))))

;;; Colors in compilation mode!
(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

(provide 'ged-look)

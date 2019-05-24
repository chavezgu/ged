;;; Look and feel and window management

;; ;;; Let's go back to Monokai
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))


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
 '(default ((t (:family "Inconsolata" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))

;;; Colors in compilation mode!
(ignore-errors
  (require 'ansi-color)
  (defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))
  (add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

(provide 'ged-look)

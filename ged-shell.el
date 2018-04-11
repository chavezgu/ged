;;; Shell and executable settings.

;;; Get environment variables
(use-package exec-path-from-shell
  :ensure t
  :defer t
  :init
  (progn
    ;; Don't forget to add the gohome variable later
    (setq exec-path-from-shell-variables '("PATH"))
    (exec-path-from-shell-initialize)))

(use-package with-editor
  :ensure t
  :init
  (progn
    (add-hook 'shell-mode-hook 'with-editor-export-editor)
    (add-hook 'eshell-mode-hook 'with-editor-export-editor)))

;;; We use mainly shell. No reason to learn another shell than bash.
(setq explicit-shell-file-name "/bin/bash")
(setq shell-file-name "/bin/bash")
(setenv "SHELL" shell-file-name)
;;; less does not like Emacs so we don't like less
(setenv "PAGER" "cat")

(use-package shell-pop
  :ensure t
  :init
  (setq shell-pop-universal-key "M-`")
  (setq shell-pop-windown-position "bottom"))

;; Always start a shell when we fire up emacs.
(progn
  (split-window-right)
  (other-window 1)
  (shell "std"))

(defun gcg-switch-to-shell ()
  (interactive)
  (switch-to-buffer (get-buffer "std")))

(global-set-key (kbd "C-M-`") 'gcg-switch-to-shell)

;;; Try to use eshell
(require 'em-tramp)

;;; Change the sudo
(setq eshell-prefer-lisp-functions t)
(setq eshell-prefer-lisp-variables t)

(setq password-cache t)
;;; Remember for 15 minutes.
(setq password-cache-expiry 900)

(provide 'ged-shell)

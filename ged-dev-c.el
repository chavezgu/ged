;;; For C and C++ lanagues

(defun ged-c-mode-hook ()
  (setq c-indentation-style "linux"
        c-basic-offset 8
        tab-with 8
        indent-tabs-mode t))
(add-hook 'c-mode-hook 'ged-c-mode-hook)

(defun ged-c++-mode-hook ()
  (setq c-indentation-style "stroustrup"
        c-basic-offset 4
        indent-tabs-mode nil))
(add-hook 'c++-mode-hook 'ged-c++-mode-hook)

;; use gdb-many-windows by default
(setq gdb-many-windows t
      ;; Non-nil means display source file containing the main routine at startup
      gdb-show-main t)

(provide 'ged-dev-c)

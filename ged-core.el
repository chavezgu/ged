;;; Core functions
;;; whoami
(setq user-full-name "Gabriel Chavez"
      user-mail-address "gabriel@chavezgu.com")

;;; Set everything to UTF8
(set-charset-priority 'unicode)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; Better defaults
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      visible-bell nil
      apropos-do-all t
      mouse-yank-at-point t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places")
      backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

;; Enable zap-up-to-char
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(when (fboundp 'winner-mode)
  (winner-mode 1))

;; I copied this from the better defaults
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;;; Save the place
(use-package saveplace
  :ensure t
  :init
  (setq-default save-place t))

;;; Line modes
(line-number-mode 1)
(column-number-mode 1)

;;; Raise maximum messages
(setq message-log-max 16384)
(setq-default indicate-empty-lines nil)
(setq-default indicate-buffer-boundaries nil)

;;; I learned to use a computer using windows.
(setq read-file-name-completion-ignore-case t)

;;; One letter please
(defalias 'yes-or-no-p 'y-or-n-p)

;;; Move visually
(setq line-move-visual t)

;;; Column to 80, no tabs, 4 spaces
(setq-default fill-column 80)
(setq-default default-tab-width 2)
(setq-default indent-tabs-mode nil)

;;; Trust the EOS expert on this
;; (setq system-uses-terminfo nil)

;;; Trust symlinks
(setq-default find-file-visit-truename t)

;;; Uniquify
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

;; We follow Steve Yegge advice
(global-set-key "\C-x\C-m" 'helm-M-x)
(global-set-key "\C-c\C-m" 'helm-M-x)

;; No more backspace
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Same as C-x 1
(global-set-key (kbd "C-x 9") 'delete-other-windows)
(global-set-key (kbd "C-x |") 'split-window-right)
(global-set-key (kbd "C-x -") 'split-window-below)

;; GRB: use C-o and M-o to switch windows
(global-set-key (kbd "M-o") 'other-window)
(defun prev-window ()
  (interactive)
  (other-window -1))
(global-set-key (kbd "M-O") 'prev-window)

(defun ged-display-in-selected-window (buffer window &optional alist)
  (with-selected-window window
    (switch-to-buffer buffer)
    window))

(defun ged-switch-windows ()
  (interactive)
  (let* ((other-window (nth 1 (window-list)))
         (other-buffer (window-buffer other-window))
         (current-buffer (current-buffer)))
    (switch-to-buffer other-buffer)
    (ged-display-in-selected-window current-buffer other-window)
    (select-window other-window)))

(global-set-key (kbd "M-\'") 'ged-switch-windows)

;; Horrible code, but I'm just learning elisp.
(defun ged-switch-to-shell ()
  (interactive)
  (switch-to-buffer (get-buffer "std")))

;; Hooks for info mode
(add-hook 'Info-mode-hook
          (lambda ()
            (local-set-key (kbd "DEL") 'scroll-down-line)
            (local-set-key (kbd "RET") 'scroll-up-line)
            (local-set-key (kbd "o") 'Info-follow-nearest-node)))

;; Get to know the major mode name from a buffer
(defun buffer-mode (buffer-or-string)   ;
  "Returns the major mode associated with a buffer."
  (with-current-buffer buffer-or-string
    major-mode))

;; Sudo in TRAMP
(defun sudo-this ()
  "Use TRAMP to `sudo' the current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
             buffer-file-name))))

;; We don't need to send email if we are not inside gnus.
(global-set-key (kbd "C-x m") nil)

;; (global-set-key (kbd "C-c C-f") 'jump-char-forward)

;; Because I'm old, I need to highlight the line where my cursor is.
(global-hl-line-mode 1)

;;; Use password manager
(use-package pass
  :ensure t)

(provide 'ged-core)

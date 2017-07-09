;;; Helm, as usual, deserves it's own page

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-unset-key (kbd "C-x c"))

(use-package helm-config
  :ensure helm
  :demand t
  :bind
  (("C-c h" . helm-command-prefix)
   ("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   ("C-x b" . helm-mini)
   ("C-c h o" . helm-occur)
   ("C-h a" . helm-apropos)
   ("M-i" . helm-semantic-or-imenu))
  :init
  (setq helm-buffers-fuzzy-matching t
        helm-M-x-fuzzy-match        t
        helm-recentf-fuzzy-match    t
        helm-apropos-fuzzy-match    t
        helm-split-window-in-side-p     t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-scroll-amount                    8
        helm-ff-file-name-history-use-recentf t)
  :config
  (use-package helm-mode
    :diminish helm-mode
    :config
    (helm-mode 1))
  ;; TODO: Move this to a :bind
  ;; rebind tab to run persistent action
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) 
  ;; Make tab work in the terminal
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) 
  (define-key helm-map (kbd "C-z")  'helm-select-action)
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
  (use-package helm-projectile
    :ensure t
    :demand t
    :init
    (helm-projectile-on)))

(use-package helm-gtags
  :diminish helm-gtags-mode
  :ensure t
  :bind
  (("M-." . helm-gtags-dwim)
   ("C-M-." . helm-gtags-find-tag-other-window)
   ("M-," . helm-gtags-pop-stack)
   ("C-c <" . helm-gtags-previous-history)
   ("C-c >" . helm-gtags-next-history)
   ("M-]" . helm-gtags-find-rtag)
   ("C-c g a" . helm-gtags-tags-in-this-function)
   ("C-M-i" . helm-gtags-select))
  :init
  (setq helm-gtags-ignore-case t
        helm-gtags-auto-update t
        helm-gtags-use-input-at-cursor t
        helm-gtags-pulse-at-cursor t
        helm-gtags-prefix-key "\C-cg"
        helm-gtags-suggested-key-mapping t)
  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode))

(use-package projectile
  :ensure t
  :defer 5
  :diminish projectile-mode
  :config
  ;; global ignores
  (projectile-global-mode)
  (add-to-list 'projectile-globally-ignored-files "GTAGS")
  (add-to-list 'projectile-globally-ignored-files "GPATH")
  (add-to-list 'projectile-globally-ignored-files "GRTAGS")
  (add-to-list 'projectile-globally-ignored-files "GSYMS")
  (use-package helm-projectile
    :ensure t
    :init
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)))


(provide 'ged-helm)


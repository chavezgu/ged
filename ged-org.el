;;; Org mode stuff

(defun my-org-mode-hook()
  (progn
    (turn-on-flyspell)
    (auto-fill-mode 1)))
(add-hook 'org-mode-hook 'my-org-mode-hook)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-agenda-files (list "~/org/todos/inbox.org"
                             "~/org/todos/lifestyle.org"
                             "~/org/todos/economics.org"
                             "~/org/todos/tech.org"))

(setq org-log-done t)
(setq org-directory "~/org/todos")
(setq org-default-notes-file "~/org/todos/inbox.org")
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-window-setup 'current-window)
(setq org-src-fontify-natively t)

;;  Function for archiving done tasks.
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'tree))


;;; Babel languages
(setq org-babel-load-languages '((emacs-lisp t) (js . t) (python . t)))

;;; Blog feeds
(setq org-feed-alist
          '(("Irreal"
              "http://irreal.org/blog/?feed=rss2"
              "~/org/links/feeds.org" "Irreal")
            ("Armed and Dangerous"
             "http://esr.ibiblio.org/?feed=rss2"
             "~/org/links/feeds.org" "Armed and Dangerous")
            ("Coding Horror"
             "https://feeds.feedburner.com/codinghorror"
             "~/org/links/feeds.org" "Coding Horror")))

(provide 'ged-org)

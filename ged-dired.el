;;; Dired functions

(require 'dired-x)
(setq dired-listing-switches "-alh")

;; Set the wanted files.
(add-to-list 'dired-guess-shell-alist-user '("\\.pdf\\'" "mupdf"))
(add-to-list 'dired-guess-shell-alist-user '("\\.azw3\\'" "ebook-viewer"))
(add-to-list 'dired-guess-shell-alist-user '("\\.mobi\\'" "ebook-viewer"))
(add-to-list 'dired-guess-shell-alist-user '("\\.epub\\'" "ebook-viewer"))
(add-to-list 'dired-guess-shell-alist-user '("\\.mp4\\'" "totem"))
(add-to-list 'dired-guess-shell-alist-user '("\\.mkv\\'" "totem"))
(add-to-list 'dired-guess-shell-alist-user '("\\.png\\'" "eog"))
(add-to-list 'dired-guess-shell-alist-user '("\\.gif\\'" "eog"))
(add-to-list 'dired-guess-shell-alist-user '("\\.jpg\\'" "eog"))


(provide 'ged-dired)

;;; Dired functions

(require 'dired-x)
(setq dired-listing-switches "-alh")

;;; Use midnight commander-like abilities to copy from one dired buffer to the
;;; next
(setq-default dired-dwim-target t)

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
(add-to-list 'dired-guess-shell-alist-user '("\\.html\\'" "google-chrome"))

;; Work apps
(add-to-list 'dired-guess-shell-alist-user '("\\.xlsx\\'" "oocalc"))
(add-to-list 'dired-guess-shell-alist-user '("\\.xls\\'" "oocalc"))
(add-to-list 'dired-guess-shell-alist-user '("\\.ppt\\'" "ooimpress"))
(add-to-list 'dired-guess-shell-alist-user '("\\.pptx\\'" "ooimpress"))
(add-to-list 'dired-guess-shell-alist-user '("\\.docx\\'" "oowriter"))
(add-to-list 'dired-guess-shell-alist-user '("\\.doc\\'" "oowriter"))

(provide 'ged-dired)

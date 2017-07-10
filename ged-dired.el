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

;; Work apps
(add-to-list 'dired-guess-shell-alist-user '("\\.xlsx\\'" "localc"))
(add-to-list 'dired-guess-shell-alist-user '("\\.xls\\'" "localc"))
(add-to-list 'dired-guess-shell-alist-user '("\\.ppt\\'" "loimpress"))
(add-to-list 'dired-guess-shell-alist-user '("\\.pptx\\'" "loimpress"))
(add-to-list 'dired-guess-shell-alist-user '("\\.docx\\'" "lowriter"))
(add-to-list 'dired-guess-shell-alist-user '("\\.doc\\'" "lowriter"))

(provide 'ged-dired)

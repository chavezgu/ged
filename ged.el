;;; This is the origin of the file for my Emacs configuration named GED as
;;; Gabriel' Emacs Distribution. It's very difficult to make Linux to feel truly
;;; yours, but an Emacs configuration does.

;;; Inspiration and some of the original code at:
;;; https://writequit.org/eos/eos.html

;;; Show any errors at startup
(setq debug-on-error t)
(setq debug-on-quit t)

(require 'cl)
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/ged/")

;;; Stolen from EOS
(defvar ged-did-refresh-packages nil
  "Flag for whether packages have been refreshed yet")

;;; Steal this macro from EOS
(defmacro try-load (module)
  "Try to load the given module, logging an error if unable to load"
  `(condition-case ex
       (require ,module)
     ('error
      (message "EOS: Unable to load [%s] module: %s" ,module ex))))

;;; Stolen from EOS
(defun install-pkgs (list)
  (dolist (pkg list)
    (progn
      (if (not (package-installed-p pkg))
          (progn
            (if (not ged-did-refresh-packages)
                (progn (package-refresh-contents)
                       (setq ged-did-refresh-packages t)))
            (package-install pkg))))))

(install-pkgs '(use-package diminish))

(require 'use-package nil t)
(setq use-package-verbose nil)

;;; Loading modules
(try-load 'ged-core)
(try-load 'ged-look)
(try-load 'ged-dired)
(try-load 'ged-helm)
(try-load 'ged-completion)
(try-load 'ged-org)
(try-load 'ged-shell)
(try-load 'ged-dev)
(try-load 'ged-dev-c)
(try-load 'ged-dev-python)
(try-load 'ged-dev-lisp)
(try-load 'ged-dev-web)


;;; No errors so reset these variables
(setq debug-on-error nil)
(setq debug-on-quit nil)

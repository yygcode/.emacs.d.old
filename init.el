;;; init.el --- emacs config entry

;; Copyright (C) 2017 yanyg<yygcode@gmail.com>

;; Author: yanyg<yygcode@gmail.com>
;; Homepage: http://ycode.org

;;; Commentary:

;;; Code:

;; If you want to use the latest, config org as belows:
;; 1. Download latest package or clone repo.
;;    URL: http://orgmode.org/
;;    REPO:
;;      ~$ git clone git://orgmode.org/org-mode.git
;;      ~$ make autoloads
;; 2. add load-path
;;    (add-to-list 'load-path "~/path/to/orgdir/lisp")
;; 3. If you wantt contributed libraries
;;    (add-to-list 'load-path "~/path/to/orgdir/contrib/lisp" t)
;; See homepage http://orgmode.org/ for more details.

(org-babel-load-file "~/.emacs.d/config.org")

;; use china mirror for GFW

;; ;; store custom variables separately
;; (setq custom-file "~/.emacs.d/custom.el")
;; (when (file-exists-p custom-file) (load custom-file))

;; ;;(setq inhibit-splash-screen t)

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; ;;(shell-command-to-string "fortune")

;; (require 'init-packages)
;; (require 'init-basic)
;; (require 'init-linum)
;; (require 'init-org)
;; (require 'init-chinese-pyim)
;; ;;(setq frame-resize-pixelwise 1)
;; ;;(toggle-frame-fullscreen)
;; ;;(toggle-frame-fullscreen)

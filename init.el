;;; init.el --- emacs config entry
;;
;; Copyright (C) 2017 yanyg<yygcode@gmail.com>
;;
;; Author: yanyg<yygcode@gmail.com>
;; Homepage: http://ycode.org

;;; Commentary:

;;; Code:

(require 'package)

;; emacs-china crashed or stopped ?
;;(setq package-archives
;;      '(("gnu" . "http://elpa.emacs-china.org/gnu/")
;;        ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(setq package-archives
      '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	("org"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
        ("melpa-stable" .
	           "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; load with noerror
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)



(unless (package-installed-p 'use-package)
  (progn
    (message "Install use-package")
    (package-install 'use-package)))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
(setq use-package-always-pin "melpa-stable")
(setq use-package-always-defer t)

(global-set-key (kbd "C-c C-f") 'find-function)

;; FIXME: temporary use to reload init file
;;        reload init is different with restart,
;;        so you still need to restart for some situation
;;        e.g.: remove a key binding.
(global-set-key (kbd "C-c r")
                (lambda()(interactive)
                  (load-file (expand-file-name "init.el" user-emacs-directory))))

;; If you want to use the latest org, use the follows config:
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

;; FIXME: use-package can provide a keyword to force install built-in package?
;;
;; use-package use 'package-installed-p' to check package installed or not
;; and org is a built-in package, so use-package would ignore org package
;; but org-plus-contrib is not installed default, so I think I can force install
;; org by routine package-install but failed.
;;
;; Test Code:
;; (unless (package-installed-p 'org-plus-contrib)
;;   (progn
;;     (message "Install org to replace built-in")
;;     (package-install 'org)))
(use-package org
  :pin org
  :ensure org-plus-contrib)
(org-babel-load-file "~/.emacs.d/config.org")

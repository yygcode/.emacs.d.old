;; -*- coding: utf-8 -*-
;;
;; Copyright (C) yanyg<yygcode@gmail.com>
;;

;; use china mirror for GFW
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
;;(setq package-archives
;;      '(("gnu" . "file:///home/yanyg/mnt/home/emacs-local/elpa/gnu")
;;	("melpa" . "http:///home/yanyg/mnt/home/emacs-local/elpa/melpa")))
(package-initialize)

;; store custom variables separately
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file) (load custom-file))

;;(setq inhibit-splash-screen t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;(shell-command-to-string "fortune")

(require 'init-packages)
(require 'init-basic)
(require 'init-linum)
(require 'init-org)
(require 'init-chinese-pyim)
;;(setq frame-resize-pixelwise 1)
;;(toggle-frame-fullscreen)
;;(toggle-frame-fullscreen)

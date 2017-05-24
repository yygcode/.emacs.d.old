;; -*- coding: utf-8 -*-
;;
;; Copyright (C) yanyg<yygcode@gmail.com>
;;

;; use china mirror for GFW
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu")
			 ("melpa" . "http://elpa.emacs-china.org/melpa")))
(package-initialize)

;;(setq inhibit-splash-screen t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;;(shell-command-to-string "fortune")

(require 'init-packages)
(require 'init-basic)
(require 'init-linum)
(require 'init-org)

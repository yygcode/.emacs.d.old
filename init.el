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


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(setq-default initial-scratch-message
	      (concat ";; Happy hacking "
		      (or user-login-name "")
		      " - Emacs loves you!\n\n"))

(smartparens-global-mode t)
(show-paren-mode t)

  (setq ;; foreground and background
        monokai-foreground     "#ABB2BF"
        monokai-background     "#282C34"
        ;; highlights and comments
        monokai-comments       "#F8F8F0"
        monokai-emphasis       "#282C34"
        monokai-highlight      "#FFB269"
        monokai-highlight-alt  "#66D9EF"
        monokai-highlight-line "#1B1D1E"
        monokai-line-number    "#F8F8F0"
        ;; colours
        monokai-blue           "#61AFEF"
        monokai-cyan           "#56B6C2"
        monokai-green          "#98C379"
        monokai-gray           "#3E4451"
        monokai-violet         "#C678DD"
        monokai-red            "#E06C75"
        monokai-orange         "#D19A66"
        monokai-yellow         "#E5C07B")

(set-face-bold-p 'bold nil)

(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
;;(helm-projectile-on)
(setq projectile-switch-project-action 'helm-projectile-find-file)
(setq projectile-switch-project-action 'helm-projectile)

;;(require 'evil)
;;(evil-mode 1)
;;(define-key evil-normal-state-map "." 'helm-gtags-dwim)
;;(define-key evil-normal-state-map "," 'helm-gtags-pop-stack)


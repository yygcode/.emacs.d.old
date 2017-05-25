;; package management
;;
;; Copyright (C) 2015 yanyg<yygcode@gmail.com>
;;
;; Reference material
;;  https://emacs-china.github.io/
;;  http://elpa.emacs-china.org/
;;  https://learnxinyminutes.com/docs/elisp/

(require 'package)

;; Use mirror archives for speed and gfw
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

(defvar my/packages-list
  '(chinese-fonts-setup    ;; font config
    chinese-pyim           ;; input method
    chinese-pyim-greatdict ;; dictionary for chinese-pyim
    company          ;; auto complete
    counsel          ;;
    disable-mouse    ;; I hate mouse disturb
    hungry-delete    ;; delete all trailing spaces
    monokai-theme    ;; common theme
    smartparens      ;; dealing parenthesis pairs
    ;; smex             ;; M-x helper
    swiper           ;; flexible, simple tools for minibuffer completion
    ycmd
    fill-column-indicator ;; column ruler
    pdf-tools
    )
  "auto installed packages")
;; support auto remove
(setq package-selected-packages my/packages-list)

;; auto install routine
((lambda(pkg-list)
  (let (pkgs)
    (dolist (pkg pkg-list pkgs)
      (unless (package-installed-p pkg)
	(setq pkgs (cons pkg pkgs))))
    (setq pkgs (nreverse pkgs))
    (message "uninstalled packages: %s" pkgs)

    (when (> (length pkgs) 0)
      (message "Follow packages will be installed: %s" pkgs)
      (package-refresh-contents)
      (dolist (pkg pkgs) (package-install pkg)))
    ))
 my/packages-list)

(provide 'init-packages)

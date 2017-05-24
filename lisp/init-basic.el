;; customize emacs ui
;;
;; Copyright (C) 2017 yanyg<yygcode@gmail.com>
;;

;; Part 1: UI
;; inhibits the startup screen
;; Call C-h / to see the manual when you need
(setq-default inhibit-splash-screen t)
(global-set-key (kbd "C-h /") (lambda() (interactive) (display-splash-screen)))

;; hide menu-bar and tool-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1)
  ;; full screen for X
  (setq initial-frame-alist (quote ((fullscreen . maximized))))
  (load-theme 'monokai t))

;; Part 2: Backup
(setq-default make-backup-files nil)
(setq-default cursor-type 'bar)

;; Part 3: Default behavior like as other editors
(delete-selection-mode t)

;; Part 4: recentf mode
(require 'recentf)
(recentf-mode)

;; Part 5: company and parenthesis
;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 2)
(setq company-idle-delay 0.4)
;; config smartparens
;; https://github.com/Fuco1/smartparens
(require 'smartparens-config)
;;(smartparens-mode t)
(smartparens-global-mode t)
(show-paren-mode t)

;; Part 6: 80 col Ruler
(require 'fill-column-indicator)
(setq fci-rule-column 81)
(setq fci-rule-color "cyan")
;;(setq fci-rule-character-color "red")
(setq fci-rule-character-color "cyan")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)

(provide 'init-basic)

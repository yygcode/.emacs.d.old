;;; customize --- Emacs ui
;;
;;; Commentary:
;; Copyright (C) 2017 yanyg<yygcode@gmail.com>
;;

;;; Code:
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
  (setq initial-frame-alist (quote ((fullscreen . maximized)))))

(if (display-graphic-p)
  (load-theme 'monokai t)
  (load-theme 'monokai t))

;;(require 'color-theme-solarized)
;;(color-theme-solarized)

;;(add-hook 'after-startup-hook 'toggle-frame-fullscreen)
;;(w32-send-sys-command ?\u00f030)

;; Part 2: Backup
(setq-default make-backup-files nil)
(setq-default cursor-type 'bar)

;; Part 3: Default behavior like as other editors
(delete-selection-mode t)

;; Part 4: recentf mode
(require 'recentf)
(recentf-mode 1)

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
;;(require 'fill-column-indicator)
;;(setq fci-rule-column 81)
;;(setq fci-rule-color "cyan")
;;(setq fci-rule-character-color "red")
;;(setq fci-rule-character-color "cyan")
;;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;(global-fci-mode 1)

;; Part 7: Fonts
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Part 8: use counsel to open file and describe
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;(counsel-company)
;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; Part 9: font config
;;(set-frame-font "Courier New-18" t t)
(set-frame-font "DejaVuSansMono-16" t t)

(setq default-directory "~/")

;; input
;;(setq pyim-page-length 5)
;;(setq pyim-page-tooltip 'pos-tip)
;;(setq pyim-page-style 'one-line)

(global-set-key [C-1] '(delete-other-windows))
(global-set-key (kbd "M-=") 'er/expand-region)

;;(org-bullets-mode t)
;;(setq org-hide-leading-stars t)

(global-flycheck-mode t)

(require 'ggtags)

(ggtags-mode 1)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(require 'helm)

(setq helm-gtags-prefix-key "\C-cg")

(use-package helm-gtags
  :init
  (progn
    (setq helm-gtags-ignore-case t
          helm-gtags-auto-update t
          helm-gtags-use-input-at-cursor t
          helm-gtags-pulse-at-cursor t
          helm-gtags-prefix-key "\C-cg"
          helm-gtags-suggested-key-mapping t)

    ;; Enable helm-gtags-mode in Dired so you can jump to any tag
    ;; when navigate project tree with Dired
    (add-hook 'dired-mode-hook 'helm-gtags-mode)

    ;; Enable helm-gtags-mode in Eshell for the same reason as above
    (add-hook 'eshell-mode-hook 'helm-gtags-mode)

    ;; Enable helm-gtags-mode in languages that GNU Global supports
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'java-mode-hook 'helm-gtags-mode)
    (add-hook 'asm-mode-hook 'helm-gtags-mode)

    ;; key bindings
    (with-eval-after-load 'helm-gtags
      (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
      (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
      (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
      (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))))

(add-to-list 'load-path "~/.emacs.d/elpa/org-page-20170530.1956")
(require 'org-page)
(setq op/repository-directory "~/org-pub")
(setq op/site-domain "file:///home/yanyg/org-pub-server")
;;; for commenting, you can choose either disqus, duoshuo or hashover
(setq op/personal-disqus-shortname "yanyg")
(setq op/personal-duoshuo-shortname "yanyg")
(setq op/hashover-comments t)
;;; the configuration below are optional
(setq op/personal-google-analytics-id "your_google_analytics_id")
;;(op/do-publication nil "HEAD^1" "~/org-pub/" nil)

(require 'ox-publish)
(org-publish-project "site")

;; http://orgmode.org/manual/Publishing-options.html
(setq org-export-with-sub-superscripts nil)
(setq org-export-with-timestamps nil)
(setq org-export-author nil)
(setq org-export-with-creator nil)
(setq org-export-with-date nil)
(setq org-export-with-email nil)
(setq org-export-with-toc 't)
(setq org-export-with-section-numbers 't)
(setq org-html-preamble nil)
(setq org-html-postamble nil)

;; see org-html-style-default
(setq org-html-head-include-default-style nil)

;; see org-html-scripts
(setq org-html-head-include-scripts nil)
(setq org-html-htmlize-output-type 'css)

;; http://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html
(setq org-publish-project-alist
      '(("pages"
         :base-directory "~/repo/ycode.org/src/"
         :publishing-directory "~/repo/ycode.org/"
         :recursive nil
         :html-head-include-default-style nil
         :html-head "<link rel=\"shortcut icon\" href=\"http://dirtysalt.info/css/favicon.ico\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"./css/site.css\" />"
         :publishing-function org-html-publish-to-html
         ;; :auto-sitemap 't
         ;; :sitemap-filename "sitemap.org"
         ;; :sitemap-title "Sitemap"
         :with-toc 't)
        ("blog"
         :base-directory "~/repo/ycode.org/src/blogs/"
         :publishing-directory "~/repo/ycode.org/blogs/"
         :recursive nil
         :html-head-include-default-style nil
         :html-head "<link rel=\"shortcut icon\" href=\"http://yygcode.info/css/favicon.ico\" />
<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/site.css\" />"
         :publishing-function org-html-publish-to-html
         :section-numbers 't
         :with-toc 't)
        ("site" :components ("pages" "blog"))))

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(set-face-attribute 'region nil :background "#ae81ff")

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
(modify-syntax-entry ?_ "w")
(add-hook 'c-mode-common-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "e" 'find-file)
(evil-leader/set-key "fr" 'counsel-recentf)
(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(require 'powerline)
(powerline-default-theme)

(require 'disable-mouse)
(global-disable-mouse-mode)

(setq initial-scratch-message "Love #(whoami).")

(provide 'init-basic)
;;; init-basic.el ends here

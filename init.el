;; yanyg<yygcode@gmail.com>
;;
;; Reference material
;;  https://emacs-china.github.io/
;;  http://elpa.emacs-china.org/
;;  https://learnxinyminutes.com/docs/elisp/

;; configure package sources,
;; we uUse elpa china mirror for GFW. Thanks 
(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

;; auto install packages
(require 'cl)
(defvar my/packages-list '(
			   chinese-fonts-setup    ;; font config
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
			   )
  "auto installed packages list")
;; support auto remove
(setq package-selected-packages my/packages-list)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages-list
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "Refreshing package database ...")
  (package-refresh-contents)
  (dolist (pkg my/packages-list)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;; finish auto install packages

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cfs--current-profile "profile1" t)
 '(cfs--profiles-steps (quote (("profile1" . 5))) t)
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(load-theme 'monokai t)
(setq-default inhibit-splash-screen 1)
(setq-default cursor-type 'bar)
(setq-default make-backup-files nil)
(setq-default auto-save-mode -1)

;; line number, hide menu,scroll,tool
(delete-selection-mode t)
(global-linum-mode 1)
(when(display-graphic-p)
  (scroll-bar-mode -1))
(menu-bar-mode -1)
;;(scroll-bar-mode -1)
(tool-bar-mode -1)

;; show parenthesis
(show-paren-mode)

(require 'recentf)
(recentf-mode)

;; disable backup file

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; try variable access
(defun open-test-file1()
  (interactive)
  (let ((org-dir "e:/git/work/org/test.org"))
  (find-file org-dir))
  )
(global-set-key (kbd "<f5>") 'open-test-file1)

(defun open-test-file()
  (interactive)
  (let ((org-dir "e:/git/work/org/test.org"))
  (find-file org-dir))
  )
(global-set-key (kbd "<f4>") 'open-test-file)

(defun open-work-org()
  (interactive)
  (let org-dir ((if (string-equal system-type "windows-nt")
      (let ((org-dir "e:/git/work/org/work-list.org")) org-dir)
    (let ((org-dir "~/work/inspur/work-list.org"))) org-dir))
  (message "change org directory to %s" org-dir)
  (find-file org-dir)))
(global-set-key (kbd "<f3>") 'open-work-org)

(defun smart-open-line-above()
  "Insert an empty line above the current line"
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key [(control c) I] 'smart-open-init-above)

(defun quick-cut-line ()
  "Cut the whole line that point is on.  Consecutive calls to this command append each line to the kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
	(end (line-beginning-position 2)))
    (if (eq last-command 'quick-cut-line)
	(kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end)))
    (delete-region beg end))
  (beginning-of-line 1)
  (setq this-command 'quick-cut-line))

;; chinese input method
(require 'chinese-pyim)
(require 'chinese-pyim-greatdict)
(chinese-pyim-greatdict-enable)
;;(require 'chinese-pyim-basedict)
;;(chinese-pyim-basedict-enable)

;; org-mode
(require 'org)
(setq-default org-src-fontify-natively t)

(global-company-mode)
(global-font-lock-mode)
(global-hl-line-mode)


;; config swiper
;; https://github.com/abo-abo/swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; config smartparens
;; https://github.com/Fuco1/smartparens
(require 'smartparens-config)
;;(smartparens-mode t)
(smartparens-global-mode t)

;; I hate mouse corrupt cursor position
(disable-mouse-mode)

;; config ycmd
(require 'ycmd)
(add-hook 'after-init-hook #'global-ycmd-mode)

;;(set-default-font "Mono-20")
;;(add-to-list 'default-frame-alist '(font . "Mono-20" ))
;;(set-face-attribute 'default t :font "Mono-20" )
;;

(when (string-equal system-type "windows-nt")
  (message "configure fonts for windows")
  (require 'chinese-fonts-setup)
  (chinese-fonts-setup-enable))

;;(require 'company)
;;(load "~/.emacs.d/emacscompanywords/company-words")
;;(load "~/.emacs.d/emacscompanywords/company-words-discn.el")
;;(add-to-list 'company-backends 'company-en-words)
;;(company-en-words-enable)
;;(global-set-key (kbd "C-\\") (set-input-method "chinese-pyim"))
;;(set-input-method "chinese-pyim")

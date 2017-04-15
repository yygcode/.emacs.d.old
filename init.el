(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 )

(setq-default inhibit-splash-screen 1)
(global-linum-mode 1)
			 ))
(package-initialize)

(load-theme 'monokai 1)
(setq-default cursor-type 'bar)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

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

(defun open-work-org()
  (interactive)
  (find-file "~/work/inspur/work-list.org"))
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

(require 'chinese-pyim)
(require 'chinese-pyim-greatdict)
(chinese-pyim-greatdict-enable)
;;(require 'chinese-pyim-basedict)
;;(chinese-pyim-basedict-enable)

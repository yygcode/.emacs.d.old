(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)

(setq org-directory "~/org")
;;(setq org-agenda-files (concat org-directory "/"))
(setq org-agenda-files '("~/org"))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq-default TeX-engine 'xetex)

(provide 'init-org)

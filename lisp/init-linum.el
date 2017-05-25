;; line number config
(global-linum-mode t)

;; linum for terminal
;;(unless (display-graphic-p)
  (add-hook 'linum-before-numbering-hook
	    (lambda ()
	      (setq-local linum-format-fmt
			  (let ((w (length
				    (number-to-string
				     (count-lines (point-min) (point-max))))))
			    (concat "%" (number-to-string w) "d")))))
 
  (setq linum-format
	(lambda(line) (concat
		       (propertize (format linum-format-fmt line) 'face 'linum)
		       (propertize "|" 'face 'homoglyph);;'font-lock-keyword-face)
				    )));;)

  (setq linum-format
	(lambda(line) (concat
		       (propertize (format linum-format-fmt line) 'face 'linum)
		       (propertize "|" 'font-lock-faces '(:foreground "cyan"));;'font-lock-keyword-face)
				    )));;)

(setq linum-mode-inhibit-modes-list
      '(eshell-mode
	shell-mode
	profiler-report-mode
	ffip-diff-mode
	dictionary-mode
	erc-mode
	browse-kill-ring-mode
	etags-select-mode
	dired-mode
	help-mode
	text-mode
	fundamental-mode
	jabber-roster-mode
	jabber-chat-mode
	inferior-js-mode
	inferior-python-mode
	inferior-scheme-mode
	twittering-mode
	compilation-mode
	weibo-timeline-mode
	woman-mode
	Info-mode
	calc-mode
	calc-trail-mode
	comint-mode
	gnus-group-mode
	inf-ruby-mode
	gud-mode
	org-mode
	vc-git-log-edit-mode
	log-edit-mode
	term-mode
	w3m-mode
	speedbar-mode
	gnus-summary-mode
	gnus-article-mode
	calendar-mode))

(defun linum-on-around(orig-func &rest args)
  "Stop linum-mode for linum-inhibit modes"
  (unless (member major-mode linum-mode-inhibit-modes-list)
    (apply orig-func args)
    )
  )
(advice-add 'linum-on :around #'linum-on-around)

(provide 'init-linum)

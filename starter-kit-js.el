;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

(autoload 'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(add-hook 'espresso-mode-hook 'esk-paredit-nonlisp)
(add-hook 'espresso-mode-hook 'run-coding-hook)

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here

;;; starter-kit-js.el --- Some helpful Javascript helpers
;;
;; Part of the Emacs Starter Kit

(autoload 'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
(add-hook 'espresso-mode-hook 'esk-paredit-nonlisp)
(add-hook 'espresso-mode-hook 'run-coding-hook)

(eval-after-load "flymake"
  '(defun flymake-display-err-menu-for-current-line ()
    "Display a message with errors/warnings for current line if it
has errors and/or warnings."
    (interactive)
    (let* ((line-no             (flymake-current-line-no))
           (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
           (menu-data           (flymake-make-err-menu-data line-no line-err-info-list)))
      (if menu-data
          (let ((messages))
            (push (concat (car menu-data) ":") messages)
            (dolist (error-or-warning (cadr menu-data))
              (push (car error-or-warning) messages))
            (message "%s" (mapconcat #'identity (reverse messages) "\n")))))))


(require 'closure-lint-mode)

(provide 'starter-kit-js)
;;; starter-kit-js.el ends here

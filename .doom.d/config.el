;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

(global-set-key (kbd "C-a") 'treemacs)

(global-set-key (kbd "M-n") 'projectile-toggle-between-implementation-and-test)

(global-set-key (kbd "C-q") 'quote-word-at-point)

(global-set-key (kbd "C-c C-n") 'org-insert-item)

(global-set-key (kbd "C-c C-o") 'org-insert-subheading)

(global-set-key (kbd "C-,") 'projectile-find-implementation-or-test-other-window)

(global-set-key (kbd "C-i") 'imenu)
(setq doom-font (font-spec :family "Hack" :size 18))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'evil-normal-state-entry-hook 'save-buffer)
;;(add-hook 'go-mode-hook 'projectile-find-implementation-or-test-other-window)

(add-to-list 'company-backends #'company-tabnine)
;; Tabnine stuff
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)


(defun quote-word-at-point ()
  (interactive)
  (cl-destructuring-bind (beg . end)
      (bounds-of-thing-at-point 'word)
    (evil-surround-region beg end nil ?\")))

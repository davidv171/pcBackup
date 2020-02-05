;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "David Vuckovic"
      user-mail-address "david.vuckovic7@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font (font-spec :family "hack" :size 14) doom-variable-pitch-font (font-spec :family "sans"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


(setq centaur-tabs-set-icons t)

(map! :nv "H" #'centaur-tabs-backward-tab)

(map! :nv "L" #'centaur-tabs-forward-tab)


(map! :nv "C-," #'projectile-find-implementation-or-test-other-window)
(map! :i "C-q" #'quote-word-at-point)
(map! :nvi "C-b" #'bookmark-set)


(map! :nvi "C-f" #'counsel-fzf)
(map! :nvi "C-c n" #'projectile-find-file-dwim-other-window)
(map! :nvi "C-c t" #'projectile-toggle-between-implementation-and-test)


(map! :nvi "<C-m>" #'counsel-mark-ring)

(map! :nvi "C-i" #'imenu)

(setq doom-font (font-spec :family "Hack" :size 18))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'evil-normal-state-entry-hook 'save-buffer)

(require 'company-tabnine)
;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)


(defun quote-word-at-point ()
  (interactive)
  (cl-destructuring-bind (beg . end)
      (bounds-of-thing-at-point 'word)
    (evil-surround-region beg end nil ?\")))

;; Save evil markers
(after! savehist
  (add-to-list 'savehist-additional-variables 'evil-markers-alist))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;; .doom.d/config.el -- lexical-binding: t; --

;; Place your private configuration here


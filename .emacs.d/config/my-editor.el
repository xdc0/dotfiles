;; Global configurations of the text editor

;; Icons
(use-package all-the-icons
  :ensure t)

;; Theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(use-package doom-themes
  :ensure t
  :after (all-the-icons)
  :config
  (setq doom-themes-enable-bolt t
	doom-themes-enable-italic t
	doom-themes-treemacs-theme "doom-colors")
  (load-theme 'doom-material-dark t)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; Font
(set-frame-font "JetBrains Mono 13" nil t)

;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

;; Line numbers for buffers containing code
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; prevent minibuffer from expanding too much
(setq max-mini-window-height 3)

(provide 'my-editor)

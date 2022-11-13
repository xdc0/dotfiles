;; Global configurations of the text editor

;; Icons
(use-package all-the-icons)

(use-package doom-themes
  :after (all-the-icons)
  :custom
  (doom-themes-enable-bolt t)
  (doom-themes-enable-italic t)
  (doom-themes-treemacs-theme "doom-colors")
  :init
  (load-theme 'doom-gruvbox-light t)
  (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :custom
  ((doom-modeline-height 15))
  :init
  (doom-modeline-mode 1))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

;; Font
(set-frame-font "IBM Plex Mono 13" nil t)

;; Powerline
(use-package powerline
  :ensure t
  :config
  (powerline-center-evil-theme))

;; Spell cheking stuff
(setq-default ispell-program-name "aspell")


;; Line numbers for buffers containing code
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; prevent minibuffer from expanding too much
(setq max-mini-window-height 3)

(provide 'my-editor)

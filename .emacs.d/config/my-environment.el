;; Essential packages used to setup my work environment
;; Note: If some of these blocks become too unwieldly, they can be separated to their own files

;; Evil mode
;; VI emulation package
(use-package evil
  :ensure t
  :custom
  (evil-want-keybinding nil)
  (evil-undo-system 'undo-redo)
  :config
  (define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
  (evil-mode 1))

;; Collection of plugins built around evil
(use-package evil-collection
  :ensure t
  :after (evil)
  :custom
  (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

;; Helm
;; Multipurpose framework for various packages
(use-package helm
  :ensure t
  :custom
  (helm-completion-style 'helm-fuzzy)
  :init
  (define-key evil-normal-state-map (kbd "C-d") 'helm-buffers-list))

;; plugins for helm
;; helm-rg - ripgrep integration
(use-package helm-rg
  :ensure t
  :after helm
  :custom
  (helm-rg-thing-at-point nil))

;; Projectile
;; Project management package
(use-package projectile
  :ensure t
  :after (evil helm)
  :init
  (setq projectile-completion-system 'helm)
  :config
  (projectile-mode)
  (define-key evil-normal-state-map (kbd "C-c p") 'helm-projectile-switch-project))

;; plugins for projectile
(use-package helm-projectile
  :ensure t
  :after (evil helm-rg projectile)
  :config
  (helm-projectile-on)
  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)
  (define-key evil-normal-state-map (kbd "C-f") 'helm-projectile-rg))

;; Treemacs a file explorer for projects
(use-package treemacs
  :ensure t
  :config)

(use-package treemacs-evil
  :ensure t
  :after (treemacs evil))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))



(provide 'my-environment)

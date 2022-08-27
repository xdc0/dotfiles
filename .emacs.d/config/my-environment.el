;; Essential packages used to setup my work environment
;; Note: If some of these blocks become too unwieldly, they can be separated to their own files

;; Evil mode
;; VI emulation package
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1))

;; Collection of plugins built around evil
(use-package evil-collection
  :ensure t
  :after (evil)
  :config
  (evil-collection-init))

;; Helm
;; Multipurpose framework for various packages
(use-package helm
  :ensure t
  :init
  (setq helm-ff-auto-update-initial-value t)
  (define-key evil-normal-state-map (kbd "C-d") 'helm-buffers-list)
  (setq completion-styles '(flex)))

;; plugins for helm
;; helm-rg - ripgrep integration
(use-package helm-rg
  :after helm
  :ensure t)

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


(provide 'my-environment)

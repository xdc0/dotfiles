;; Essential packages used to setup my work environment
;; Note: If some of these blocks become too unwieldly, they can be separated to their own files

;; Automatically upgrade packages
(use-package auto-package-update

  :ensure t
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

(use-package diminish)

(use-package no-littering
  :config
  (setq auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

;; Evil mode
;; VI emulation package
(use-package evil
  :custom
  (evil-want-keybinding nil)
  (evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; Collection of plugins built around evil
(use-package evil-collection
  :after (evil)
  :custom
  (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

(use-package ivy
  :diminish
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :diminish
  :init
  (define-key evil-normal-state-map (kbd "C-d") 'counsel-switch-buffer)
  (define-key evil-normal-state-map (kbd "C-f") 'counsel-rg)
  (counsel-mode 1))

;; Projectile
;; Project management package
(use-package projectile
  :after (evil ivy)
  :diminish projectile-mode
  :custom
  (projectile-completion-system 'ivy)
  (projectile-project-search-path '("~/projects"))
  :config
  (projectile-mode)
  (define-key evil-normal-state-map (kbd "C-c p") 'projectile-switch-project))

(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode)
  (define-key evil-normal-state-map (kbd "C-p") 'counsel-projectile-find-file))

;; Treemacs a file explorer for projects
(use-package treemacs
  :config)

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile))

(provide 'my-environment)

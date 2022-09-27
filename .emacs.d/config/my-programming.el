;; Company
;; General purpose framework for autocompletion for programming languages

(use-package company
  :ensure t
  :config
  (global-company-mode))

;; Magit
;; Tremendously good git client for emacs
(use-package magit
  :after (evil)
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "<f5>") 'magit-status))

(use-package treemacs-magit
  :ensure t
  :after (magit treemacs))

;; Tree Sitter
;; New generation of programming language syntax highlight features
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :after (tree-sitter)
  :ensure t
  :init
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Snippet goodies
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :after (yasnippet))

;; Choose which LSP profile to use, right now I'm using eglot because LSP is terribly slow
(require 'my-eglot)

;; Programming languages modules
(require 'my-javascript)

;; TERRAFORM
(use-package terraform-mode
  :ensure t)

;; yml files
(use-package yaml-mode
  :ensure t)

;; graphql
(use-package graphql-mode
  :ensure t)

;; Enable electric pair mode for all prog modes
(add-hook 'prog-mode-hook #'electric-pair-mode)

(provide 'my-programming)

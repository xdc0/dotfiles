;; Company
;; General purpose framework for autocompletion for programming languages
(use-package company
  :ensure t
  :config
  (global-company-mode))

;; Flycheck
;; Better than flymake, supposedly
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

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

;; lsp-mode
;; Language Server Protocol mode implementation for emacs
(use-package lsp-mode
  :after (company)
  :ensure t
  :hook ((typescript-mode js-mode) . lsp)
  :custom
  (lsp-eldoc-enable-hover nil))

(use-package lsp-ui
  :ensure t
  :after (evil lsp-mode)
  :custom
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  (evil-local-set-key 'normal (kbd "M-.") 'lsp-ui-peek-find-definitions))

(use-package dap-mode
  :after (lsp)
  :ensure t)

(use-package helm-lsp
  :ensure t
  :after (lsp-mode evil)
  :config
  (evil-define-key 'normal 'lsp-mode (kbd "M-s") 'helm-lsp-global-workspace-symbol)
  (evil-define-key 'normal 'lsp-mode (kbd "s-<return>") 'helm-lsp-code-actions)
  (evil-define-key 'normal 'lsp-mode (kbd "M-<f4>") 'helm-lsp-diagnostics))

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

;; Programming languages modules
(require 'my-javascript)

(provide 'my-programming)

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

;; eglot
;; Minimal LSP client
(use-package eglot
  :after (company)
  :ensure t
  :hook ((typescript-mode js-mode) . eglot-ensure)
  :init
  (setq eglot-confirm-server-initiated-edits nil)
  :config
  (define-key evil-normal-state-map (kbd "M-.") 'xref-find-definitions)
  (define-key evil-normal-state-map (kbd "s-<return>") 'eglot-code-actions))

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

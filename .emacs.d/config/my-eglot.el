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

(provide 'my-eglot)

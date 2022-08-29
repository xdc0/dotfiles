;; Plain javascript
(use-package js2-mode
  :ensure t
  :hook (js . 'js2-minor-mode)
  :init
  (setq js-indent-level 2))

;; Typescript configuration
(use-package typescript-mode
  :ensure t
  :after (lsp-mode)
  :mode "\\.tsx?\\'"
  :init
  (setq typescript-indent-level 2)
  :config
  (setq lsp-clients-typescript-server-args '("--stdio" "--tsserver-log-file" "/tmp/tsserver")))

;; Helpers to run code quality tools, e.g. prettier
(use-package apheleia
  :after (evil)
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "M-E") 'apheleia-format-buffer))

;; Debugger
;; Note -- Debugger currently uses a deprectated server.
(use-package dap-node
  :after (dap-mode)
  :defer t
  :config
  (dap-node-setup))

;; jest-test-mode
;; allow to easily run focused tests
(use-package jest-test-mode
  :ensure t
  :commands jest-test-mode
  :hook (typescript-mode))

(provide 'my-javascript)

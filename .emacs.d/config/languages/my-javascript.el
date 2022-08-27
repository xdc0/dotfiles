;; Plain javascript
(use-package js2-mode
  :ensure t
  :hook (js . 'js2-minor-mode)
  :init
  (setq js-indent-level 2))

;; Typescript configuration
(use-package typescript-mode
  :mode "\\.tsx?\\'"
  :init
  (setq typescript-indent-level 2)
  :ensure t)

;; Helpers to run code quality tools, e.g. prettier
(use-package apheleia
  :after (evil)
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "M-E") 'apheleia-format-buffer))

(provide 'my-javascript)

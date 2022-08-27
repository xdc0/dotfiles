;; Global configurations of the text editor

;; Theme
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-night t))

;; Font
(set-frame-font "JetBrains Mono 13" nil t)

;; Line numbers for buffers containing code
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(provide 'my-editor)

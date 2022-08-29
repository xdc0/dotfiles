(add-to-list 'load-path "~/.emacs.d/config/")
(let ((default-directory  "~/.emacs.d/config/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq custom-file (concat user-emacs-directory "custom.el"))

(require 'my-setup)
(require 'my-environment)
(require 'my-editor)
(require 'my-org)
(require 'my-programming)


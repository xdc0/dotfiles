;; General environment configurations and preferences

;; Emacs window settings
(setq inhibit-startup-message t)
(blink-cursor-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; Backup and auto save files management
(defvar my-save-files-directory
  (concat user-emacs-directory ".save-files/"))
(make-directory my-save-files-directory t)

(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,my-save-files-directory)
	(,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix (concat my-save-files-directory ".auto-save-"))
(setq auto-save-file-name-transforms `((".*" ,my-save-files-directory t)))

(setq
 kept-new-versions 10
 kept-old-versions 10
 create-lockfiles nil
 delete-old-versions t
 version-control t)

;; macOS meta and super keybindings
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(setq mac-function-modifier 'hyper)

;; Start emacs window maximized
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; lower logging for native compilation
(setq warning-minimum-level :error)

;; Package repository setup
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(provide 'my-setup)


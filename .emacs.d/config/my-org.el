;;; my-org.el -- settings for org-mode
;;; Commentary:
;;; Code:
(require 'org)

;; keybindings
(global-set-key (kbd "C-c a") 'org-agenda)

;; directories setup
(defconst my-org-directory (concat (getenv "HOME") "/org"))
(defconst my-tasks-org-file (concat org-directory "/tasks-log.org"))
(defconst my-journal-org-file (concat org-directory "/tasks-log.org"))

(setq org-agenda-files (list my-tasks-org-file))

;; capture templates
(setq org-capture-templates
      '(("t" "TODO" entry (file+datetree my-tasks-org-file "Tasks")
	"* TODO %?\nSCHEDULED: %t\n %i\n %a")
	("j" "Journal" entry (file+datetree my-journal-org-file "Journal")
	 "* %?\n %i\n %a")))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("INPROGRESS" . "yellow")
        ("PR" . "yellow") ("STAGING" . "orange") ("DONE" . org-done)
        ("DROPPED" . "blue")))

(setq org-todo-keywords
      '((sequence "TODO(t)" "INPROGRESS(i)" "PR(p)" "STAGING(s)" "|" "DONE(d)" "DROPPED(u)")))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (concat my-org-directory "/roam"))
  (org-roam-complete-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))


(provide 'my-org)

;;; my-org.el ends here

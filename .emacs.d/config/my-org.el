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

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory my-org-directory)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))))


(provide 'my-org)

;;; my-org.el ends here

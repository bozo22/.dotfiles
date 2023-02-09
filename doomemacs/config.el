;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; font
(setq doom-font (font-spec :family "SF Mono" :size 14 :weight 'regular))

;; theme
(setq doom-theme 'doom-tomorrow-day)

;; line numbers
(setq display-line-numbers-type 'relative)

;; org
(setq org-directory "~/org/")
(after! org
  (setq org-image-actual-width 170)
  (setq org-attach-auto-tag nil)
  (setq org-agenda-span 'week)
  (setq org-startup-with-inline-images nil)
)

;; org journal
(after! org-journal
  (setq org-journal-dir "~/journal/entries/")
  (setq org-journal-time-format "%H:%M")
  ;; (setq org-journal-time-prefix "")
  (setq org-journal-file-header "#+STARTUP: showeverything")
  (setq org-journal-date-format "%Y. %m. %d. %A\n:PROPERTIES:\n:DIR: ~/journal/entries/%Y/%m/%d/img/\n:END:")
  (setq org-journal-file-format "%Y/%m/%d/%Y-%m-%d")
  (setq org-extend-today-until 8)
)

;; keybinds
(general-auto-unbind-keys t)

(map! :leader
      "j j" #'org-journal-new-entry
      "j o" #'org-journal-open-current-journal-file
      "j d" #'org-journal-new-date-entry
      "j s" #'org-journal-search-forever
      "SPC" #'org-agenda-list)

(map! :leader
      :map org-agenda-mode-map
      "w" #'org-agenda-week-view
      "d" #'org-agenda-day-view)

(defun export-journal ()
  (interactive)
  (shell-command "python3 /home/bozo/journal/export/export.py"))
(map! :leader
      "j e" #'export-journal)


;; disable exit confirmation
(setq confirm-kill-emacs nil)

;; set path correctly
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; agda-mode
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))


(defun my/org-latex-format-headline-function
    (todo _todo-type priority text tags _info)
  "Modified format function for a headline: enclose tags in boxes.
See `org-latex-format-headline-function' for details."
  (concat
   (and todo (format "{\\bfseries\\sffamily %s} " todo))
   (and priority (format "\\framebox{\\#%c} " priority))
   text
   (and tags
    (format "\\hfill{}\\textsc{%s}"
        (mapconcat (lambda (x) (format "\\framebox{\\tiny %s}" (org-latex--protect-text x))) tags ":")))))

(setq org-latex-format-headline-function #'my/org-latex-format-headline-function)

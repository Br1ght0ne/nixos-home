;;; private/default/autoload.el -*- lexical-binding: t; -*-

;; TODO: such docs, much needed

;;;###autoload
(defun +private/insert-filename (filename)
  (interactive "fFilename: ")
  (insert (expand-file-name filename)))

;;;+++autoload
(defun +private/pdf-counterpart-for-file (file)
  (s-prepend (file-name-sans-extension file) ".pdf"))

;;;###autoload
(defun +private/transfer-file (file)
  (interactive "fFile: ")
  (let ((basename (file-name-nondirectory file)))
    (request
     (format "https://transfer.sh/%s" basename)
     :type "PUT"
     :files '((basename . file))
     :parser (lambda () (buffer-string))
     :success (cl-function
               (lambda (&key link &allow-other-keys)
                 (message "%s" link))))))

;;;###autoload
(defun +private/transfer-this-file ()
  (interactive)
  (+private/transfer-file buffer-file-name))

;;;###autoload
(defun +private/start-inferior-process-shell-command (command)
  (let ((name (format "*nohup: %s*" command)))
    (start-process-shell-command name nil (format "nohup %s" command))))

;;;###autoload
(defun +private/start-inferior-process (name buffer program &rest program-args)
  (let ((nohup-name (lambda (text)
                      (if (not (null text))
                          (format "*nohup: %s*" text)
                        nil))))
    (apply 'start-process (append `(,(funcall nohup-name name) ,(funcall nohup-name buffer) "nohup" ,program) program-args))))

;;;###autoload
(defun +private/find-config-file ()
  (interactive)
  (doom-project-find-file "~/.config"))

;;;###autoload
(defun +private/elfeed-play-with-mpv ()
  (interactive)
  (let ((entry (if (eq major-mode 'elfeed-show-mode) elfeed-show-entry (elfeed-search-selected :single))))
    ;; (shell-command (concat "mpv \"" (elfeed-entry-link entry)"\""))
    (start-process-shell-command "elfeed-mpv" nil (format "%s \"%s\"" "mpv" (elfeed-entry-link entry)))))

;;;###autoload
(defun +private/open-link-with (link &optional program)
  ""
  (interactive "sLink: ")
  (require 'anaphora)
  (let ((program (or program (completing-read "Action: "
                                              +private/open-link-with-commands
                                              nil nil nil nil "url-handler"))))
    (cond ((string= program "copy")
           (kill-new link)
           (message "Copied: %s" link))
          ((string= program "eww")
           (message "Opening in %s: %s" program link)
           (eww link))
          (t (let ((args
                    (cond ((string= program "mpv") "--ytdl")
                          ;; (let ((q (completing-read
                          ;;            "Quality: "
                          ;;            +private/open-link-with-qualities
                          ;;            nil nil nil nil "1080")))
                          ;;   (format "--ytdl-format=\"best[height<=%s]\"" q)))
                          (t ""))))
               (+private/start-inferior-process-shell-command (format "%s %s '%s'" program args link))
               (message "Running: %s %s '%s'" program args link))))))

;;;###autoload
(defun +private/org-extract-link-no-kill ()
  (interactive)
  (when (org-in-regexp org-bracket-link-regexp 1)
    (->
     1
     match-string-no-properties
     org-link-unescape)))

;;;###autoload
(defun +private/org-extract-link ()
  (interactive)
  (require 'anaphora)
  (awhen (+private/org-extract-link-no-kill)
    (+private/open-link-with it)))

;;;###autoload
(defun +private/treemacs-back-and-forth ()
  (interactive)
  (if (treemacs-is-treemacs-window-selected?)
      (aw-flip-window)
    (treemacs-select-window)))

;;;###autoload
(defun +private/yank-project-file-name ()
  "Yank filename of the current file relative to the project root."
  (interactive)
  (if-let* ((filename (or buffer-file-name (bound-and-true-p list-buffers-directory))))
      (message (kill-new (s-chop-prefix (projectile-project-root) (buffer-file-name))))
    (error "Couldn't find filename in current buffer")))

;;;###autoload
(defun +private-try-executable-find (&rest executables)
  (--find (executable-find it) executables))

;;;###autoload
(defun +private/distro-name ()
  "Get the name of the distribution."
  (when (executable-find "lsb_release")
    (-> "lsb_release -si"
        (shell-command-to-string)
        (s-chomp)
        (string-trim "\"" "\""))))

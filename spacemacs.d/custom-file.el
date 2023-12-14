;; Emacs custom settings.
;; This is an auto-generated function, do not modify its content directly, use
;; Emacs customize menu instead.
;; This function is called at the very end of Spacemacs initialization.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-skip-visited t)
 '(confirm-kill-emacs 'yes-or-no-p)
 '(custom-safe-themes
   '("da3cdfc2251906a1887c758048eccf5590d8cfbccf013ea836a2d6003c52782b" "5ac8f397c73065285ad65590aa12a75f34bd704cac31cf204a26e1e1688a4ce2" default))
 '(dired-listing-switches "-ahBl --group-directories-first")
 '(display-time-mode t)
 '(docker-run-as-root t)
 '(dockerfile-use-sudo t)
 '(ein:use-auto-complete t)
 '(ein:use-auto-complete-superpack t)
 '(electric-indent-mode nil)
 '(eshell-scroll-show-maximum-output nil)
 '(evil-move-cursor-back nil)
 '(evil-want-Y-yank-to-eol t)
 '(flycheck-disabled-checkers '(python-flake8))
 '(flycheck-pylint-use-symbolic-id nil)
 '(font-lock-maximum-decoration '((c++-mode . 2) (t . t)))
 '(global-hl-line-mode nil)
 '(global-origami-mode t)
 '(global-whitespace-mode nil)
 '(helm-boring-file-regexp-list
   '("\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.elc$" "\\.pyc$" "\\.#"))
 '(helm-buffer-max-length nil)
 '(helm-ff-skip-boring-files t)
 '(helm-ff-tramp-not-fancy nil)
 '(helm-google-suggest-default-browser-function 'browse-url-chromium)
 '(helm-substitute-in-filename-stay-on-remote t)
 '(helm-swoop-split-direction 'split-window-horizontally t)
 '(helm-swoop-split-with-multiple-windows nil t)
 '(magit-branch-prefer-remote-upstream '("master"))
 '(magit-diff-use-overlays nil)
 '(magit-log-arguments '("--graph" "--decorate" "--stat" "-n256"))
 '(markdown-command
   "pandoc -r markdown_github+fenced_code_blocks+fenced_code_attributes -w html -s --highlight-style=zenburn")
 '(markdown-content-type "\12")
 '(markdown-live-preview-window-function 'markdown-live-preview-window-eww)
 '(next-error-recenter '(4))
 '(org-agenda-files
   '("~/spacemacs/org/work.org" "~/spacemacs/org/meetings.org" "~/spacemacs/org/notes.org" "~/spacemacs/org/personal_org/FirstAid_course.org" "~/spacemacs/org/personal_org/personal.org"))
 '(org-id-locations-file "~/org/personal_org/.org-id-locations")
 '(org-log-into-drawer t)
 '(org-log-reschedule 'time)
 '(org-log-state-notes-insert-after-drawers t)
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-allow-creating-parent-nodes nil)
 '(org-refile-targets '((org-agenda-files :maxlevel . 10)))
 '(org-refile-use-outline-path 'file)
 '(org-return-follows-link t)
 '(package-selected-packages
   '(forge yaml markdown-mode ghub closql emacsql treepy git-link git-messenger git-modes git-timemachine gitignore-templates helm-git-grep helm-ls-git smeargle treemacs-magit magit magit-section git-commit with-editor transient ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-descbinds helm-comint helm-ag google-translate golden-ratio flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile all-the-icons aggressive-indent ace-link ace-jump-helm-line))
 '(paradox-automatically-star nil)
 '(paradox-github-token "a2a26cdef436e3e18b349a99131a780c5d677d55")
 '(projectile-generic-command "find -L . -type f -print0")
 '(python-shell-interpreter "ipython")
 '(python-shell-interpreter-args "--simple-prompt -i")
 '(python-shell-virtualenv-path (file-truename "~/py3"))
 '(python-shell-virtualenv-root (file-truename "~/py3"))
 '(split-height-threshold 80)
 '(split-width-threshold 160)
 '(term-buffer-maximum-size 100)
 '(truncate-lines t)
 '(undo-tree-auto-save-history nil)
 '(whitespace-action nil)
 '(whitespace-display-mappings '((tab-mark 9 [187 9] [92 9])))
 '(whitespace-line-column 200)
 '(whitespace-style
   '(face tabs trailing lines space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "chartreuse" :box nil :height 8.0 :width normal))))
 '(flyspell-duplicate ((t (:underline (:color "forest green" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "forest green" :style wave)))))
 '(font-lock-doc-markup-face ((t (:foreground "light steel blue" :weight bold))))
 '(font-lock-doc-string-face ((t (:foreground "orange2"))) t)
 '(whitespace-space ((t (:background "#313131" :foreground "#313131")))))

;; Emacs custom settings.
;; This is an auto-generated function, do not modify its content directly, use
;; Emacs customize menu instead.
;; This function is called at the very end of Spacemacs initialization.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu t)
 '(ac-quick-help-delay 0 t)
 '(ac-use-menu-map t)
 '(avy-all-windows nil t)
 '(compilation-skip-visited t)
 '(confirm-kill-emacs (quote yes-or-no-p))
 '(custom-safe-themes
   (quote
    ("da3cdfc2251906a1887c758048eccf5590d8cfbccf013ea836a2d6003c52782b" "5ac8f397c73065285ad65590aa12a75f34bd704cac31cf204a26e1e1688a4ce2" default)))
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
 '(flycheck-disabled-checkers (quote (python-flake8)))
 '(flycheck-pylint-use-symbolic-id nil)
 '(font-lock-maximum-decoration (quote ((c++-mode . 2) (t . t))))
 '(global-hl-line-mode nil)
 '(global-origami-mode t)
 '(global-whitespace-mode nil)
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.elc$" "\\.pyc$" "\\.#")))
 '(helm-buffer-max-length nil)
 '(helm-ff-skip-boring-files t)
 '(helm-ff-tramp-not-fancy nil)
 '(helm-google-suggest-default-browser-function (quote browse-url-chromium))
 '(helm-substitute-in-filename-stay-on-remote t)
 '(helm-swoop-split-direction (quote split-window-horizontally))
 '(helm-swoop-split-with-multiple-windows nil)
 '(magit-branch-prefer-remote-upstream (quote ("master")))
 '(magit-diff-use-overlays nil)
 '(magit-log-arguments (quote ("--graph" "--decorate" "--stat" "-n256")))
 '(markdown-command
   "pandoc -r markdown_github+fenced_code_blocks+fenced_code_attributes -w html -s --highlight-style=zenburn")
 '(markdown-content-type "
")
 '(markdown-live-preview-window-function (quote markdown-live-preview-window-eww))
 '(mode-line-format (quote ("%e" (:eval (spaceline-ml-my-new-ml)))))
 '(next-error-recenter (quote (4)))
 '(org-agenda-files
   (quote
    ("~/spacemacs/org/work.org" "~/spacemacs/org/meetings.org" "~/spacemacs/org/notes.org" "~/spacemacs/org/personal_org/FirstAid_course.org" "~/spacemacs/org/personal_org/personal.org")))
 '(org-id-locations-file "~/org/personal_org/.org-id-locations" t)
 '(org-log-into-drawer t)
 '(org-log-reschedule (quote time))
 '(org-log-state-notes-insert-after-drawers t)
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-allow-creating-parent-nodes nil)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 10))))
 '(org-refile-use-outline-path (quote file))
 '(org-return-follows-link t)
 '(package-selected-packages
   (quote
    (treemacs-projectile treemacs-evil treemacs ht pfuture ox-reveal org-journal lsp-ui lsp-python lsp-dockerfile helm-ctest cquery company-lsp cmake-ide levenshtein ccls lsp-mode winum org-mime fuzzy powerline org-category-capture dash-functional projectile google-this skewer-mode js2-mode simple-httpd dockerfile-mode diminish cov bind-key packed avy highlight iedit smartparens bind-map f s evil goto-chg undo-tree helm helm-core ghub let-alist dash async hydra yapfify unicode-fonts ucs-utils font-utils persistent-soft list-utils pcache smeargle rtags rainbow-mode pyvenv pytest pyenv-mode py-isort py-autopep8 pip-requirements origami orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc magit-gitflow magit-gerrit lua-mode live-py-mode json-mode json-snatcher json-reformat jedi jedi-core python-environment epc ctable concurrent hy-mode htmlize helm-pydoc helm-gitignore helm-company helm-c-yasnippet gnuplot gmail-message-mode ham-mode markdown-mode html-to-markdown gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flyspell-correct-helm flyspell-correct flycheck-ycmd flycheck-pos-tip flycheck evil-magit magit magit-popup git-commit with-editor ein websocket edit-server disaster cython-mode csv-mode company-ycmd ycmd request-deferred deferred company-statistics company-quickhelp pos-tip company-c-headers company-anaconda company cmake-mode clang-format auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete hc-zenburn-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(paradox-automatically-star nil)
 '(paradox-github-token "a2a26cdef436e3e18b349a99131a780c5d677d55")
 '(projectile-generic-command "find -L . -type f -print0")
 '(python-shell-interpreter "ipython" t)
 '(python-shell-interpreter-args "--simple-prompt -i" t)
 '(python-shell-virtualenv-path (file-truename "~/py3"))
 '(python-shell-virtualenv-root (file-truename "~/py3"))
 '(split-height-threshold 80)
 '(split-width-threshold 160)
 '(term-buffer-maximum-size 100)
 '(truncate-lines t)
 '(undo-tree-auto-save-history nil)
 '(whitespace-action nil)
 '(whitespace-display-mappings (quote ((tab-mark 9 [187 9] [92 9]))))
 '(whitespace-line-column 200)
 '(whitespace-style
   (quote
    (face tabs trailing lines space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "chartreuse" :box nil :height 8.0 :width normal))))
 '(flyspell-duplicate ((t (:underline (:color "forest green" :style wave)))))
 '(flyspell-incorrect ((t (:underline (:color "forest green" :style wave)))))
 '(font-lock-doc-markup-face ((t (:foreground "light steel blue" :weight bold))) t)
 '(font-lock-doc-string-face ((t (:foreground "orange2"))) t)
 '(whitespace-space ((t (:background "#313131" :foreground "#313131")))))

;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode)

     emacs-lisp
     git
     helm
     ;; javascript
     markdown
     org
     python
     spell-checking
     syntax-checking
     ycmd
     ;; better-defaults
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(rtags
                                      edit-server
                                      gmail-message-mode
                                      json-mode
                                      json-reformat
                                      json-snatcher)
   ;; A list of packages that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when downloading packages.
   ;; Possible values are `used', `used-but-keep-unused' and `all'. `used' will
   ;; download only explicitly used packages and remove any unused packages as
   ;; well as their dependencies. `used-but-keep-unused' will download only the
   ;; used packages but won't delete them if they become unused. `all' will
   ;; download all the packages regardless if they are used or not and packages
   ;; won't be deleted by Spacemacs. (default is `used')
   dotspacemacs-download-packages 'used))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of of
   ;; the form `(list-type . list-size)`. If nil it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(hc-zenburn
                         my-spacemacs-wombat)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; (message "BEFORE: helm-projectile-fuzzy-match = (%s)" helm-projectile-fuzzy-match)
  ;; (setq helm-projectile-fuzzy-match nil)
  ;; (message "AFTER: helm-projectile-fuzzy-match = (%s)" helm-projectile-fuzzy-match)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; shift + arrow key = switch to window
  (windmove-default-keybindings)

  ;;------------------ Set custom keybindings (START) -----------------------;;
  (global-set-key (kbd "C-o") 'next-multiframe-window)
  (global-set-key (kbd "C-c RET") 'browse-url-at-point)

  ;; (add-hook 'Buffer-menu-mode-hook
  ;;           (function (lambda ()
  ;;                       (local-unset-key (kbd "C-o")))))

  (add-hook 'dired-mode-hook
            (function (lambda ()
                        (local-unset-key (kbd "C-o"))
                        (local-set-key (kbd "o") 'dired-display-file)
                        )
                      )
            )

  (add-hook 'compilation-mode-hook
            (function (lambda ()
                        (local-unset-key (kbd "C-o"))
                        (local-set-key (kbd "o") 'compilation-display-error)
                        )
                      )
            )

  (add-hook 'c-mode-common-hook
            (lambda()
              (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

  ;;------------------ Set custom keybindings (END) -----------------------;;

  ;;;;; --------------------- Custom Functions (START) ---------------------;;;;
  (defmacro measure-time (&rest body)
    "Measure the time it takes to evaluate BODY."
    `(let ((time (current-time)))
       ,@body
       (message "%.06f" (float-time (time-since time)))))

  ;; sync files written in /spare/local/dcole/dev to norcompile5.skae
  (defun sync-to-skae ()
    "Sync files from /spare/local/dcole/dev to norcompile5.skae"
    (save-window-excursion (async-shell-command (format "sync-to-skae.sh %s" buffer-file-name) nil nil)))

  (add-hook 'after-save-hook #'sync-to-skae)
  (add-hook 'after-revert-hook #'sync-to-skae)

  ;;Define function that accept a count for the search-forward
  (defun search-forward-count (string count)
    (interactive "sString: \nnCount: ")
    (re-search-forward string nil nil count))

  ;; (defun search-forward-prefix (count string)
  ;;   (interactive "p\nsString: ")
  ;;   (re-search-forward string nil nil count))

  ;;Define function that accept a count for the search-backward
  (defun search-backward-count (string count)
    (interactive "sString: \nnCount: ")
    (re-search-backward string nil nil count))

  (global-set-key (kbd "C-c s") 'search-forward-count)
  (global-set-key (kbd "C-c r") 'search-backward-count)

  ;; (defun search-backward-prefix (count string)
  ;;   (interactive "p\nsString: ")
  ;;   (re-search-backward string nil nil count))

  (defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files."))

  (defun copy-location ()
    (interactive)
    (kill-new (format "%s:%d"
                      (buffer-name)
                      (line-number-at-pos)))
    )

  (fset 'beautify-OBCH
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([10 134217830 134217830 134217830 134217826 10 134217830 134217830 134217830 134217826 10 134217830 134217830 134217830 134217826 67108896 134217830 134217830 23 16 16 32 32 25 134217826 134217826 1 14 14 134217830 134217830 134217830 134217826 67108896 134217830 134217830 23 1 16 134217830 134217830 6 32 25 1 14 134217830 134217830 134217830 134217826 67108896 134217830 134217830 23 1 134217830 134217830 6 6 25 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217826 67108896 134217830 134217830 23 1 16 16 134217830 134217830 134217830 134217830 32 32 25 1 14 14 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217826 67108896 134217830 134217830 23 1 16 16 14 5 32 25 1 14 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217826 67108896 134217830 134217830 23 1 134217830 134217830 134217830 134217830 134217830 134217826 134217826 134217830 32 25 134217830 134217826 67108896 134217830 134217830 134217830 134217826 134217826 134217830 6 23 1 16 16 5 32 25 1 14 14 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217826 67108896 134217830 134217830 134217830 134217826 23 1 16 5 32 25 14 1 134217830 134217830 134217830 134217830 134217830 134217830 134217830 134217826 67108896 134217826 134217830 6 23 1 14] 0 "%d")) arg)))

  (defun open-jira-issue ()
    "Open the jira issue at point"
    (interactive)
    ;; (message "openning %s" (format "http://norjira.tower-research.com/browse/%s" (symbol-at-point)))
    (browse-url (format "http://norjira.tower-research.com/browse/%s" (symbol-at-point)))
    )

  (global-set-key (kbd "<f12>") 'open-jira-issue)

  (windmove-default-keybindings)
  ;;;;; --------------------- Custom Functions (END) ---------------------;;;;

  ;;;;; --------------------- spacemacs mods (START) ---------------------;;;;

  (with-eval-after-load 'company
    (global-set-key (kbd "<C-tab>") 'company-complete)
    )

  (with-eval-after-load 'ycmd
    ;; (setq ycmd-server-command
    ;;       '("python"
    ;;         "/spare/local/dcole/venv_el6-norgrp/vim-YouCompleteMe/1.20160711/share/vim/bundle/vim-YouCompleteMe/third_party/ycmd/ycmd"))
    (setq ycmd-parse-conditions '(save new-line mode-enabled idle-change))
    (setq ycmd-idle-change-delay 1.0)
    )

  (with-eval-after-load 'magit
    (dolist (inserter '(magit-insert-modules-unpulled-from-upstream
                        magit-insert-modules-unpulled-from-pushremote
                        magit-insert-modules-unpushed-to-upstream
                        magit-insert-modules-unpushed-to-pushremote
                        magit-insert-submodules))
      (magit-add-section-hook
       'magit-status-sections-hook inserter
       'magit-insert-unpulled-from-upstream))
    (add-hook 'magit-status-mode-hook
              (lambda ()
                (local-set-key  (kbd "C-c p") 'magit-push-implicitly)
                )
              )
    )


  (spacemacs/toggle-truncate-lines-on)
  ;; Projectile
  (setq projectile-enable-caching t)

  ;; set spaceline (modeline)
  ;; This creates a new spcaeline modeline named spaceline-ml-dcole-ml
  ;; See doc: https://github.com/TheBB/spaceline
  (spaceline-compile 'dcole-ml
                     '(((point-position line-column))
                       anzu auto-compile
                       (buffer-modified buffer-size buffer-id remote-host)
                       major-mode
                       (process :when active)
                       ((flycheck-error flycheck-warning flycheck-info)
                        :when active)
                       (minor-modes :when active)
                       (mu4e-alert-segment :when active)
                       (erc-track :when active)
                       (version-control :when active)
                       (org-pomodoro :when active)
                       (org-clock :when active)
                       nyan-cat)
                     '(which-function
                       (python-pyvenv :fallback python-pyenv)
                       (battery :when active)
                       selection-info input-method
                       (global :when active)
                       (new-version :when active)
                       buffer-position hud))
  ;;;;; --------------------- spacemacs mods (END) ---------------------;;;;

  ;;------------------ Set custom indentations (START) -----------------------;;
  (defun my-c-indentation-hook ()
    (setq show-trailing-whitespace t)     ; highlight trailing whitespaces
    (setq tab-width 8)                    ; tab-width is 8 spaces (so that things don't completely crap out if someone else is using the default 8)
    (setq c-basic-offset 2)               ; basic-offset is same as tab-width
    (setq indent-tabs-mode nil)           ; use spaces not tabs
    (c-set-offset 'statement-case-open 0) ; don't indent the open braces (the braces themselves) of the case statement
    (c-set-offset 'case-label '+)         ; offsets case labels a little bit
    (c-set-offset 'substatement-open 0)   ; does not offset { if { is on new line by itself
    (c-set-offset 'innamespace 0)         ; does not indent contents of 'namespace { }'
    (c-set-offset 'access-label '/)       ; indent access labels by less, i.e., 1 space
    )

  (add-hook 'c++-mode-hook 'my-c-indentation-hook)
  ;;------------------ Set custom indentations (END) -----------------------;;

  ;;------------------- Adding missing c++11 highlights (START) --------------;;
  (require 'font-lock)

  (defun --copy-face (new-face face)
    "Define NEW-FACE from existing FACE."
    (copy-face face new-face)
    (eval `(defvar ,new-face nil))
    (set new-face new-face))

  (--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
               'font-lock-keyword-face)
  (--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
               'font-lock-keyword-face)
  (--copy-face 'font-lock-doc-string-face ; comment markups
               'font-lock-doc-face)

  ;; Set inside string escape highlighting (for "%s %d" and such)
  (defface font-lock-backslash-face
    '((t :inherit bold))
    "Face for the back-slash component of a back-slash escape."
    :group 'font-lock-faces)

  (defface font-lock-backslash-escaped-char-face
    '((t :inherit bold))
    "Face for the charcter component of a back-slash escape."
    :group 'font-lock-faces)

  (defface font-lock-format-specier-face
    '((t :inherit bold))
    "Face for the % component of a printf format code."
    :group 'font-lock-faces)

  (defface font-lock-format-specier-code-face
    '((t :inherit bold))
    "Face for the directive component of a printf format code."
    :group 'font-lock-faces)


  ;; %[parameter][flags][width][.precision][length]type
  ;; Original (from http://stackoverflow.com/questions/4098533/how-to-write-c-sharp-regular-expression-pattern-to-match-basic-printf-format-str)
  ;;   (?<!%)(?:%%)*%([\-\+0\ \#])?(\d+|\*)?(\.\*|\.\d+)?([hLIw]|l{1,2}|I32f|I64)?([cCdiouxXeEfgGaAnpsSZ])
  ;; My Modification based on http://www.cplusplus.com/reference/cstdio/printf/:
  ;;   (%)(([-0 #\+])?([0-9]+|\*)?(\.\*|\.[0-9]+)?([hljztL]|l{2}|h{2})?([diuoxXfFeEgGaAcspn])\%)
  ;; My Modification of that with double escaped slashes
  ;;   "\\(%\\)\\(\\(\\([-0 #\\+]\\)?\\([0-9]+\\|\\*\\)?\\(\\.\\*\\|\\.[0-9]+\\)?\\([hljztL]\\|l\\{2\\}\\|h\\{2\\}\\)?\\([diuoxXfFeEgGaAcspn]\\)\\)\\|%\\)"
  ;; Below I removed the space option, so that the following won't be highlighted: b = 5 % a;
  ;;   "\\(%\\)\\(\\(\\([-0#\\+]\\)?\\([0-9]+\\|\\*\\)?\\(\\.\\*\\|\\.[0-9]+\\)?\\([hljztL]\\|l\\{2\\}\\|h\\{2\\}\\)?\\([diuoxXfFeEgGaAcspn]\\)\\)\\|%\\)"


  (add-hook 'prog-mode-hook
            (lambda ()
              (font-lock-add-keywords nil
                                      '(("\\(\\\\\\)." 1 'font-lock-backslash-face              prepend)
                                        ("\\\\\\(.\\)" 1 'font-lock-backslash-escaped-char-face prepend)
                                        ("\\(%\\)\\(\\(\\([-0#\\+]\\)?\\([0-9]+\\|\\*\\)?\\(\\.\\*\\|\\.[0-9]+\\)?\\([hljztL]\\|l\\{2\\}\\|h\\{2\\}\\)?\\([diuoxXfFeEgGaAcspn]\\)\\)\\|%\\)"
                                         (1 'font-lock-format-specier-face                      prepend)
                                         (2 'font-lock-format-specier-code-face                 prepend)
                                         )))))

  (add-hook
   'c++-mode-hook
   '(lambda()
      ;; We could place some regexes into `c-mode-common-hook', but note that their evaluation order
      ;; matters.
      (font-lock-add-keywords
       nil '(;; complete some fundamental keywords
             ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
             ;; namespace names and tags - these are rendered as constants by cc-mode
             ("\\<\\(\\w+::\\)" . font-lock-type-face)
             ;;  new C++11 keywords
             ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
             ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
             ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
             ("\\<[A-Z]*_[A-Z_0-9]+\\>" . font-lock-constant-face)
             ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
             ;; hexadecimal numbers
             ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
             ;; integer/float/scientific numbers
             ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
             ;; c++11 string literals
             ;;       L"wide string"
             ;;       L"wide string with UNICODE codepoint: \u2018"
             ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
             ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
             ;;       R"(user-defined literal)"
             ;;       R"( a "quot'd" string )"
             ;;       R"delimiter(The String Data" )delimiter"
             ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
             ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)" 1 font-lock-keyword-face t) ; start delimiter
             (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\(.*?\\))[^\\s-\\\\()]\\{0,16\\}\"" 1 font-lock-string-face t)  ; actual string
             (   "\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(.*?\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; end delimiter

             ;; user-defined types (rather project-specific)
             ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
             ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
             ("\t" 0 'trailing-whitespace) ;;Highlight tabs in the same way as trailing whitespaces
             ))
      ) t)
  ;;------------------- Adding missing c++11 highlights (END) --------------;;

  ;;;;;   --------------------- json (START) ------------------------------ ;;;;

  (add-hook 'json-mode-hook
            (lambda()
              (modify-syntax-entry ?\n "> b")
              (set (make-local-variable 'help-at-pt-timer-delay) 0.3)
              (help-at-pt-set-timer)
              (set (make-local-variable 'help-at-pt-display-when-idle) t)

              ;; disable problematic modes
              (highlight-parentheses-mode -1)
              (highlight-numbers-mode -1)
              (flyspell-mode -1)
              )
            )
  ;;;;;   --------------------- json (END) ------------------------------ ;;;;

  ;;;;;   --------------------- csv (START) ------------------------------ ;;;;

  (add-hook 'csv-mode-hook
            (lambda()
              ;; disable problematic modes
              (flyspell-mode -1)
              (font-lock-mode -1)
              )
            )
  ;;;;;   --------------------- csv (END) ------------------------------ ;;;;

  ;;------------------- Support clang format (START) -------------------------;;
  (add-hook 'c-mode-common-hook
            (lambda()
              (local-set-key (kbd "C-c C-f") 'clang-format-buffer)
              (local-set-key (kbd "C-c C-r") 'clang-format-region)
              )
            )
  ;;------------------- Support clang format (END) -------------------------;;


  ;;;;;   --------------------- C++ - rtags (START) ------------------------------ ;;;;
  (add-hook 'c-mode-common-hook
            (lambda()
              (rtags-enable-standard-keybindings c-mode-base-map)
              (local-set-key  (kbd "M-.") 'rtags-find-symbol-at-point)
              (local-set-key  (kbd "C->") 'rtags-find-virtuals-at-point)
              (local-set-key  (kbd "M-,") 'rtags-find-references-at-point)
              (local-set-key  (kbd "C-'") 'rtags-imenu)
              (local-set-key  (kbd "C-,") 'rtags-find-references)
              (local-set-key  (kbd "<C-right>") 'rtags-next-match)
              (local-set-key  (kbd "<C-left>")  'rtags-previous-match)
              (local-set-key  (kbd "<C-up>")    'rtags-location-stack-back)
              (local-set-key  (kbd "<C-down>")  'rtags-location-stack-forward)
              (global-set-key (kbd "C-c C-n") 'flycheck-next-error)
              (global-set-key (kbd "C-c C-p") 'flycheck-previous-error)
              (local-set-key  (kbd "C-c C-n") 'flycheck-next-error)
              (local-set-key  (kbd "C-c C-p") 'flycheck-previous-error)
              (remove-hook 'kill-buffer-hook 'rtags-kill-buffer-hook)
              )
            )
  ;;;;;   --------------------- rtags (END) ------------------------------ ;;;;

  ;;;;;   --------------------- org-mode (START) ------------------------------ ;;;;
  (with-eval-after-load 'org
  ;;   (define-key global-map [f8] 'remember)
  ;;   (define-key global-map [f9] 'remember-region)


  ;;   (setq org-agenda-files (quote ("c:/Charles/GTD/birthday.org" "c:/Charles/GTD/newgtd.org"))
  ;;         org-agenda-include-diary nil
  ;;         org-agenda-ndays 7
  ;;         org-agenda-repeating-timestamp-show-all nil
  ;;         org-agenda-restore-windows-after-quit t
  ;;         org-agenda-show-all-dates t
  ;;         org-agenda-skip-deadline-if-done t
  ;;         org-agenda-skip-scheduled-if-done t
  ;;         org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up)))
  ;;         org-agenda-start-on-weekday nil
  ;;         org-agenda-todo-ignore-deadlines t
  ;;         org-agenda-todo-ignore-scheduled t
  ;;         org-agenda-todo-ignore-with-date t
  ;;         org-agenda-window-setup (quote other-window)
  ;;         org-deadline-warning-days 7
  ;;         org-fast-tag-selection-single-key nil
  ;;         org-insert-mode-line-in-empty-file t
  ;;         org-log-done (quote (done))
  ;;         org-refile-targets (quote (("newgtd.org" :maxlevel . 1) ("someday.org" :level . 2)))
  ;;         org-reverse-note-order nil
  ;;         org-tags-column -78
  ;;         org-tags-match-list-sublevels nil
  ;;         org-time-stamp-rounding-minutes 5
  ;;         org-timeline-show-empty-dates t
  ;;         org-use-fast-todo-selection t
  ;;         org-use-tag-inheritance nil

  ;;         org-default-notes-file "~/.notes"
  ;;         remember-annotation-functions '(org-remember-annotation)
  ;;         remember-handler-functions '(org-remember-handler)

  ;;         org-remember-templates
  ;;               '(
  ;;                 ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "/spare/local/dcole/org/gtd/newgtd.org" "Tasks")
  ;;                 ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "/spare/local/dcole/org/gtd/privnotes.org")
  ;;                 ("WordofDay" ?w "\n* %^{topic} \n%i%?\n" "/spare/local/dcole/org/gtd/wotd.org")
  ;;                 )

  ;;         org-agenda-exporter-settings
  ;;               '((ps-number-of-columns 1)
  ;;                 (ps-landscape-mode t)
  ;;                 (htmlize-output-type 'css))

  ;;         org-agenda-custom-commands
  ;;               '(

  ;;                 ("P" "Projects"
  ;;                  ((tags "PROJECT")))

  ;;                 ("H" "Office and Home Lists"
  ;;                  ((agenda)
  ;;                   (tags-todo "OFFICE")
  ;;                   (tags-todo "HOME")
  ;;                   (tags-todo "COMPUTER")
  ;;                   (tags-todo "DVD")
  ;;                   (tags-todo "READING")))

  ;;                 ("D" "Daily Action List"
  ;;                  (
  ;;                   (agenda "" ((org-agenda-ndays 1)
  ;;                               (org-agenda-sorting-strategy
  ;;                                (quote ((agenda time-up priority-down tag-up) )))
  ;;                               (org-deadline-warning-days 0)
  ;;                               ))))
  ;;                 )
  ;;    )
  ;;   (add-hook 'remember-mode-hook 'org-remember-apply-template)
    ;; here goes your Org config :)
    ;; ....
    )
  ;;;;;   --------------------- org-mode (END) ------------------------------ ;;;;

  ;;;;;   ------------------- external-editor (START) -------------------- ;;;;
  (with-eval-after-load 'edit-server
    (edit-server-start)
    )

  ;;;;;   ------------------- external-editor (END) -------------------- ;;;;
  (with-eval-after-load 'google-this
    (google-this-mode 1)
    )

  ;;Get ansi color in shell output buffer and in compilation buffer
  (require 'ansi-color)

  (defadvice display-message-or-buffer (before ansi-color activate)
    "Process ANSI color codes in shell output."
    (let ((buf (ad-get-arg 0)))
      (and (bufferp buf)
           (string= (buffer-name buf) "*Shell Command Output*")
           (with-current-buffer buf
             (ansi-color-apply-on-region (point-min) (point-max))))))

  (defun colorize-compilation-buffer ()
    (read-only-mode)
    (ansi-color-apply-on-region (point-min) (point-max))
    (read-only-mode 1))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

  (load-theme 'my-spacemacs-wombat t)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-chromium))
 '(browse-url-chromium-arguments
   (quote
    ("--user-data-dir=/spare/local/dcole/google-chrome" " %U")))
 '(browse-url-chromium-program "google-chrome-stable")
 '(desktop-save-mode t)
 '(display-time-mode t)
 '(electric-indent-mode nil)
 '(eshell-scroll-show-maximum-output nil)
 '(evil-want-Y-yank-to-eol nil)
 '(font-lock-maximum-decoration (quote ((c++-mode . 2) (t . t))))
 '(global-hl-line-mode nil)
 '(helm-google-suggest-default-browser-function (quote browse-url-chromium))
 '(magit-diff-use-overlays nil)
 '(mode-line-format (quote ("%e" (:eval (spaceline-ml-dcole-ml)))))
 '(org-agenda-files (quote ("/spare/local/dcole/spacemacs/org/")))
 '(org-log-into-drawer t)
 '(org-log-reschedule (quote time))
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-use-outline-path (quote file))
 '(paradox-automatically-star nil)
 '(paradox-github-token "a2a26cdef436e3e18b349a99131a780c5d677d55")
 '(rtags-use-helm t)
 '(term-buffer-maximum-size 100)
 '(truncate-lines t)
 '(undo-tree-auto-save-history t)
 '(ycmd-extra-conf-whitelist (quote ("/spare/local/dcole/dev/*")))
 '(ycmd-server-command
   (quote
    ("python" "/spare/local/dcole/venv_el6-norgrp/vim-YouCompleteMe/1.20160711/share/vim/bundle/vim-YouCompleteMe/third_party/ycmd/ycmd"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 98 :width normal)))))
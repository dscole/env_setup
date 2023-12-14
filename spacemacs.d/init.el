;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     lua
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t ;; use 'manual to invoke on M-h
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-minimum-prefix-length 1
                      )
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-backend 'lsp-ccls
            c-c++-lsp-sem-highlight-method 'font-lock
            c-c++-lsp-cache-dir (file-truename "~/.lsp.cache")
            ;; c-c++-enable-clang-format-on-save t
            c-c++-adopt-subprojects t
	    )
     dap
     lsp
     docker
     ;; (tree-sitter :variables
     ;;              spacemacs-tree-sitter-hl-black-list '(js2-mode rjsx-mode)
     ;;              tree-sitter-syntax-highlight-enable t
     ;;              tree-sitter-fold-enable t
     ;;              tree-sitter-fold-indicators-enable nil)
     ;; better-defaults
     emacs-lisp
     git
     helm
     ;; javascript
     markdown
     (org :variables
          org-enable-reveal-js-support t
          org-enable-org-journal-support t
          )
     spacemacs-org
     python
     spell-checking
     syntax-checking
     ipython-notebook
     cmake
     multiple-cursors
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(sqlite3)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; (with-eval-after-load 'ob-ipython
  ;;   (print "I don't like you ob-ipython!!")
  ;;   (remove-hook 'org-mode-hook 'ob-ipython-auto-configure-kernels)
  ;;   )

  ;; (setq custom-file (concat dotspacemacs-directory "custom-file.el"))
  ;; (load custom-file)
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; shift + arrow key = switch to window
  (windmove-default-keybindings)

  ;;------------------ Set custom keybindings (START) -----------------------;;

  (spacemacs/set-leader-keys "[" 'previous-multiframe-window)
  (spacemacs/set-leader-keys "]" 'next-multiframe-window)
  (spacemacs/set-leader-keys "ww" 'ace-window)
  ;; (spacemacs/set-leader-keys "bb" 'helm-buffers-list)
  ;; (spacemacs/set-leader-keys "bB" 'helm-mini)
  ;; (spacemacs/set-leader-keys "ij" 'spacemacs/insert-line-below-no-indent)
  ;; (spacemacs/set-leader-keys "ik" 'spacemacs/insert-line-above-no-indent)
  ;; (spacemacs/set-leader-keys "iJ" 'evil-insert-newline-below)
  ;; (spacemacs/set-leader-keys "iK" 'evil-insert-newline-above)
  ;; new Magit bindings
  ;; (spacemacs/set-leader-keys "glL" 'magit-log-buffer-file-popup)
  ;; (spacemacs/set-leader-keys "gll" 'magit-log-buffer-file)

  ;; Set fonts
  ;; (unicode-fonts-setup)
  ;;------------------ Set custom keybindings (END) -----------------------;;

  ;;;;; --------------------- Custom Functions (START) ---------------------;;;;
  (defmacro measure-time (&rest body)
    "Measure the time it takes to evaluate BODY."
    `(let ((time (current-time)))
       ,@body
       (message "%.06f" (float-time (time-since time)))))

  ;;Define function that accept a count for the search-forward
  (defun search-forward-count (string count)
    (interactive "sString: \nnCount: ")
    (re-search-forward string nil nil count))

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

  ;; This is an example of how to create a closure:
  ;; (defun my-function ()
  ;;   (message "inside my-function"))

  ;; (defun create-wrapper (end_function)
  ;;   (lexical-let ((end_function end_function))
  ;;     (lambda ()
  ;;       (funcall end_function))))

  ;; (setq new-wrapped (create-wrapper 'my-function))

  ;; (funcall new-wrapped)

  ;; This is an example of how to do the same thing with eval or defmacro:
  ;; (defun my-function ()
  ;;   (message "inside my-function"))

  ;; (defun create-wrapper (end_function)
  ;;   (eval
  ;;    `(defun ,(intern (format "my-%s" (symbol-name end_function))) ()
  ;;       (,end_function)))
  ;;   )

  ;; (defmacro create-wrapper-2 (end_function)
  ;;   `(defun ,(intern (format "my-%s" (symbol-name end_function))) ()
  ;;      (,end_function))
  ;;   )

  ;; (setq new-wrapped (create-wrapper-2 my-function))

  ;; (funcall new-wrapped)

;;   (defmacro create-helm-ff-wrapper-3 (end_function)
;;     "This defines a new function for use with helm-ff
;; It takes a function that takes a single argument - a directory, and defines a new function
;; my-<end_function name> that can then be used to bind to keys in helm-find-files-map"
;;     `(defun ,(intern (format "wrapped-%s" (symbol-name end_function))) ()
;;        (interactive)
;;        (with-helm-alive-p
;;          (helm-exit-and-execute-action (lambda(_candidate)
;;                                          (,end_function _candidate)))))
;;     )

;;   (defun create-helm-ff-wrapper-2 (end_function)
;;     "This defines a new function for use with helm-ff
;; It takes a function that takes a single argument - a directory, and defines a new function
;; my-<end_function name> that can then be used to bind to keys in helm-find-files-map"
;;     (eval `(defun ,(intern (format "wrapped-%s" (symbol-name end_function))) ()
;;              (interactive)
;;              (with-helm-alive-p
;;                (helm-exit-and-execute-action (lambda(_candidate)
;;                                                (,end_function _candidate))))))
;;     )



;;   (defun create-helm-ff-wrapper (end_function)
;;     "this creates a closure for use with helm-ff
;; it takes a function that takes a single argument - a directory. the closure can then be used
;; to bind to keys in helm-find-files-map"
;;     (lexical-let ((end_function end_function))
;;       (lambda ()
;;         (interactive)
;;         (with-helm-alive-p
;;           (helm-exit-and-execute-action (lambda(_candidate)
;;                                           (funcall end_function _candidate)))))
;;       )
;;     )

;;   (defun my-do-ag (path)
;;     (helm-do-ag (file-name-directory path)))


  ;;;;; --------------------- Custom Functions (END) ---------------------;;;;

  ;;;;; --------------------- spacemacs mods (START) ---------------------;;;;

  ;; (with-eval-after-load 'company
  ;;   (global-set-key (kbd "<C-tab>") 'company-complete)
  ;;   (push (apply-partially #'cl-remove-if
  ;;                          (lambda (c)
  ;;                            (or (string-match-p "[^\x00-\x7F]+" c)
  ;;                                (string-match-p "[0-9]+" c)
  ;;                                )
  ;;                            )
  ;;                          )
  ;;         company-transformers)
  ;;   )

  ;; (with-eval-after-load 'ycmd
  ;;   (setq ycmd-parse-conditions '(save new-line mode-enabled idle-change))
  ;;   (setq ycmd-idle-change-delay 1.0)
  ;;   )

  ;; Define magit-log funcs for current directory
;;   (defun my-magit-log-buffer-file (&optional follow beg end)
;;     "Show log for the blob or file visited in the current buffer.
;; With a prefix argument or when `--follow' is part of
;; `magit-log-arguments', then follow renames."
;;     (interactive (if (region-active-p)
;;                      (list current-prefix-arg
;;                            (1- (line-number-at-pos (region-beginning)))
;;                            (1- (line-number-at-pos (region-end))))
;;                    (list current-prefix-arg)))
;;     (require 'magit)
;;     (-if-let (file (or (magit-file-relative-name)
;;                        (magit-file-relative-name default-directory)))
;;         (magit-mode-setup-internal
;;          #'magit-log-mode
;;          (list (list (or magit-buffer-refname
;;                          (magit-get-current-branch)
;;                          "HEAD"))
;;                (let ((args (car (magit-log-arguments))))
;;                  (when (and follow (not (member "--follow" args)))
;;                    (push "--follow" args))
;;                  (when (and beg end)
;;                    (setq args (cons (format "-L%s,%s:%s" beg end file)
;;                                     (cl-delete "-L" args :test
;;                                                'string-prefix-p)))
;;                    (setq file nil))
;;                  args)
;;                (and file (list file)))
;;          magit-log-buffer-file-locked)
;;       (user-error "Buffer isn't visiting a file"))
;;     (magit-log-goto-same-commit))

;;   (defun my-magit-dir-log (directory)
;;     "Show the status of the current Git repository in a buffer.
;; With a prefix argument prompt for a repository to be shown.
;; With two prefix arguments prompt for an arbitrary directory.
;; If that directory isn't the root of an existing repository
;; then offer to initialize it as a new repository."
;;     (let* ((default-directory directory)
;;            (magit--default-directory directory)
;;            (file (magit-file-relative-name directory)))
;;         (magit-mode-setup-internal
;;          #'magit-log-mode
;;          (list (list (or magit-buffer-refname
;;                          (magit-get-current-branch)
;;                          "HEAD"))
;;                (let ((args (car (magit-log-arguments))))
;;                  (push "--follow" args)
;;                  args)
;;                (and file (list file)))
;;          magit-log-buffer-file-locked))
;;     (magit-log-goto-same-commit))

;;   (defun my-magit-log-buffer-file-popup ()
;;     "Popup console for log commands.

;; This is a variant of `magit-log-popup' which shows the same popup
;; but which limits the log to the file being visited in the current
;; buffer."
;;     (interactive)
;;     (-if-let (file (or (magit-file-relative-name)
;;                        (magit-file-relative-name default-directory)))
;;         (let ((magit-log-arguments
;;                (magit-popup-import-file-args
;;                 (-if-let (buffer (magit-mode-get-buffer 'magit-log-mode))
;;                     (with-current-buffer buffer
;;                       (nth 2 magit-refresh-args))
;;                   (default-value 'magit-log-arguments))
;;                 (list file))))
;;           (magit-invoke-popup 'magit-log-popup nil nil))
;;       (user-error "Buffer isn't visiting a file"))
;;     )

;;   (defun my-magit-dir-log-popup (directory)
;;     (message "this is the directory:")
;;     (prin1 directory)
;;     (let* ((default-directory directory)
;;            (magit--default-directory directory)
;;            (file (magit-file-relative-name directory))
;;            (magit-log-arguments (magit-popup-import-file-args
;;                                  (default-value 'magit-log-arguments)
;;                                  (list file))))
;;       (magit-status-internal default-directory)
;;       (magit-invoke-popup 'magit-log-popup nil nil)
;;       )
;;     )

  ;; Make helm's "smart search" version of ag run on M-g a inside helm-find-files
  ;; (with-eval-after-load 'helm-files
  ;;   (define-key helm-find-files-map (kbd "M-g a") (create-helm-ff-wrapper-2 'my-do-ag))
  ;;   (define-key helm-find-files-map (kbd "M-g g") (create-helm-ff-wrapper-2 'my-magit-dir-log))
  ;;   (define-key helm-find-files-map (kbd "M-g G") (create-helm-ff-wrapper-2 'my-magit-dir-log-popup))
  ;;   )


  ;; Projectile
  (setq projectile-enable-caching t)

  ;; set spaceline (modeline)
  ;; This creates a new spcaeline modeline named spaceline-ml-my-new-ml
  ;; See doc: https://github.com/TheBB/spaceline
  ;; (spaceline-define-segment my-version-control
  ;;   "Version control information."
  ;;   (when vc-mode
  ;;     (powerline-raw
  ;;      (replace-regexp-in-string "Git" ""
  ;;                                (s-trim (concat vc-mode
  ;;                                                (when (buffer-file-name)
  ;;                                                  (pcase (vc-state (buffer-file-name))
  ;;                                                    (`up-to-date "")
  ;;                                                    (`edited "*")
  ;;                                                    (`added "+")
  ;;                                                    (`unregistered "??")
  ;;                                                    (`removed "-")
  ;;                                                    (`needs-merge "!")
  ;;                                                    (`needs-update " Upd")
  ;;                                                    (`ignored " Ign")
  ;;                                                    (_ "?")))))
  ;;      ))))

  ;; (spaceline-compile 'my-new-ml
  ;;                    '(((persp-name
  ;;                        workspace-number
  ;;                        window-number)
  ;;                       :fallback evil-state
  ;;                       :face highlight-face)
  ;;                      (point-position line-column)
  ;;                      (buffer-modified buffer-size buffer-id remote-host)
  ;;                      anzu
  ;;                      auto-compile
  ;;                      major-mode
  ;;                      (process :when active)
  ;;                      ((flycheck-error flycheck-warning flycheck-info)
  ;;                       :when active)
  ;;                      (minor-modes :when active)
  ;;                      (mu4e-alert-segment :when active)
  ;;                      (erc-track :when active)
  ;;                      (my-version-control :when active)
  ;;                      (org-pomodoro :when active)
  ;;                      (org-clock :when active)
  ;;                      nyan-cat)
  ;;                    '(which-function
  ;;                      (python-pyvenv :fallback python-pyenv)
  ;;                      purpose
  ;;                      (battery :when active)
  ;;                      selection-info input-method
  ;;                      (global :when active)
  ;;                      (new-version :when active)
  ;;                      buffer-position hud))
  ;; (setq mode-line-format '("%e" (:eval (spaceline-ml-my-new-ml))))
  ;; (force-mode-line-update t)



  ;; avy setup

  ;; (define-key evil-normal-state-map "s" 'avy-goto-char-2)
  ;; (define-key evil-motion-state-map "s" 'avy-goto-char-2)

  ;; (evil-define-key 'operator evil-surround-mode-map "s" 'avy-goto-char-2)
  ;; (evil-define-key 'operator evil-surround-mode-map "S" 'evil-surround-edit)

  ;; (evil-define-key 'visual evil-surround-mode-map "s" 'avy-goto-char-2)
  ;; (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

  ;; (evil-define-key '(normal motion visual operator) global-map (kbd "C-;") 'avy-goto-line)

  ;;;;; --------------------- spacemacs mods (END) ---------------------;;;;

  ;;------------------ Set custom indentations (START) -----------------------;;
  ;; (defun my-c-indentation-hook ()
  ;;   (setq show-trailing-whitespace t)     ; highlight trailing whitespaces
  ;;   (setq tab-width 8)                    ; tab-width is 8 spaces (so that things don't completely crap out if someone else is using the default 8)
  ;;   (setq c-basic-offset 2)               ; basic-offset is same as tab-width
  ;;   (setq indent-tabs-mode nil)           ; use spaces not tabs
  ;;   (c-set-offset 'statement-case-open 0) ; don't indent the open braces (the braces themselves) of the case statement
  ;;   (c-set-offset 'case-label '+)         ; offsets case labels a little bit
  ;;   (c-set-offset 'substatement-open 0)   ; does not offset { if { is on new line by itself
  ;;   (c-set-offset 'innamespace 0)         ; does not indent contents of 'namespace { }'
  ;;   (c-set-offset 'access-label '/)       ; indent access labels by less, i.e., 1 space
  ;;   )

  ;; (add-hook 'c++-mode-hook 'my-c-indentation-hook)
  ;;------------------ Set custom indentations (END) -----------------------;;

  ;;------------------- Adding missing c++11 highlights (START) --------------;;
  ;; (require 'font-lock)

  ;; (defun --copy-face (new-face face)
  ;;   "Define NEW-FACE from existing FACE."
  ;;   (copy-face face new-face)
  ;;   (eval `(defvar ,new-face nil))
  ;;   (set new-face new-face))

  ;; (--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
  ;;              'font-lock-keyword-face)
  ;; (--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
  ;;              'font-lock-keyword-face)
  ;; (--copy-face 'font-lock-doc-string-face ; comment markups
  ;;              'font-lock-doc-face)

  ;; ;; Set inside string escape highlighting (for "%s %d" and such)
  ;; (defface font-lock-backslash-face
  ;;   '((t :inherit bold))
  ;;   "Face for the back-slash component of a back-slash escape."
  ;;   :group 'font-lock-faces)

  ;; (defface font-lock-backslash-escaped-char-face
  ;;   '((t :inherit bold))
  ;;   "Face for the charcter component of a back-slash escape."
  ;;   :group 'font-lock-faces)

  ;; (defface font-lock-format-specier-face
  ;;   '((t :inherit bold))
  ;;   "Face for the % component of a printf format code."
  ;;   :group 'font-lock-faces)

  ;; (defface font-lock-format-specier-code-face
  ;;   '((t :inherit bold))
  ;;   "Face for the directive component of a printf format code."
  ;;   :group 'font-lock-faces)


  ;; %[parameter][flags][width][.precision][length]type
  ;; Original (from http://stackoverflow.com/questions/4098533/how-to-write-c-sharp-regular-expression-pattern-to-match-basic-printf-format-str)
  ;;   (?<!%)(?:%%)*%([\-\+0\ \#])?(\d+|\*)?(\.\*|\.\d+)?([hLIw]|l{1,2}|I32f|I64)?([cCdiouxXeEfgGaAnpsSZ])
  ;; My Modification based on http://www.cplusplus.com/reference/cstdio/printf/:
  ;;   (%)(([-0 #\+])?([0-9]+|\*)?(\.\*|\.[0-9]+)?([hljztL]|l{2}|h{2})?([diuoxXfFeEgGaAcspn])\%)
  ;; My Modification of that with double escaped slashes
  ;;   "\\(%\\)\\(\\(\\([-0 #\\+]\\)?\\([0-9]+\\|\\*\\)?\\(\\.\\*\\|\\.[0-9]+\\)?\\([hljztL]\\|l\\{2\\}\\|h\\{2\\}\\)?\\([diuoxXfFeEgGaAcspn]\\)\\)\\|%\\)"
  ;; Below I removed the space option, so that the following won't be highlighted: b = 5 % a;
  ;;   "\\(%\\)\\(\\(\\([-0#\\+]\\)?\\([0-9]+\\|\\*\\)?\\(\\.\\*\\|\\.[0-9]+\\)?\\([hljztL]\\|l\\{2\\}\\|h\\{2\\}\\)?\\([diuoxXfFeEgGaAcspn]\\)\\)\\|%\\)"


  ;; (add-hook 'prog-mode-hook
  ;;           (lambda ()
  ;;             (font-lock-add-keywords nil
  ;;                                     '(("\\(\\\\\\)." 1 'font-lock-backslash-face              prepend)
  ;;                                       ("\\\\\\(.\\)" 1 'font-lock-backslash-escaped-char-face prepend)
  ;;                                       ("\\(%\\)\\(\\(\\([-0#\\+]\\)?\\([0-9]+\\|\\*\\)?\\(\\.\\*\\|\\.[0-9]+\\)?\\([hljztL]\\|l\\{2\\}\\|h\\{2\\}\\)?\\([diuoxXfFeEgGaAcspn]\\)\\)\\|%\\)"
  ;;                                        (1 'font-lock-format-specier-face                      prepend)
  ;;                                        (2 'font-lock-format-specier-code-face                 prepend)
  ;;                                        )))))

  ;;------------------- Adding missing c++11 highlights (END) --------------;;

  ;;;;;   --------------------- json (START) ------------------------------ ;;;;

  ;; (add-hook 'json-mode-hook
  ;;           (lambda()
  ;;             (modify-syntax-entry ?\n "> b")
  ;;             (set (make-local-variable 'help-at-pt-timer-delay) 0.3)
  ;;             (help-at-pt-set-timer)
  ;;             (set (make-local-variable 'help-at-pt-display-when-idle) t)

  ;;             ;; disable problematic modes
  ;;             (highlight-parentheses-mode -1)
  ;;             (highlight-numbers-mode -1)
  ;;             (flyspell-mode -1)
  ;;             )
  ;;           )
  ;; ;; json-glib-validate: file:///tmp/tmpjMJ5Nn: error parsing file: <data>:159:6: Parse error: unexpected character `,', expected string constant

  ;; (with-eval-after-load 'flycheck
  ;;   (flycheck-define-checker my-python-json-checker
  ;;     "A JSON syntax checker using Python npr.util.common.JsonUtil module."
  ;;     :command ("python" (eval (expand-file-name "~/env_setup/python/validate_json.py")) source)
  ;;     :error-patterns
  ;;     ((error line-start
  ;;             (one-or-more not-newline)
  ;;             "error parsing file: <data>:" line ":" column
  ;;             ": Parse error: "
  ;;             (message)
  ;;             line-end))
  ;;     :modes json-mode
  ;;     )
  ;;   )

  ;;;;;   --------------------- json (END) ------------------------------ ;;;;

  ;;;;;   --------------------- csv (START) ------------------------------ ;;;;

  ;; (add-hook 'csv-mode-hook
  ;;           (lambda()
  ;;             ;; disable problematic modes
  ;;             (flyspell-mode -1)
  ;;             (font-lock-mode -1)
  ;;             )
  ;;           )
  ;;;;;   --------------------- csv (END) ------------------------------ ;;;;


  ;;;;;   --------------------- C++ (START) ------------------------------ ;;;;
  ;; (spacemacs/declare-prefix-for-mode 'c++-mode "d" "debugging")
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "db" 'gud-break)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dn" 'gud-step)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "di" 'gud-stepi)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dc" 'gud-cont)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "df" 'gud-finish)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "d>" 'gud-down)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "d<" 'gud-up)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "du" 'gud-until)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dg" 'gud-go)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dn" 'gud-next)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dj" 'gud-jump)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dp" 'gud-print)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dd" 'gud-remove)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "de" 'gud-refresh)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dr" 'gud-run)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "ds" 'gud-symbol)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dt" 'gud-tbreak)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dv" 'gud-val)
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "dw" 'gud-watch)

  ;; (spacemacs/declare-prefix-for-mode 'c++-mode "e" "place_holder")
  ;; (spacemacs/set-leader-keys-for-major-mode 'c++-mode "ee" 'smartparens-mode)

  ;;;;;   --------------------- C++ (END) ------------------------------ ;;;;

  ;; (defun my-dedicate-window ()
  ;;   (interactive)
  ;;   (set-window-dedicated-p (selected-window) t)
  ;;   (set-frame-parameter nil 'unsplittable t)
  ;;   )


  ;;;;;   --------------------- python (START) ------------------------------ ;;;;
  ;; (add-hook 'ein:connect-mode-hook 'ein:jedi-setup)
  ;; ;; for some reason the following breaks the notebook setup
  ;; ;; (spacemacs|enable-auto-complete ein:notebook-multilang-mode)
  ;; (add-hook 'ein:notebook-multilang-mode-hook
  ;;           (lambda ()
  ;;             (auto-complete-mode)
  ;;             (define-key ac-mode-map (kbd "C-c h") 'ac-last-quick-help)
  ;;             (define-key ac-mode-map (kbd "C-c H") 'ac-last-help)
  ;;             (define-key ac-menu-map "\c-n" 'ac-next)
  ;;             (define-key ac-menu-map "\c-p" 'ac-previous)
  ;;            ))

  ;; (spacemacs/declare-prefix-for-mode 'ein:notebook-multilang-mode "g" "find-symbol")
  ;; (spacemacs/set-leader-keys-for-major-mode 'ein:notebook-multilang-mode
  ;;   "gg" 'ein:pytools-jump-to-source-command
  ;;   "?" 'ein:pytools-request-tooltip-or-help)

  ;; (evil-define-key 'normal ein:notebook-multilang-mode-map
  ;;   ;; keybindings mirror ipython web interface behavior
  ;;   (kbd "C-j") 'ein:worksheet-goto-next-input
  ;;   (kbd "C-k") 'ein:worksheet-goto-prev-input)

  ;;;;;   --------------------- python (END) ------------------------------ ;;;;

  ;;;;;   --------------------- org-mode (START) ------------------------------ ;;;;

  ;; Taken from [http://koenig-haunstetten.de/2016/07/09/code-snippet-for-orgmode-e05s02/]
  ;; and [https://youtu.be/0TS3pTNGFIA?list=PLVtKhBrRV_ZkPnBtt_TD1Cs9PJlU0IIdE]
;;   (defun my/org-add-ids-to-headlines-in-file ()
;;     "Add ID properties to all headlines in the current file which
;; do not already have one."
;;     (interactive)
;;     (org-map-entries 'org-id-get-create)
;;     (org-cycle-hide-drawers 'all)       ; hide PROPERTIES if it was added
;;     )

;;   (defun my/copy-id-to-clipboard()
;;     "Copy the ID property value to killring,
;; if no ID is there then create a new unique ID.
;; This function works only in org-mode buffers.

;; The purpose of this function is to easily construct id:-links to
;; org-mode items. If its assigned to a key it saves you marking the
;; text and copying to the killring."
;;     (interactive)
;;     (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
;;       (setq mytmpid (funcall 'org-id-get-create))
;;       (kill-new mytmpid)
;;       (message "Copied %s to killring (clipboard)" mytmpid)
;;       )
;;     )

;;   (add-hook 'evil-org-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'my/org-add-ids-to-headlines-in-file nil 'local)
;;               (local-set-key (kbd "<f5>") 'my/copy-id-to-clipboard)
;;               (local-set-key (kbd "RET") 'org-return-indent)
;;               (auto-fill-mode)
;;               )
;;             )

;;   (add-hook 'org-mode-hook
;;             (lambda ()
;;               (add-hook 'before-save-hook 'my/org-add-ids-to-headlines-in-file nil 'local)
;;               (local-set-key (kbd "<f5>") 'my/copy-id-to-clipboard)
;;               (local-set-key (kbd "C-c C-x C-i") 'org-clock-in)
;;               (local-set-key (kbd "C-c C-x <C-i>") 'org-clock-in)
;;               (auto-fill-mode)
;;               )
;;             )

  ;; (with-eval-after-load 'org
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
  ;;                 ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/org/gtd/newgtd.org" "Tasks")
  ;;                 ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "~/org/gtd/privnotes.org")
  ;;                 ("WordofDay" ?w "\n* %^{topic} \n%i%?\n" "~/org/gtd/wotd.org")
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
    ;; )
  ;;;;;   --------------------- org-mode (END) ------------------------------ ;;;;

  ;;;;;   --------------------- markdown-mode (START) ------------------------------ ;;;;
;;   (defun markdown-live-preview-window-webkit (file)
;;     "Preview FILE with webkit.
;; To be used with `markdown-live-preview-window-function'."
;;     (xwidget-webkit-goto-url (concat "file://"
;;                                      (and (memq system-type '(windows-nt ms-dos))
;;                                           "/")
;;                                      (expand-file-name file)))
;;     (get-buffer "*xwidget webkit:  *")
;;     )
  ;;;;;   --------------------- markdown-mode (END) ------------------------------ ;;;;

  ;;;;;   ------------------- external-editor (START) -------------------- ;;;;
  ;; (with-eval-after-load 'edit-server
  ;;   (edit-server-start)
  ;;   )

  ;;;;;   ------------------- external-editor (END) -------------------- ;;;;

  ;;Get ansi color in shell output buffer and in compilation buffer
  ;; (require 'ansi-color)

  ;; (defadvice display-message-or-buffer (before ansi-color activate)
  ;;   "Process ANSI color codes in shell output."
  ;;   (let ((buf (ad-get-arg 0)))
  ;;     (and (bufferp buf)
  ;;          (string= (buffer-name buf) "*Shell Command Output*")
  ;;          (with-current-buffer buf
  ;;            (ansi-color-apply-on-region (point-min) (point-max))))))

  ;; (defun colorize-compilation-buffer ()
  ;;   (read-only-mode)
  ;;   (ansi-color-apply-on-region (point-min) (point-max))
  ;;   (read-only-mode 1))
  ;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

  ;; Get unicode working in ansi-term
  ;; (defadvice ansi-term (after advise-ansi-term-coding-system)
  ;;   (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
  ;; (ad-activate 'ansi-term)

  ;; (add-to-list 'custom-theme-load-path dotspacemacs-directory)
  ;; (load-theme 'my-spacemacs-wombat t)

  ;; Start the emacs server so I can connect via emacsclient -t
  ;; (server-start)

  ;; ESC doesn't work from emacsclient -t
  ;; (global-set-key (kbd "C-t") 'evil-force-normal-state)

  ;; Remove whitespace-mode from undo-tree-visualize's diff buffer-name
  ;; (setq diff-mode-hook nil)
)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(forge yaml markdown-mode ghub closql emacsql treepy git-link git-messenger git-modes git-timemachine gitignore-templates helm-git-grep helm-ls-git smeargle treemacs-magit magit magit-section git-commit with-editor transient ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org term-cursor symon symbol-overlay string-inflection string-edit-at-point spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-descbinds helm-comint helm-ag google-translate golden-ratio flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile all-the-icons aggressive-indent ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

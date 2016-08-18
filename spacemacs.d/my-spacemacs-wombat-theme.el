(deftheme my-spacemacs-wombat
  "Took the setup from hc-zenburn-theme and the colors are a mixture of hc-zenburn and wombat")

(defvar my-wombat-common-colors-alist
  '(("my-background-color"  . "#313131")
    ("my-diff-add-fg"  . "#cceecc")    ; used magit defaults
    ("my-diff-add-bg"  . "#336633")
    ("my-diff-remove-fg"  . "#eecccc")
    ("my-diff-remove-bg"  . "#663333")
    ("my-diff-changed-fg"  . "#eeeebb")
    ("my-diff-changed-bg"  . "#666622")
    )
  "Some documentation"
;;   "List of Hc-Zenburn colors.
;; Each element has the form (NAME . HEX).

;; `+N' suffixes indicate a color is lighter.
;; `-N' suffixes indicate a color is darker."
  )

(defmacro my-wombat-with-color-variables (&rest body)
  "`let' bind all colors defined in `my-wombat-common-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   my-wombat-common-colors-alist))
     ,@body))

;; (my-wombat-with-color-variables
(custom-theme-set-faces
 'my-spacemacs-wombat
 ;; '(cursor ((t (:foreground "#DCDCCC" :background "SkyBlue2"))))
 '(mouse ((t (:foreground "white"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((t (:weight bold :foreground "#ddaa6f"))))
 '(minibuffer-prompt ((t (:foreground "#e5786d"))))
 '(highlight ((t (:underline (:color foreground-color :style line) :foreground "#ffffff" :background "#454545"))))
 '(region ((t (:foreground "#f6f3e8" :background "#444444"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50"))
           (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70"))
           (((class color) (min-colors 8) (background light)) (:foreground "green"))
           (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((t (:foreground "#f6f3e8" :background "#333366"))))
 '(trailing-whitespace ((t (:background "#99968b"))))
 '(font-lock-builtin-face ((t (:weight bold :foreground "#e5786d"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#6C8C6C" :inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#99968b"))))
 '(font-lock-constant-face ((t (:foreground "#e5786d"))))
 '(font-lock-doc-face ((t (:foreground "#ddaa6f" :inherit nil))))
 '(font-lock-function-name-face ((t (:foreground "#30afd7"))))
 '(font-lock-keyword-face ((t (:foreground "#88fff2" :weight normal))))
 '(font-lock-negation-char-face ((t (:weight bold :foreground "#FDECBC"))))
 '(font-lock-preprocessor-face ((t (:foreground "#ddaa6f"))))
 '(font-lock-regexp-grouping-backslash ((t (:weight bold :foreground "#8CAC8C"))))
 '(font-lock-regexp-grouping-construct ((t (:weight bold :foreground "#FDECBC"))))
 '(font-lock-string-face ((t (:foreground "#55e074"))))
 '(font-lock-type-face ((t (:weight bold :foreground "#92a05e"))))
 '(font-lock-variable-name-face ((t (:foreground "#ffff74"))))
 '(font-lock-warning-face ((t (:weight bold :foreground "#ccaa8f"))))
 '(button ((t (:underline (:color foreground-color :style line) :inherit (link)))))
 '(link ((t (:weight bold :underline (:color foreground-color :style line) :foreground "#8ac6f2"))))
 '(link-visited ((t (:weight normal :underline (:color foreground-color :style line) :foreground "#e5786d"))))
 '(fringe ((t (:foreground "#DCDCCC" :background "#303030"))))
 '(header-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#e7f6da" :background "#303030"))))
 '(tooltip ((t (:foreground "black" :background "lightyellow" :inherit (variable-pitch)))))
 '(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#ffffff" :background "#606060"))))
 '(mode-line-buffer-id ((t (:weight bold :foreground "#d8e474"))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#857b6f" :background "#3e3e3e"))))
 '(isearch ((t (:weight bold :foreground "#857b6f" :background "#343434"))))
 '(isearch-fail ((t (:foreground "#DCDCCC" :background "#996060"))))
 '(lazy-highlight ((t (:weight bold :foreground "#a0a8b0" :background "#384048"))))
 '(match ((t (:weight bold :foreground "#ECBC9C" :background "#202020"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch)))))

;;;;; aw-mode -- make the leading character really big and conspicuous
 '(aw-leading-char-face ((t (:foreground "chartreuse" :box (:line-width 2 :color "grey75" :style released-button) :height 10.0 :width normal))))

;;;;;; diff
 '(diff-added ((t (:background "#336633" :foreground "#cceecc"))))
 '(diff-changed ((t (:background "#666622" :foreground "#eeeebb"))))
 '(diff-removed ((t (:background "#663333" :foreground "#eecccc"))))

 ;; `(diff-refine-added ((t (:inherit diff-added :weight bold))))
 ;; `(diff-refine-change ((t (:inherit diff-changed :weight bold))))
 ;; `(diff-refine-removed ((t (:inherit diff-removed :weight bold))))
 ;; `(diff-header ((,class (:background ,hc-zenburn-bg+2))
 ;;                (t (:background ,hc-zenburn-fg :foreground ,hc-zenburn-bg))))
 ;; `(diff-file-header
 ;;   ((,class (:background ,hc-zenburn-bg+2 :foreground ,hc-zenburn-fg :bold t))
 ;;    (t (:background ,hc-zenburn-fg :foreground ,hc-zenburn-bg :bold t))))

;;;; undo-tree-mode
 '(undo-tree-visualizer-default-face ((t (:foreground "dim gray"))))

;;;;; whitespace-mode  -- basically hide all whitespace crap in undo diff window
 ;; '(whitespace-space ((t (:background "#313131" :foreground "#313131"))))
 ;; '(whitespace-hspace ((t (:background "#313131" :foreground "#313131"))))
 ;; ;; `(whitespace-tab ((t (:background ,hc-zenburn-red-1))))
 ;; '(whitespace-newline ((t (:foreground "#313131"))))
 ;; ;; `(whitespace-trailing ((t (:background ,hc-zenburn-red))))
 ;; ;; `(whitespace-line ((t (:background ,hc-zenburn-bg :foreground ,hc-zenburn-magenta))))
 ;; ;; `(whitespace-space-before-tab ((t (:background ,hc-zenburn-orange :foreground ,hc-zenburn-orange))))
 ;; '(whitespace-indentation ((t (:background "#313131" :foreground "#313131"))))
 ;; ;; `(whitespace-empty ((t (:background ,hc-zenburn-yellow))))
 ;; ;; `(whitespace-space-after-tab ((t (:background ,hc-zenburn-yellow :foreground ,hc-zenburn-red))))

 '(default ((t (:family "Source Code Pro" :foundry "adobe"
                        :width normal :height 98 :weight normal :slant normal
                        :underline nil :overline nil :strike-through nil :box nil
                        :inverse-video nil
                        :foreground "#f6f3e8" :background "#313131"
                        :stipple nil :inherit nil))))
 )
 ;; )

(provide-theme 'my-spacemacs-wombat)

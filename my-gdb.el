;;; my-gdb.el

;;; code:

(defconst default-gdb-windows-layout '(command 0
                                               locals 1
                                               source (2 1 2)
                                               output (3 1 2)
                                               breakpoints 7)
  "The default windows layout that gdb uses.")

(define-widget 'gdb-buffer-placement 'lazy
  "A binary tree made of cons-cells and strings."
  :offset 4
  :tag "Describes where to place a gdb buffer"
  :type '(list (integer :tag "Grid cell index" 0)
               (integer :tag "Horizontal width in cells" 1)
               (integer :tag "Vertical height in cells" 1)
               (integer :tag "Frame Index" 0)))

(define-widget 'binary-tree-of-string 'lazy
  "A binary tree made of cons-cells and strings."
  :offset 4
  :tag "Node"
  :type '(choice (string :tag "Leaf" :value "")
                 (cons :tag "Interior"
                       :value ("" . "")
                       binary-tree-of-string
                       binary-tree-of-string)))

(defcustom gdb-windows-layout nil
  "Describe the window layout of ."
  :group 'gdb
  :type '(choice (const :tag "Use no strict layout" nil)
                 (variable-item default-gdb-windows-layout)
                 (list :tag "custom layout"
                       (list :tag "Define the grid"
                             (integer :tag "Number of grid rows" 4) (integer :tag "Number of grid columns" 2))
                       (set :tag "Choose the buffers you want to display"
                            (cons :tag "gdb buffer" (const command) (gdb-buffer-placement))
                            (cons :tag "locals buffer" (const locals) (gdb-buffer-placement))
                            (cons :tag "source buffer" (const source) (gdb-buffer-placement))
                            (cons :tag "io buffer" (const io) (gdb-buffer-placement))
                            (cons :tag "breakpoints buffer" (const breakpoints) (gdb-buffer-placement))
                            (cons :tag "stack buffer" (const stack) (gdb-buffer-placement))
                            (cons :tag "disassembly buffer" (const disassembly) (gdb-buffer-placement))
                            (cons :tag "memory buffer" (const memory) (gdb-buffer-placement))
                            (cons :tag "registers buffer" (const registers) (gdb-buffer-placement))
                            (cons :tag "threads buffer" (const threads) (gdb-buffer-placement))
                            )
                       )
                 )
  )

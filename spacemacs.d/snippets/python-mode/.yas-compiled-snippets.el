;;; Compiled snippets and support files for `python-mode'
;;; .yas-setup.el support file if any:
;;;
(defun python-args-to-google-docstring (text &optional make-fields)
  "Return a reST docstring format for the python arguments in yas-text."
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args text))
     (nr 0)
         (formatted-args
      (mapconcat
       (lambda (x)
         (concat "   " (nth 0 x)
             (if make-fields (format " ${%d:arg%d}" (incf nr) nr))
             (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
       args
       indent)))
    (unless (string= formatted-args "")
      (concat
       (mapconcat 'identity
          (list "" "Args:" formatted-args)
          indent)
       "\n"))))
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
                     '(("farg" "parser.add_argument('-$1', '--$2',\n                    $0)\n" "arg_option" nil nil nil nil nil nil)
                       ("parg" "parser.add_argument('${1:varname}', $2)\n$0" "arg_positional" nil nil nil nil nil nil)
                       ("defg" "def ${1:name}($2):\n    \\\"\\\"\\\"$3\n    ${2:$(python-args-to-google-docstring yas-text t)}\n    ${5:Returns:\n        $6\n}\n    \\\"\\\"\\\"\n    ${0:$$(let ((beg yas-snippet-beg)\n                (end yas-snippet-end))\n        (yas-expand-snippet\n          (buffer-substring-no-properties beg end) beg end\n              (quote ((yas-indent-line nil) (yas-wrap-around-region nil))))\n            (delete-trailing-whitespace beg (- end 1)))}\n" "Python Google style Docstring" nil nil nil nil nil nil)
                       ("ifm" "import argparse\n\n\ndef get_parser():\n    parser = argparse.ArgumentParser(\n         description=\"${1:desribe what this script does}\",\n         formatter_class=argparse.ArgumentDefaultsHelpFormatter)\n    return parser\n\n\ndef parse_args():\n    parser = get_parser()\n    args = parser.parse_args()\n    return args\n\n\ndef main():\n    ${2:do main stuff}\n\n\nif __name__ == '__main__':\n    main(**parse_args().__dict__)\n" "ifmain" nil nil nil nil nil nil)
                       ("pars" "parser = argparse.ArgumentParser(description='$1',\n                                 formatter_class = argparse.ArgumentDefaultsHelpFormatter)\n$0\n" "parse_args" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Fri Jun 10 16:55:17 2016

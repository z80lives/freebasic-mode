;;; freebasic-mode.el --- major mode for editing freebasic source code.

;; Author: Shath Ibrahim
;; Created: 26 Jun 2015
;; Keywords: freebasic

;; This file is not part of GNU Emacs.

;;; License:
;;; This file was created for personal use.
;;; Feel free to modify and redistribute the file.

;; Freebasic Mode for Emacs
;; emacs Major mode for freebasic language.

;; Add the following line to your .emacs file
;; (require 'freebasic-mode)

;; The following keywords were generated using 
;;  'fbfull.lng' file that came along with FBIDE
;; Original file can be found here, URL: http://fbide.freebasic.net/
;; Visit the official freebasic site, http://freebasic.net

(setq fb-keywords '("abs"  "access"  "acos"  "alias"  "allocate"  "append"  "as"  "asc"  "asin"  "asm"  "atan2"  "atn"  "base"  "beep"  "bin"  "binary"  "bload"  "bsave"  "byref"  "byval"  "call"  "callocate"  "case"  "cdecl"  "chain"  "chdir"  "chr"  "circle"  "clear"  "close"  "cls"  "color"  "com"  "command"  "common"  "condbroadcast"  "condcreate"  "conddestroy"  "condsignal"  "condwait"  "cons"  "constructor"  "continue"  "cos"  "csrlin"  "curdir"  "cvd"  "cvi"  "cvl"  "cvlongint"  "cvs"  "cvshort"  "data"  "date"  "dateadd"  "datediff"  "datepart"  "dateserial"  "datevalue"  "day"  "deallocate"  "declare"  "delete"  "destructor"  "dim"  "dir"  "do"  "draw"  "dylibfree"  "dylibload"  "dylibsymbol"  "dynamic"  "else"  "elseif"  "encoding"  "end"  "enum"  "environ"  "eof"  "erase"  "erfn"  "erl"  "ermn"  "err"  "error"  "escape"  "exec"  "exepath"  "exit"  "exp"  "explicit"  "export"  "extends"  "extern"  "field"  "fileattr"  "filecopy"  "filedatetime"  "fileexists"  "filelen"  "fix"  "flip"  "for"  "format"  "frac"  "fre"  "freefile"  "function"  "get"  "getjoystick"  "getkey"  "getmouse"  "gosub"  "goto"  "hex"  "hour"  "if"  "iif"  "imageconvertrow"  "imagecreate"  "imagedestroy"  "imageinfo"  "import"  "inkey"  "inp"  "input"  "instr"  "instrrev"  "int"  "is"  "isdate"  "kill"  "lang"  "lbound"  "lcase"  "left"  "len"  "lib"  "line"  "loc"  "local"  "locate"  "lock"  "lof"  "log"  "loop"  "lpos"  "lprint"  "lpt"  "lset"  "ltrim"  "mid"  "minute"  "mkd"  "mkdir"  "mki"  "mkl"  "mklongint"  "mks"  "mkshort"  "month"  "monthname"  "multikey"  "mutexcreate"  "mutexdestroy"  "mutexlock"  "mutexunlock"  "naked"  "name"  "namespace"  "next"  "new"  "nogosub"  "nokeyword"  "now"  "oct"  "on"  "open"  "operator"  "option"  "out"  "output"  "overload"  "paint"  "palette"  "pascal"  "pcopy"  "peek"  "pipe"  "pmap"  "point"  "poke"  "pos"  "preserve"  "preset"  "print"  "private"  "property"  "protected"  "pset"  "public"  "put"  "random"  "randomize"  "read"  "reallocate"  "redim"  "reset"  "restore"  "resume"  "return"  "right"  "rmdir"  "rnd"  "rset"  "rtrim"  "run"  "scope"  "screen"  "screencontrol"  "screencopy"  "screenevent"  "screenglproc"  "screeninfo"  "screenlist"  "screenlock"  "screenptr"  "screenres"  "screenset"  "screensync"  "screenunlock"  "scrn"  "second"  "seek"  "select"  "setdate"  "setenviron"  "setmouse"  "settime"  "sgn"  "shell"  "sin"  "sizeof"  "sleep"  "space"  "spc"  "sqr"  "stdcall"  "step"  "stick"  "str"  "strig"  "sub"  "swap"  "system"  "tab"  "tan"  "then"  "this"  "threadcreate"  "threadwait"  "time"  "timer"  "timeserial"  "timevalue"  "to"  "trim"  "type"  "typeof"  "ubound"  "ucase"  "union"  "unlock"  "until"  "using"  "val"  "valint"  "vallng"  "valuint"  "valulng"  "var"  "view"  "wait"  "wbin"  "wchr"  "weekday"  "weekdayname"  "wend"  "whex"  "while"  "width"  "window"  "windowtitle"  "winput"  "with"  "woct"  "write"  "wspace"  "wstr" "year"))

(setq fb-types '("any"  "byte"  "cast"  "cbyte"  "cdbl"  "cint"  "clng"  "clngint"  "const"  "cptr"  "cshort"  "csign"  "csng"  "cubyte"  "cuint"  "culng"  "culngint"  "cunsg"  "cushort"  "defbyte"  "defdbl"  "defint"  "deflng"  "deflongint"  "defshort"  "defsng"  "defstr"  "defubyte"  "defuint"  "defulongint"  "defushort"  "double"  "integer"  "long"  "longint"  "object"  "pointer"  "procptr"  "ptr"  "sadd"  "shared"  "short"  "single"  "static"  "string"  "strptr"  "ubyte"  "uinteger"  "ulong"  "ulongint"  "unsigned"  "ushort"  "varptr"  "wstring" "zstring"))

(setq fb-operations '( "add"  "alpha"  "and"  "andalso"  "custom"  "eqv"  "imp"  "let"  "mod"  "not"  "or"  "orelse"  "shl"  "shr"  "trans" "xor"))

(setq fb-builtins '("__date__" "__fb_argc__" "__fb_argv__" "__fb_backend__" "__fb_bigendian__" "__fb_build_date__" "__fb_cygwin__" "__fb_darwin__" "__fb_debug__" "__fb_dos__" "__fb_err__" "__fb_fpmode__" "__fb_fpu__" "__fb_freebsd__" "__fb_lang__" "__fb_linux__" "__fb_main__" "__fb_min_version__" "__fb_mt__" "__fb_netbsd__" "__fb_openbsd__" "__fb_option_byval__" "__fb_option_dynamic__" "__fb_option_escape__" "__fb_option_explicit__" "__fb_option_gosub__" "__fb_option_private__" "__fb_out_dll__" "__fb_out_exe__" "__fb_out_lib__" "__fb_out_obj__" "__fb_pcos__" "__fb_signature__" "__fb_sse__" "__fb_unix__" "__fb_vectorize__" "__fb_ver_major__" "__fb_ver_minor__" "__fb_ver_patch__" "__fb_version__" "__fb_win32__" "__fb_xbox__" "__file__" "__file_nq__" "__function__" "__function_nq__" "__line__" "__path__" "__time__" "assert"  "assertwarn"  "bit"  "bitreset"  "bitset"  "defined"  "hibyte"  "hiword"  "lobyte"  "loword"  "offsetof"  "once"  "rgb"  "rgba"  "stop"  "va_arg"  "va_first" "va_next" ))

;; generate regex string for each category of keywords
(setq fb-keywords-regexp (regexp-opt fb-keywords 'words))
(setq fb-type-regexp (regexp-opt fb-types 'words))
(setq fb-operations-regexp (regexp-opt fb-operations 'words))
(setq fb-builtins-regexp (regexp-opt fb-builtins 'words))
(setq fb-preproc-regexp "^#\\w*")

;(setq fb-comment-regexp "'[^\"']*.$")

(setq fb-quote-regexp "\".\"$")

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq fb-font-lock-keywords
      `(
;	(,fb-comment-regexp . font-lock-comment-face)
	(,fb-preproc-regexp . font-lock-preprocessor-face)
	
        (,fb-type-regexp . font-lock-type-face)
        (,fb-keywords-regexp . font-lock-keyword-face)
	(,fb-operations-regexp . font-lock-negation-char-face)
	(,fb-builtins-regexp . font-lock-builtin-face)

	;(,fb-quote-regexp . font-lock-string-face)

	
        ;; note: order above matters, because once colored, that part won't change.

	
        ;; in general, longer words first
        ))


;; Regexp
(defconst freebasic-if-regexp "^[ \t]*#?if")
(defconst freebasic-else-regexp "^[ \t]*#?else\\(if\\select\\)?")
(defconst freebasic-endif-regexp "[ \t]*#?[Ee]nd[ \t]*[Ii]f")


;;(defconst freebasic-beg-regexp "[ \t]\\<\\(if\\|else\\|elseif\\|do\\|while\\|wend\\)\\>")
;;(defconst freebasic-beg-regexp "^[ \t]*#?if.+\\then")

(defconst freebasic-beg-regexp "[ \t]*#?\\<\\(if.+then$\\|else\\|do\\|select\\|while\\|for\\|with\\|type\\|function\\|constructor\\|constructor\\|property\\|sub\\|operator\\)\\>")
(defconst freebasic-end-regexp  "[ \t]*#?\\<\\(\\end[ \t]*if\\|end[ \t]*select\\|loop\\|next\\|wend\\|end[ \t]*with\\|end[ \t]*type\\|end[ \t]*constructor\\|end[ \t]*function\\|end[ \t]*sub\\|end[ \t]*constructor\\|end[ \t]*property\\|end[ \t]*operator\\)\\>")

(defconst freebasic-label-regexp ".+:$")
(defconst freebasic-el-regexp "^[ \t]*#?\\<\\(\\else\\|elseif\\|case\\)\\>")

(add-to-list 'auto-mode-alist '("\\.bas\\'" . freebasic-mode))

(defvar freebasic-indent-offset 4
  "*Indentation offset for freebasic-mode")

(defun is-freebasic-line-comment ()
  (save-excursion
    (beginning-of-line 1)
    (looking-at "[ \t]*\'")
    ))

(defun freebasic-comment ()
  "Comment current line of freebasic code"
  (interactive)
  (beginning-of-line 1)
  (insert "'")
  )
(defun freebasic-uncomment ()
  "Uncomments the current line of freebasic code"
  (interactive)
  (when (is-freebasic-line-comment)
    (beginning-of-line 1)
    (search-forward "\'")
    (delete-backward-char 1)
    ))

(defun freebasic-comment-region (p1 p2)
  "Comment out the selected region of freebasic code "
  (interactive "r")
  (let ((deactivate-mark nil))
    (save-excursion
      (goto-char p2)
      (while (>= (point) p1)
	(freebasic-comment)
	(previous-line)
	))))

(defun freebasic-uncomment-region (p1 p2)
  "Uncomments the selected region of freebasic comments "
  (interactive "r")
  (let ((deactivate-mark nil))
    (save-excursion
      (goto-char p2)
      (while (>= (point) p1)
	(freebasic-uncomment)
	(previous-line)
	))))


(defun freebasic-comment-dwim ()
  "Comment or uncomment current line of freebasic code."
  (interactive)
  (let (p1 p2)
    (if (use-region-p)
	(save-excursion
	  (setq p1 (region-beginning) p2 (region-end))
	  (goto-char p1)
	  (if (is-freebasic-line-comment)
	      (uncomment-region p1 p2)
	    (comment-region p1 p2)
	      ;;(freebasic-uncomment-region p1 p2)
	    ;;(freebasic-comment-region p1 p2)
	    )
	  )
      (progn
	(if (is-freebasic-line-comment)
	    (freebasic-uncomment)
	  (freebasic-comment)
	)
    )
   ))    
  )

(defun freebasic-indent-line ()
  "Indent current line of free-basic code."
  (interactive)
  (beginning-of-line)
  (if (bobp)
      (indent-line-to 0)	
    (let ((not-indented t) cur-indent)
      (if (or
	   (looking-at freebasic-label-regexp)
	   (looking-at freebasic-el-regexp)
	   (looking-at freebasic-end-regexp))  ;end of the block
	  (progn
	    (save-excursion
	      (forward-line -1)
	      (setq cur-indent (- (current-indentation) freebasic-indent-offset)))
	    (if (< cur-indent 0)
		(setq cur-indent 0))
	    )
	(save-excursion
	  (while not-indented 
	    (forward-line -1)
	    (if (looking-at freebasic-end-regexp)
		 ;indent same as the last end block
		(progn
		  (setq cur-indent (current-indentation))
		  (setq not-indented nil))
	      (if
		   (looking-at freebasic-beg-regexp)
		   
		  (progn
		    (setq cur-indent (+ (current-indentation) freebasic-indent-offset))
		    (setq not-indented nil))
		(if (bobp)
		    (setq not-indented nil))))))
	);;ENDIF
      
      (if cur-indent
	  (indent-line-to cur-indent)
	(indent-line-to 0))))
  )

(defun freebasic-indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

;;(defvar freebasic-compile-cmd nil)
(defun freebasic-compile()
  "Compiles the current freebasic file."
  (interactive)
  ;;(start-process "./fbc" (buffer-file-name))
  (setq compile-cmd (concat "fbc " (buffer-name)
			    
			    )
	)
  (shell-command compile-cmd)
  (shell-command
   (concat "echo " (buffer-file-name) "| sed 's/.bas//g' ")
   )
  )

(defun freebasic-quickrun()
  "Compiles the current freebasic file."
  (interactive)
  ;;(start-process "./fbc" (buffer-file-name))
					;(setq compile-cmd (concat "fbc -x ~fbout " (buffer-name) " && ./~fbout" )
  (freebasic-quickrun-clean)
  (append-to-file nil nil "~tmp.bas")
  (setq compile-cmd (concat "fbc -x ~fbout ~tmp.bas && ./~fbout && rm ~tmp.bas" )
  )
  (shell-command compile-cmd)
)

(defun freebasic-quickrun-clean()
  "Cleans the files generated by quickrun."
  (interactive)
  (if (file-exists-p "~tmp.bas")
      (delete-file "~tmp.bas")      
      )
 )


 (defvar freebasic-mode-syntax-table
   (let ((table (make-syntax-table)))
	(modify-syntax-entry ?' "< . 23" table) 	
	(modify-syntax-entry ?\/ ". 14c" table)
	(modify-syntax-entry ?\n ">" table)       
	(modify-syntax-entry ?\" "\"" table)
	table)
    "Syntax table for `freebasic-mode' buffers."
   )

;;;###autoload
(define-derived-mode freebasic-mode fundamental-mode
  "FreeBASIC Mode"
  "Major mode for FreeBASIC programming language."
  ;:syntax-table freebasic-mode-syntax-table

  ;; code for syntax highlighting
  (setq-local font-lock-defaults '((fb-font-lock-keywords) nil t) )
  
  ;;  (setq font-lock-keywords-case-fold-search t)
  
  ;(make-local-variable 'freebasic-indent-offset)
  (set (make-local-variable 'indent-line-function) 'freebasic-indent-line)

  
  ;;  (use-local-map freebasic-mode-map)
  ;;(derived-mode-set-keymap 'freebasic-mode)
  )


;; clear memory. no longer needed
(setq fb-keywords nil)
(setq fb-types nil)
(setq fb-operations nil)
(setq fb-builtins nil)
;;(setq fb-events nil)
;;(setq fb-functions nil)

;; clear memory. no longer needed
(setq fb-keywords-regexp nil)
(setq fb-types-regexp nil)
(setq fb-operations-regexp nil)
(setq fb-builtins-regexp nil)
(setq fb-comment-regexp-nil)
(setq fb-preproc-regexp-nil)

;;(run-hooks 'freebasic-mode-hook)

;; Config
;(defvar freebasic-mode-hook nil)

(define-key freebasic-mode-map (kbd "C-c C-c" ) nil)
(define-key freebasic-mode-map (kbd "C-c C-c" ) 'freebasic-comment-dwim)

(define-key freebasic-mode-map (kbd "C-c c" ) nil)
(define-key freebasic-mode-map (kbd "C-c c" ) 'freebasic-compile)

(define-key freebasic-mode-map (kbd "<f5>" ) nil)
(define-key freebasic-mode-map (kbd "<f5>" ) 'freebasic-quickrun)

(define-key freebasic-mode-map [menu-bar] (make-sparse-keymap))

;;Menu bar 
(let ((menuMap (make-sparse-keymap "FreeBASIC")))
  (define-key freebasic-mode-map [menu-bar freebasic] (cons "FreeBASIC" menuMap))
;  (define-key menuMap [about]
;    '("About freebasic-mode" . nil )
;    )
  (define-key menuMap [qrun]
    '("Quick Run" . freebasic-quickrun))
  (define-key menuMap [compile]
    '("Compile " . freebasic-compile))
  (define-key menuMap [indent-buffer]
    '("Indent buffer" . freebasic-indent-buffer))
  )


;; add the mode to the `features' list
(provide 'freebasic-mode)

;;(freebasic-indent-buffer)
;; Local Variables:
;; coding: utf-8
;; End:

;;; fb-mode.el ends here

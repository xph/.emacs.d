;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "anaphora/anaphora" "anaphora/anaphora.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from anaphora/anaphora.el

(let ((loads (get 'anaphora 'custom-loads))) (if (member '"anaphora/anaphora" loads) nil (put 'anaphora 'custom-loads (cons '"anaphora/anaphora" loads))))

(defvar anaphora-use-long-names-only nil "\
Use only long names such as `anaphoric-if' instead of traditional `aif'.")

(custom-autoload 'anaphora-use-long-names-only "anaphora/anaphora" t)

(defun anaphora--install-traditional-aliases (&optional arg) "\
Install traditional short aliases for anaphoric macros.

With negative numeric ARG, remove traditional aliases." (let ((syms '((if . t) (prog1 . t) (prog2 . t) (when . when) (while . t) (and . t) (cond . cond) (lambda . lambda) (block . block) (case . case) (ecase . ecase) (typecase . typecase) (etypecase . etypecase) (let . let) (+ . t) (- . t) (* . t) (/ . t)))) (cond ((and (numberp arg) (< arg 0)) (dolist (cell syms) (when (ignore-errors (eq (symbol-function (intern-soft (format "a%s" (car cell)))) (intern-soft (format "anaphoric-%s" (car cell))))) (fmakunbound (intern (format "a%s" (car cell))))))) (t (dolist (cell syms) (let* ((builtin (car cell)) (traditional (intern (format "a%s" builtin))) (long (intern (format "anaphoric-%s" builtin)))) (defalias traditional long) (put traditional 'lisp-indent-function (get builtin 'lisp-indent-function)) (put traditional 'edebug-form-spec (cdr cell))))))))

(unless anaphora-use-long-names-only (anaphora--install-traditional-aliases))

(autoload 'anaphoric-if "anaphora/anaphora" "\
Like `if', but the result of evaluating COND is bound to `it'.

The variable `it' is available within THEN and ELSE.

COND, THEN, and ELSE are otherwise as documented for `if'.

\(fn COND THEN &rest ELSE)" nil t)

(function-put 'anaphoric-if 'lisp-indent-function '2)

(autoload 'anaphoric-prog1 "anaphora/anaphora" "\
Like `prog1', but the result of evaluating FIRST is bound to `it'.

The variable `it' is available within BODY.

FIRST and BODY are otherwise as documented for `prog1'.

\(fn FIRST &rest BODY)" nil t)

(function-put 'anaphoric-prog1 'lisp-indent-function '1)

(autoload 'anaphoric-prog2 "anaphora/anaphora" "\
Like `prog2', but the result of evaluating FORM2 is bound to `it'.

The variable `it' is available within BODY.

FORM1, FORM2, and BODY are otherwise as documented for `prog2'.

\(fn FORM1 FORM2 &rest BODY)" nil t)

(function-put 'anaphoric-prog2 'lisp-indent-function '2)

(autoload 'anaphoric-when "anaphora/anaphora" "\
Like `when', but the result of evaluating COND is bound to `it'.

The variable `it' is available within BODY.

COND and BODY are otherwise as documented for `when'.

\(fn COND &rest BODY)" nil t)

(function-put 'anaphoric-when 'lisp-indent-function '1)

(autoload 'anaphoric-while "anaphora/anaphora" "\
Like `while', but the result of evaluating TEST is bound to `it'.

The variable `it' is available within BODY.

TEST and BODY are otherwise as documented for `while'.

\(fn TEST &rest BODY)" nil t)

(function-put 'anaphoric-while 'lisp-indent-function '1)

(autoload 'anaphoric-and "anaphora/anaphora" "\
Like `and', but the result of the previous condition is bound to `it'.

The variable `it' is available within all CONDITIONS after the
initial one.

CONDITIONS are otherwise as documented for `and'.

Note that some implementations of this macro bind only the first
condition to `it', rather than each successive condition.

\(fn &rest CONDITIONS)" nil t)

(autoload 'anaphoric-cond "anaphora/anaphora" "\
Like `cond', but the result of each condition is bound to `it'.

The variable `it' is available within the remainder of each of CLAUSES.

CLAUSES are otherwise as documented for `cond'.

\(fn &rest CLAUSES)" nil t)

(autoload 'anaphoric-lambda "anaphora/anaphora" "\
Like `lambda', but the function may refer to itself as `self'.

ARGS and BODY are otherwise as documented for `lambda'.

\(fn ARGS &rest BODY)" nil t)

(function-put 'anaphoric-lambda 'lisp-indent-function 'defun)

(autoload 'anaphoric-block "anaphora/anaphora" "\
Like `block', but the result of the previous expression is bound to `it'.

The variable `it' is available within all expressions of BODY
except the initial one.

NAME and BODY are otherwise as documented for `block'.

\(fn NAME &rest BODY)" nil t)

(function-put 'anaphoric-block 'lisp-indent-function '1)

(autoload 'anaphoric-case "anaphora/anaphora" "\
Like `case', but the result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `case'.

\(fn EXPR &rest CLAUSES)" nil t)

(function-put 'anaphoric-case 'lisp-indent-function '1)

(autoload 'anaphoric-ecase "anaphora/anaphora" "\
Like `ecase', but the result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `ecase'.

\(fn EXPR &rest CLAUSES)" nil t)

(function-put 'anaphoric-ecase 'lisp-indent-function '1)

(autoload 'anaphoric-typecase "anaphora/anaphora" "\
Like `typecase', but the result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `typecase'.

\(fn EXPR &rest CLAUSES)" nil t)

(function-put 'anaphoric-typecase 'lisp-indent-function '1)

(autoload 'anaphoric-etypecase "anaphora/anaphora" "\
Like `etypecase', but result of evaluating EXPR is bound to `it'.

The variable `it' is available within CLAUSES.

EXPR and CLAUSES are otherwise as documented for `etypecase'.

\(fn EXPR &rest CLAUSES)" nil t)

(function-put 'anaphoric-etypecase 'lisp-indent-function '1)

(autoload 'anaphoric-let "anaphora/anaphora" "\
Like `let', but the result of evaluating FORM is bound to `it'.

FORM and BODY are otherwise as documented for `let'.

\(fn FORM &rest BODY)" nil t)

(function-put 'anaphoric-let 'lisp-indent-function '1)

(autoload 'anaphoric-+ "anaphora/anaphora" "\
Like `+', but the result of evaluating the previous expression is bound to `it'.

The variable `it' is available within all expressions after the
initial one.

NUMBERS-OR-MARKERS are otherwise as documented for `+'.

\(fn &rest NUMBERS-OR-MARKERS)" nil t)

(autoload 'anaphoric-- "anaphora/anaphora" "\
Like `-', but the result of evaluating the previous expression is bound to `it'.

The variable `it' is available within all expressions after the
initial one.

NUMBER-OR-MARKER and NUMBERS-OR-MARKERS are otherwise as
documented for `-'.

\(fn &optional NUMBER-OR-MARKER &rest NUMBERS-OR-MARKERS)" nil t)

(autoload 'anaphoric-* "anaphora/anaphora" "\
Like `*', but the result of evaluating the previous expression is bound to `it'.

The variable `it' is available within all expressions after the
initial one.

NUMBERS-OR-MARKERS are otherwise as documented for `*'.

\(fn &rest NUMBERS-OR-MARKERS)" nil t)

(autoload 'anaphoric-/ "anaphora/anaphora" "\
Like `/', but the result of evaluating the previous divisor is bound to `it'.

The variable `it' is available within all expressions after the
first divisor.

DIVIDEND, DIVISOR, and DIVISORS are otherwise as documented for `/'.

\(fn DIVIDEND DIVISOR &rest DIVISORS)" nil t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "anaphora/anaphora" '("anaphora-install-font-lock-keywords")))

;;;***

;;;### (autoloads nil "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete/auto-complete" "\
AutoComplete mode

If called interactively, enable Auto-Complete mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(put 'global-auto-complete-mode 'globalized-minor-mode t)

(defvar global-auto-complete-mode nil "\
Non-nil if Global Auto-Complete mode is enabled.
See the `global-auto-complete-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete/auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete/auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global Auto-Complete mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.
See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-complete/auto-complete" '("ac-" "auto-complete-mode")))

;;;***

;;;### (autoloads nil "auto-complete/auto-complete-config" "auto-complete/auto-complete-config.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-complete/auto-complete-config.el

(autoload 'ac-config-default "auto-complete/auto-complete-config" "\
No documentation." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-complete/auto-complete-config" '("ac-")))

;;;***

;;;### (autoloads nil "dash/dash" "dash/dash.el" (0 0 0 0))
;;; Generated autoloads from dash/dash.el

(autoload 'dash-fontify-mode "dash/dash" "\
Toggle fontification of Dash special variables.

If called interactively, enable Dash-Fontify mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp, also
enable the mode if ARG is omitted or nil, and toggle it if ARG is
`toggle'; disable the mode otherwise.

Dash-Fontify mode is a buffer-local minor mode intended for Emacs
Lisp buffers.  Enabling it causes the special variables bound in
anaphoric Dash macros to be fontified.  These anaphoras include
`it', `it-index', `acc', and `other'.  In older Emacs versions
which do not dynamically detect macros, Dash-Fontify mode
additionally fontifies Dash macro calls.

See also `dash-fontify-mode-lighter' and
`global-dash-fontify-mode'.

\(fn &optional ARG)" t nil)

(put 'global-dash-fontify-mode 'globalized-minor-mode t)

(defvar global-dash-fontify-mode nil "\
Non-nil if Global Dash-Fontify mode is enabled.
See the `global-dash-fontify-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-dash-fontify-mode'.")

(custom-autoload 'global-dash-fontify-mode "dash/dash" nil)

(autoload 'global-dash-fontify-mode "dash/dash" "\
Toggle Dash-Fontify mode in all buffers.
With prefix ARG, enable Global Dash-Fontify mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Dash-Fontify mode is enabled in all buffers where
`dash--turn-on-fontify-mode' would do it.
See `dash-fontify-mode' for more information on Dash-Fontify mode.

\(fn &optional ARG)" t nil)

(autoload 'dash-register-info-lookup "dash/dash" "\
Register the Dash Info manual with `info-lookup-symbol'.
This allows Dash symbols to be looked up with \\[info-lookup-symbol]." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dash/dash" '("!cdr" "!cons" "--" "->" "-a" "-butlast" "-c" "-d" "-e" "-f" "-gr" "-i" "-juxt" "-keep" "-l" "-m" "-no" "-o" "-p" "-r" "-s" "-t" "-u" "-value-to-list" "-when-let" "-zip" "dash-")))

;;;***

;;;### (autoloads nil "deferred/concurrent" "deferred/concurrent.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from deferred/concurrent.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "deferred/concurrent" '("cc:")))

;;;***

;;;### (autoloads nil "deferred/deferred" "deferred/deferred.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from deferred/deferred.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "deferred/deferred" '("deferred:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-cell" "ein/lisp/ein-cell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-cell.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-cell" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-classes" "ein/lisp/ein-classes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-classes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-classes" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-contents-api" "ein/lisp/ein-contents-api.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-contents-api.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-contents-api" '("*ein:content-hierarchy*" "ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-core" "ein/lisp/ein-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-core" '("*ein:" "ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-dev" "ein/lisp/ein-dev.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ein/lisp/ein-dev.el

(autoload 'ein:dev-start-debug "ein/lisp/ein-dev" "\
Start logging a bunch of stuff." t nil)

(autoload 'ein:dev-stop-debug "ein/lisp/ein-dev" "\
Inverse of `ein:dev-start-debug'.
Impossible to maintain because it needs to match start." t nil)

(autoload 'ein:dev-bug-report-template "ein/lisp/ein-dev" "\
Open a buffer with bug report template." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-dev" '("ein:dev-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-events" "ein/lisp/ein-events.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-events.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-events" '("ein:events-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-file" "ein/lisp/ein-file.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-file.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-file" '("*ein:file-buffername-template*" "ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-gat" "ein/lisp/ein-gat.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ein/lisp/ein-gat.el

(autoload 'ein:gat-create "ein/lisp/ein-gat" "\


\(fn &optional REFRESH)" t nil)

(autoload 'ein:gat-run-local-batch "ein/lisp/ein-gat" "\


\(fn &optional REFRESH)" t nil)

(autoload 'ein:gat-run-local "ein/lisp/ein-gat" "\


\(fn &optional REFRESH)" t nil)

(autoload 'ein:gat-run-remote-batch "ein/lisp/ein-gat" "\


\(fn &optional REFRESH)" t nil)

(autoload 'ein:gat-run-remote "ein/lisp/ein-gat" "\


\(fn &optional REFRESH)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-gat" '("ein:gat-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-ipdb" "ein/lisp/ein-ipdb.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-ipdb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-ipdb" '("*ein:ipdb-sessions*" "ein:ipdb-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-ipynb-mode" "ein/lisp/ein-ipynb-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-ipynb-mode.el

(autoload 'ein:ipynb-mode "ein/lisp/ein-ipynb-mode" "\
A simple mode for ipynb file.

\\{ein:ipynb-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ipynb\\'" . ein:ipynb-mode))

;;;***

;;;### (autoloads nil "ein/lisp/ein-jupyter" "ein/lisp/ein-jupyter.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-jupyter.el

(autoload 'ein:jupyter-crib-token "ein/lisp/ein-jupyter" "\
Shell out to jupyter for its credentials knowledge.  Return list
of (PASSWORD TOKEN).

\(fn URL-OR-PORT)" nil nil)

(autoload 'ein:jupyter-crib-running-servers "ein/lisp/ein-jupyter" "\
Shell out to jupyter for running servers." nil nil)

(autoload 'ein:jupyter-server-start "ein/lisp/ein-jupyter" "\
Start SERVER-COMMAND with `--notebook-dir' NOTEBOOK-DIRECTORY.

Login after connection established unless NO-LOGIN-P is set.
LOGIN-CALLBACK takes two arguments, the buffer created by
`ein:notebooklist-open--finish', and the url-or-port argument
of `ein:notebooklist-open*'.

With \\[universal-argument] prefix arg, prompt the user for the
server command.

\(fn SERVER-COMMAND NOTEBOOK-DIRECTORY &optional NO-LOGIN-P LOGIN-CALLBACK PORT)" t nil)

(defalias 'ein:run 'ein:jupyter-server-start)

(defalias 'ein:stop 'ein:jupyter-server-stop)

(autoload 'ein:jupyter-server-stop "ein/lisp/ein-jupyter" "\


\(fn &optional ASK-P URL-OR-PORT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-jupyter" '("*ein:jupyter-server-" "ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-kernel" "ein/lisp/ein-kernel.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-kernel.el

(defalias 'ein:kernel-url-or-port 'ein:$kernel-url-or-port)

(defalias 'ein:kernel-id 'ein:$kernel-kernel-id)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-kernel" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-kernelinfo" "ein/lisp/ein-kernelinfo.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-kernelinfo.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-kernelinfo" '("ein:kernelinfo")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-kill-ring" "ein/lisp/ein-kill-ring.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-kill-ring.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-kill-ring" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-log" "ein/lisp/ein-log.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ein/lisp/ein-log.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-log" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-markdown-mode" "ein/lisp/ein-markdown-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-markdown-mode.el

(autoload 'ein:markdown-mode "ein/lisp/ein-markdown-mode" "\
Major mode for editing ein:markdown files.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-markdown-mode" '("defun-markdown-" "ein:markdown")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-node" "ein/lisp/ein-node.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-node.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-node" '("ein:node-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-notebook" "ein/lisp/ein-notebook.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-notebook.el

(defalias 'ein:notebook-name 'ein:$notebook-notebook-name)

(autoload 'ein:notebook-jump-to-opened-notebook "ein/lisp/ein-notebook" "\
List all opened notebook buffers and switch to one that the user selects.

\(fn NOTEBOOK)" t nil)

(autoload 'ein:notebook-open "ein/lisp/ein-notebook" "\
Returns notebook at URL-OR-PORT/PATH.

Note that notebook sends for its contents and won't have them right away.

After the notebook is opened, CALLBACK is called as::

  (funcall CALLBACK notebook created)

where `created' indicates a new notebook or an existing one.

\(fn URL-OR-PORT PATH &optional KERNELSPEC CALLBACK ERRBACK NO-POP)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-notebook" '("*ein:notebook--pending-query*" "ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-notebooklist" "ein/lisp/ein-notebooklist.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-notebooklist.el

(autoload 'ein:notebooklist-reload "ein/lisp/ein-notebooklist" "\
Reload current Notebook list.

\(fn &optional NBLIST RESYNC CALLBACK)" t nil)

(autoload 'ein:notebooklist-new-notebook "ein/lisp/ein-notebooklist" "\


\(fn URL-OR-PORT KERNELSPEC &optional CALLBACK NO-POP RETRY EXPLICIT-PATH)" t nil)

(autoload 'ein:notebooklist-new-notebook-with-name "ein/lisp/ein-notebooklist" "\
Upon notebook-open, rename the notebook, then funcall CALLBACK.

\(fn URL-OR-PORT KERNELSPEC NAME &optional CALLBACK NO-POP)" t nil)

(autoload 'ein:notebooklist-list-paths "ein/lisp/ein-notebooklist" "\
Return all files of CONTENT-TYPE for all sessions

\(fn &optional CONTENT-TYPE)" nil nil)

(autoload 'ein:notebooklist-load "ein/lisp/ein-notebooklist" "\
Load notebook list but do not pop-up the notebook list buffer.

For example, if you want to load notebook list when Emacs starts,
add this in the Emacs initialization file::

  (add-to-hook 'after-init-hook 'ein:notebooklist-load)

or even this (if you want fast Emacs start-up)::

  ;; load notebook list if Emacs is idle for 3 sec after start-up
  (run-with-idle-timer 3 nil #'ein:notebooklist-load)

\(fn &optional URL-OR-PORT)" nil nil)

(autoload 'ein:notebooklist-open "ein/lisp/ein-notebooklist" "\
This is now an alias for `ein:notebooklist-login'.

\(fn URL-OR-PORT CALLBACK)" t nil)

(defalias 'ein:login 'ein:notebooklist-login)

(autoload 'ein:notebooklist-login "ein/lisp/ein-notebooklist" "\
Deal with security before main entry of ein:notebooklist-open*.
CALLBACK takes two arguments, the buffer created by
ein:notebooklist-open--success and the url-or-port argument of
ein:notebooklist-open*.

\(fn URL-OR-PORT CALLBACK &optional COOKIE-NAME COOKIE-CONTENT TOKEN)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-notebooklist" '("ein:" "generate-breadcrumbs" "render-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-notification" "ein/lisp/ein-notification.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-notification.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-notification" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-output-area" "ein/lisp/ein-output-area.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-output-area.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-output-area" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-pager" "ein/lisp/ein-pager.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-pager.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-pager" '("ein:pager-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-process" "ein/lisp/ein-process.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-process.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-process" '("ein:process-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-python-send" "ein/lisp/ein-python-send.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-python-send.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-python-send" '("ein:python-send-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-pytools" "ein/lisp/ein-pytools.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-pytools.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-pytools" '("ein:pytools-jump-")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-query" "ein/lisp/ein-query.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-query.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-query" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-scratchsheet" "ein/lisp/ein-scratchsheet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-scratchsheet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-scratchsheet" '("ein:scratchsheet")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-shared-output" "ein/lisp/ein-shared-output.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-shared-output.el

(autoload 'ein:shared-output-pop-to-buffer "ein/lisp/ein-shared-output" "\
Open shared output buffer." t nil)

(autoload 'ein:shared-output-show-code-cell-at-point "ein/lisp/ein-shared-output" "\
Show code cell at point in shared-output buffer.
It is useful when the output of the cell at point is truncated.
See also `ein:cell-max-num-outputs'." t nil)

(autoload 'ein:shared-output-eval-string "ein/lisp/ein-shared-output" "\
Entry to `ein:cell-execute-internal' from the shared output cell.

\(fn KERNEL CODE &rest ARGS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-shared-output" '("*ein:shared-output*" "ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-traceback" "ein/lisp/ein-traceback.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-traceback.el

(autoload 'ein:tb-show "ein/lisp/ein-traceback" "\
Show full traceback in traceback viewer." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-traceback" '("ein:t")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-utils" "ein/lisp/ein-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-utils" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-websocket" "ein/lisp/ein-websocket.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-websocket.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-websocket" '("ein:")))

;;;***

;;;### (autoloads nil "ein/lisp/ein-worksheet" "ein/lisp/ein-worksheet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/ein-worksheet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ein-worksheet" '("ein:" "hof-add")))

;;;***

;;;### (autoloads nil "ein/lisp/ob-ein" "ein/lisp/ob-ein.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from ein/lisp/ob-ein.el

(when (featurep 'org) (let* ((orig (get 'org-babel-load-languages 'custom-type)) (orig-cdr (cdr orig)) (choices (plist-get orig-cdr :key-type))) (push '(const :tag "Ein" ein) (nthcdr 1 choices)) (put 'org-babel-load-languages 'custom-type (cons (car orig) (plist-put orig-cdr :key-type choices)))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/ob-ein" '("*ob-ein-sentinel*" "ob-ein-")))

;;;***

;;;### (autoloads nil "ein/lisp/poly-ein" "ein/lisp/poly-ein.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ein/lisp/poly-ein.el
 (autoload 'poly-ein-mode "poly-ein")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ein/lisp/poly-ein" '("pm-" "poly-ein-")))

;;;***

;;;### (autoloads nil "el-get/el-get" "el-get/el-get.el" (0 0 0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code." t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring." t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-autoloading" "el-get/el-get-autoloading.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-autoloading.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-autoloading" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-build" "el-get/el-get-build.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-build.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-build" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-bundle" "el-get/el-get-bundle.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC SYNC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The property list may include the keyword
`:bundle-sync' with a value of either `t' or `nil' to request that
`el-get-bundle' invoke `el-get' synchronously (respectively asynchronously).
The keyword `:bundle-async' is the inverse of `:bundle-sync'.
\(Note that the request to run el-get synchronously may not be respected in all
circumstances: see the definition of `el-get-bundle-el-get' for details.)
The FORM after the property list is treated as initialization code,
which is actually an `:after' property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(function-put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(function-put 'el-get-bundle! 'lisp-indent-function 'defun)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-bundle" '("el-get-bundle-")))

;;;***

;;;### (autoloads nil "el-get/el-get-byte-compile" "el-get/el-get-byte-compile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-byte-compile.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-byte-compile" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-check.el

(autoload 'el-get-check-recipe "el-get/el-get-check" "\
Check the format of the recipe.
Please run this command before sending a pull request.
Usage: M-x el-get-check-recipe RET

You can run this function from checker script like this:
    test/check-recipe.el PATH/TO/RECIPE.rcp

When used as a lisp function, FILE-OR-BUFFER must be a buffer
object or a file path.

\(fn FILE-OR-BUFFER)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-check" '("el-get-check-")))

;;;***

;;;### (autoloads nil "el-get/el-get-core" "el-get/el-get-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-core" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-custom" "el-get/el-get-custom.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-custom.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-custom" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-dependencies" "el-get/el-get-dependencies.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-dependencies.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-dependencies" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-list-packages" "el-get/el-get-list-packages.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-list-packages" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-methods" "el-get/el-get-methods.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-methods.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-methods" '("el-get-insecure-check")))

;;;***

;;;### (autoloads nil "el-get/el-get-notify" "el-get/el-get-notify.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-notify.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-notify" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-recipes" "el-get/el-get-recipes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-recipes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-recipes" '("el-get-")))

;;;***

;;;### (autoloads nil "el-get/el-get-status" "el-get/el-get-status.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from el-get/el-get-status.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "el-get/el-get-status" '("el-get-")))

;;;***

;;;### (autoloads nil "emacs-async/async" "emacs-async/async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/async.el

(autoload 'async-start-process "emacs-async/async" "\
Start the executable PROGRAM asynchronously named NAME.  See `async-start'.
PROGRAM is passed PROGRAM-ARGS, calling FINISH-FUNC with the
process object when done.  If FINISH-FUNC is nil, the future
object will return the process object when the program is
finished.  Set DEFAULT-DIRECTORY to change PROGRAM's current
working directory.

\(fn NAME PROGRAM FINISH-FUNC &rest PROGRAM-ARGS)" nil nil)

(autoload 'async-start "emacs-async/async" "\
Execute START-FUNC (often a lambda) in a subordinate Emacs process.
When done, the return value is passed to FINISH-FUNC.  Example:

    (async-start
       ;; What to do in the child process
       (lambda ()
         (message \"This is a test\")
         (sleep-for 3)
         222)

       ;; What to do when it finishes
       (lambda (result)
         (message \"Async process done, result should be 222: %s\"
                  result)))

If FINISH-FUNC is nil or missing, a future is returned that can
be inspected using `async-get', blocking until the value is
ready.  Example:

    (let ((proc (async-start
                   ;; What to do in the child process
                   (lambda ()
                     (message \"This is a test\")
                     (sleep-for 3)
                     222))))

        (message \"I'm going to do some work here\") ;; ....

        (message \"Waiting on async process, result should be 222: %s\"
                 (async-get proc)))

If you don't want to use a callback, and you don't care about any
return value from the child process, pass the `ignore' symbol as
the second argument (if you don't, and never call `async-get', it
will leave *emacs* process buffers hanging around):

    (async-start
     (lambda ()
       (delete-file \"a remote file on a slow link\" nil))
     \\='ignore)

Special case:
If the output of START-FUNC is a string with properties
e.g. (buffer-string) RESULT will be transformed in a list where the
car is the string itself (without props) and the cdr the rest of
properties, this allows using in FINISH-FUNC the string without
properties and then apply the properties in cdr to this string (if
needed).
Properties handling special objects like markers are returned as
list to allow restoring them later.
See <https://github.com/jwiegley/emacs-async/issues/145> for more infos.

Note: Even when FINISH-FUNC is present, a future is still
returned except that it yields no value (since the value is
passed to FINISH-FUNC).  Call `async-get' on such a future always
returns nil.  It can still be useful, however, as an argument to
`async-ready' or `async-wait'.

\(fn START-FUNC &optional FINISH-FUNC)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emacs-async/async" '("async-")))

;;;***

;;;### (autoloads nil "emacs-async/async-bytecomp" "emacs-async/async-bytecomp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/async-bytecomp.el

(autoload 'async-byte-recompile-directory "emacs-async/async-bytecomp" "\
Compile all *.el files in DIRECTORY asynchronously.
All *.elc files are systematically deleted before proceeding.

\(fn DIRECTORY &optional QUIET)" nil nil)

(defvar async-bytecomp-package-mode nil "\
Non-nil if Async-Bytecomp-Package mode is enabled.
See the `async-bytecomp-package-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `async-bytecomp-package-mode'.")

(custom-autoload 'async-bytecomp-package-mode "emacs-async/async-bytecomp" nil)

(autoload 'async-bytecomp-package-mode "emacs-async/async-bytecomp" "\
Byte compile asynchronously packages installed with package.el.
Async compilation of packages can be controlled by
`async-bytecomp-allowed-packages'.

If called interactively, enable Async-Bytecomp-Package mode if
ARG is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'async-byte-compile-file "emacs-async/async-bytecomp" "\
Byte compile Lisp code FILE asynchronously.

Same as `byte-compile-file' but asynchronous.

\(fn FILE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emacs-async/async-bytecomp" '("async-")))

;;;***

;;;### (autoloads nil "emacs-async/async-test" "emacs-async/async-test.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/async-test.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emacs-async/async-test" '("async-test-")))

;;;***

;;;### (autoloads nil "emacs-async/dired-async" "emacs-async/dired-async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/dired-async.el

(defvar dired-async-mode nil "\
Non-nil if Dired-Async mode is enabled.
See the `dired-async-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `dired-async-mode'.")

(custom-autoload 'dired-async-mode "emacs-async/dired-async" nil)

(autoload 'dired-async-mode "emacs-async/dired-async" "\
Do dired actions asynchronously.

If called interactively, enable Dired-Async mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-copy "emacs-async/dired-async" "\
Run ‘dired-do-copy’ asynchronously.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-symlink "emacs-async/dired-async" "\
Run ‘dired-do-symlink’ asynchronously.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-hardlink "emacs-async/dired-async" "\
Run ‘dired-do-hardlink’ asynchronously.

\(fn &optional ARG)" t nil)

(autoload 'dired-async-do-rename "emacs-async/dired-async" "\
Run ‘dired-do-rename’ asynchronously.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emacs-async/dired-async" '("dired-async-")))

;;;***

;;;### (autoloads nil "emacs-async/smtpmail-async" "emacs-async/smtpmail-async.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from emacs-async/smtpmail-async.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "emacs-async/smtpmail-async" '("async-smtpmail-")))

;;;***

;;;### (autoloads nil "epl/epl" "epl/epl.el" (0 0 0 0))
;;; Generated autoloads from epl/epl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "epl/epl" '("epl-")))

;;;***

;;;### (autoloads nil "flycheck/flycheck" "flycheck/flycheck.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck.el

(autoload 'flycheck-manual "flycheck/flycheck" "\
Open the Flycheck manual." t nil)

(autoload 'flycheck-mode "flycheck/flycheck" "\
Flycheck is a minor mode for on-the-fly syntax checking.

In `flycheck-mode' the buffer is automatically syntax-checked
using the first suitable syntax checker from `flycheck-checkers'.
Use `flycheck-select-checker' to select a checker for the current
buffer manually.

If you run into issues, use `\\[flycheck-verify-setup]' to get help.

Flycheck supports many languages out of the box, and many
additional ones are available on MELPA.  Adding new ones is very
easy.  Complete documentation is available online at URL
`https://www.flycheck.org/en/latest/'.  Please report issues and
request features at URL `https://github.com/flycheck/flycheck'.

Flycheck displays its status in the mode line.  In the default
configuration, it looks like this:

`FlyC'     This buffer has not been checked yet.
`FlyC-'    Flycheck doesn't have a checker for this buffer.
`FlyC*'    Flycheck is running.  Expect results soon!
`FlyC:3|2' This buffer contains three warnings and two errors.
           Use `\\[flycheck-list-errors]' to see the list.

You may also see the following icons:
`FlyC!'    The checker crashed.
`FlyC.'    The last syntax check was manually interrupted.
`FlyC?'    The checker did something unexpected, like exiting with 1
           but returning no errors.

The following keybindings are available in `flycheck-mode':

\\{flycheck-mode-map}
\(you can change the prefix by customizing
`flycheck-keymap-prefix')

If called interactively, enable Flycheck mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is ‘toggle’; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(put 'global-flycheck-mode 'globalized-minor-mode t)

(defvar global-flycheck-mode nil "\
Non-nil if Global Flycheck mode is enabled.
See the `global-flycheck-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-flycheck-mode'.")

(custom-autoload 'global-flycheck-mode "flycheck/flycheck" nil)

(autoload 'global-flycheck-mode "flycheck/flycheck" "\
Toggle Flycheck mode in all buffers.
With prefix ARG, enable Global Flycheck mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Flycheck mode is enabled in all buffers where
`flycheck-mode-on-safe' would do it.
See `flycheck-mode' for more information on Flycheck mode.

\(fn &optional ARG)" t nil)

(autoload 'flycheck-define-error-level "flycheck/flycheck" "\
Define a new error LEVEL with PROPERTIES.

The following PROPERTIES constitute an error level:

`:severity SEVERITY'
     A number denoting the severity of this level.  The higher
     the number, the more severe is this level compared to other
     levels.  Defaults to 0; info is -10, warning is 10, and
     error is 100.

     The severity is used by `flycheck-error-level-<' to
     determine the ordering of errors according to their levels.

`:compilation-level LEVEL'

     A number indicating the broad class of messages that errors
     at this level belong to: one of 0 (info), 1 (warning), or
     2 or nil (error).  Defaults to nil.

     This is used by `flycheck-checker-pattern-to-error-regexp'
     to map error levels into `compilation-mode''s hierarchy and
     to get proper highlighting of errors in `compilation-mode'.

`:overlay-category CATEGORY'
     A symbol denoting the overlay category to use for error
     highlight overlays for this level.  See Info
     node `(elisp)Overlay Properties' for more information about
     overlay categories.

     A category for an error level overlay should at least define
     the `face' property, for error highlighting.  Another useful
     property for error level categories is `priority', to
     influence the stacking of multiple error level overlays.

`:fringe-bitmap BITMAPS'
     A fringe bitmap symbol denoting the bitmap to use for fringe
     indicators for this level, or a cons of two bitmaps (one for
     narrow fringes and one for wide fringes).  See Info node
     `(elisp)Fringe Bitmaps' for more information about fringe
     bitmaps, including a list of built-in fringe bitmaps.

`:fringe-face FACE'
     A face symbol denoting the face to use for fringe indicators
     for this level.

`:margin-spec SPEC'
     A display specification indicating what to display in the
     margin when `flycheck-indication-mode' is `left-margin' or
     `right-margin'.  See Info node `(elisp)Displaying in the
     Margins'.  If omitted, Flycheck generates an image spec from
     the fringe bitmap.

`:error-list-face FACE'
     A face symbol denoting the face to use for messages of this
     level in the error list.  See `flycheck-list-errors'.

\(fn LEVEL &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-error-level 'lisp-indent-function '1)

(autoload 'flycheck-define-command-checker "flycheck/flycheck" "\
Define SYMBOL as syntax checker to run a command.

Define SYMBOL as generic syntax checker via
`flycheck-define-generic-checker', which uses an external command
to check the buffer.  SYMBOL and DOCSTRING are the same as for
`flycheck-define-generic-checker'.

In addition to the properties understood by
`flycheck-define-generic-checker', the following PROPERTIES
constitute a command syntax checker.  Unless otherwise noted, all
properties are mandatory.  Note that the default `:error-filter'
of command checkers is `flycheck-sanitize-errors'.

`:command COMMAND'
     The command to run for syntax checking.

     COMMAND is a list of the form `(EXECUTABLE [ARG ...])'.

     EXECUTABLE is a string with the executable of this syntax
     checker.  It can be overridden with the variable
     `flycheck-SYMBOL-executable'.  Note that this variable is
     NOT implicitly defined by this function.  Use
     `flycheck-def-executable-var' to define this variable.

     Each ARG is an argument to the executable, either as string,
     or as special symbol or form for
     `flycheck-substitute-argument', which see.

`:error-patterns PATTERNS'
     A list of patterns to parse the output of the `:command'.

     Each ITEM in PATTERNS is a list `(LEVEL SEXP ...)', where
     LEVEL is a Flycheck error level (see
     `flycheck-define-error-level'), followed by one or more RX
     `SEXP's which parse an error of that level and extract line,
     column, file name and the message.

     See `rx' for general information about RX, and
     `flycheck-rx-to-string' for some special RX forms provided
     by Flycheck.

     All patterns are applied in the order of declaration to the
     whole output of the syntax checker.  Output already matched
     by a pattern will not be matched by subsequent patterns.  In
     other words, the first pattern wins.

     This property is optional.  If omitted, however, an
     `:error-parser' is mandatory.

`:error-parser FUNCTION'
     A function to parse errors with.

     The function shall accept three arguments OUTPUT CHECKER
     BUFFER.  OUTPUT is the syntax checker output as string,
     CHECKER the syntax checker that was used, and BUFFER a
     buffer object representing the checked buffer.  The function
     must return a list of `flycheck-error' objects parsed from
     OUTPUT.

     This property is optional.  If omitted, it defaults to
     `flycheck-parse-with-patterns'.  In this case,
     `:error-patterns' is mandatory.

`:standard-input t'
     Whether to send the buffer contents on standard input.

     If this property is given and has a non-nil value, send the
     contents of the buffer on standard input.

     Defaults to nil.

Note that you may not give `:start', `:interrupt', and
`:print-doc' for a command checker.  You can give a custom
`:verify' function, though, whose results will be appended to the
default `:verify' function of command checkers.

\(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil nil)

(function-put 'flycheck-define-command-checker 'lisp-indent-function '1)

(function-put 'flycheck-define-command-checker 'doc-string-elt '2)

(autoload 'flycheck-def-config-file-var "flycheck/flycheck" "\
Define SYMBOL as config file variable for CHECKER, with default FILE-NAME.

SYMBOL is declared as customizable variable using `defcustom', to
provide configuration files for the given syntax CHECKER.
CUSTOM-ARGS are forwarded to `defcustom'.

FILE-NAME is the initial value of the new variable.  If omitted,
the default value is nil.  It can be either a string or a list of
strings.

Use this together with the `config-file' form in the `:command'
argument to `flycheck-define-checker'.

\(fn SYMBOL CHECKER &optional FILE-NAME &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-config-file-var 'lisp-indent-function '3)

(autoload 'flycheck-def-option-var "flycheck/flycheck" "\
Define SYMBOL as option variable with INIT-VALUE for CHECKER.

SYMBOL is declared as customizable variable using `defcustom', to
provide an option for the given syntax CHECKERS (a checker or a
list of checkers).  INIT-VALUE is the initial value of the
variable, and DOCSTRING is its docstring.  CUSTOM-ARGS are
forwarded to `defcustom'.

Use this together with the `option', `option-list' and
`option-flag' forms in the `:command' argument to
`flycheck-define-checker'.

\(fn SYMBOL INIT-VALUE CHECKERS DOCSTRING &rest CUSTOM-ARGS)" nil t)

(function-put 'flycheck-def-option-var 'lisp-indent-function '3)

(function-put 'flycheck-def-option-var 'doc-string-elt '4)

(autoload 'flycheck-define-checker "flycheck/flycheck" "\
Define SYMBOL as command syntax checker with DOCSTRING and PROPERTIES.

Like `flycheck-define-command-checker', but PROPERTIES must not
be quoted.  Also, implicitly define the executable variable for
SYMBOL with `flycheck-def-executable-var'.

\(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil t)

(function-put 'flycheck-define-checker 'lisp-indent-function '1)

(function-put 'flycheck-define-checker 'doc-string-elt '2)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck/flycheck" '("flycheck-" "help-flycheck-checker-d" "list-flycheck-errors")))

;;;***

;;;### (autoloads nil "flycheck/flycheck-buttercup" "flycheck/flycheck-buttercup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck-buttercup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck/flycheck-buttercup" '("flycheck-buttercup-format-error-list")))

;;;***

;;;### (autoloads nil "flycheck/flycheck-ert" "flycheck/flycheck-ert.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from flycheck/flycheck-ert.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flycheck/flycheck-ert" '("flycheck-er")))

;;;***

;;;### (autoloads nil "fuzzy/fuzzy" "fuzzy/fuzzy.el" (0 0 0 0))
;;; Generated autoloads from fuzzy/fuzzy.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "fuzzy/fuzzy" '("fuzzy-" "turn-o")))

;;;***

;;;### (autoloads nil "helm-ag/helm-ag" "helm-ag/helm-ag.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from helm-ag/helm-ag.el

(autoload 'helm-ag-pop-stack "helm-ag/helm-ag" "\
Not documented." t nil)

(autoload 'helm-ag-clear-stack "helm-ag/helm-ag" "\
Not documented." t nil)

(autoload 'helm-ag-this-file "helm-ag/helm-ag" "\
Do ag with in this file with QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-ag "helm-ag/helm-ag" "\
Do ag with in BASEDIR and with QUERY.

\(fn &optional BASEDIR QUERY)" t nil)

(autoload 'helm-do-ag-this-file "helm-ag/helm-ag" "\
Not documented, QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-do-ag "helm-ag/helm-ag" "\
Not documented, BASEDIR, TARGETS, DEFAULT-INPUT.

\(fn &optional BASEDIR TARGETS DEFAULT-INPUT)" t nil)

(autoload 'helm-ag-project-root "helm-ag/helm-ag" "\
Not documented, QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-do-ag-project-root "helm-ag/helm-ag" "\
Not documented, QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-ag-buffers "helm-ag/helm-ag" "\
Not documented, QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'helm-do-ag-buffers "helm-ag/helm-ag" "\
Not documented, QUERY.

\(fn &optional QUERY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "helm-ag/helm-ag" '("helm-")))

;;;***

;;;### (autoloads nil "helm-projectile/helm-projectile" "helm-projectile/helm-projectile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from helm-projectile/helm-projectile.el

(defvar helm-projectile-fuzzy-match t "\
Enable fuzzy matching for Helm Projectile commands.
This needs to be set before loading helm-projectile.el.")

(custom-autoload 'helm-projectile-fuzzy-match "helm-projectile/helm-projectile" t)

(autoload 'helm-projectile-find-file-dwim "helm-projectile/helm-projectile" "\
Find file at point based on context." t nil)

(autoload 'helm-projectile-find-other-file "helm-projectile/helm-projectile" "\
Switch between files with the same name but different extensions using Helm.
With FLEX-MATCHING, match any file that contains the base name of
current file.  Other file extensions can be customized with the
variable `projectile-other-file-alist'.

\(fn &optional FLEX-MATCHING)" t nil)

(autoload 'helm-projectile-on "helm-projectile/helm-projectile" "\
Turn on `helm-projectile' key bindings." t nil)

(autoload 'helm-projectile-off "helm-projectile/helm-projectile" "\
Turn off `helm-projectile' key bindings." t nil)

(autoload 'helm-projectile-grep "helm-projectile/helm-projectile" "\
Helm version of `projectile-grep'.
DIR is the project root, if not set then current directory is used

\(fn &optional DIR)" t nil)

(autoload 'helm-projectile-ack "helm-projectile/helm-projectile" "\
Helm version of projectile-ack.

\(fn &optional DIR)" t nil)

(autoload 'helm-projectile-ag "helm-projectile/helm-projectile" "\
Helm version of `projectile-ag'.

\(fn &optional OPTIONS)" t nil)

(autoload 'helm-projectile-rg "helm-projectile/helm-projectile" "\
Projectile version of `helm-rg'." t nil)

(autoload 'helm-projectile-toggle "helm-projectile/helm-projectile" "\
Toggle Helm version of Projectile commands.

\(fn TOGGLE)" nil nil)

(autoload 'helm-projectile "helm-projectile/helm-projectile" "\
Use projectile with Helm instead of ido.

With a prefix ARG invalidates the cache first.
If invoked outside of a project, displays a list of known projects to jump.

\(fn &optional ARG)" t nil)

(eval-after-load 'projectile '(progn (define-key projectile-command-map (kbd "h") #'helm-projectile)))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "helm-projectile/helm-projectile" '("glob-quote" "helm-")))

;;;***

;;;### (autoloads nil "js2-mode/js2-imenu-extras" "js2-mode/js2-imenu-extras.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from js2-mode/js2-imenu-extras.el

(autoload 'js2-imenu-extras-setup "js2-mode/js2-imenu-extras" nil nil nil)

(autoload 'js2-imenu-extras-mode "js2-mode/js2-imenu-extras" "\
Toggle Imenu support for frameworks and structural patterns.

If called interactively, enable Js2-Imenu-Extras mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "js2-mode/js2-imenu-extras" '("js2-imenu-")))

;;;***

;;;### (autoloads nil "js2-mode/js2-mode" "js2-mode/js2-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from js2-mode/js2-mode.el

(autoload 'js2-highlight-unused-variables-mode "js2-mode/js2-mode" "\
Toggle highlight of unused variables.

If called interactively, enable Js2-Highlight-Unused-Variables
mode if ARG is positive, and disable it if ARG is zero or
negative.  If called from Lisp, also enable the mode if ARG is
omitted or nil, and toggle it if ARG is `toggle'; disable the
mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'js2-minor-mode "js2-mode/js2-mode" "\
Minor mode for running js2 as a background linter.
This allows you to use a different major mode for JavaScript editing,
such as `js-mode', while retaining the asynchronous error/warning
highlighting features of `js2-mode'.

If called interactively, enable Js2 minor mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'js2-mode "js2-mode/js2-mode" "\
Major mode for editing JavaScript code.

\(fn)" t nil)

(autoload 'js2-jsx-mode "js2-mode/js2-mode" "\
Major mode for editing JSX code in Emacs 26 and earlier.

To edit JSX code in Emacs 27, use `js-mode' as your major mode
with `js2-minor-mode' enabled.

To customize the indentation for this mode, set the SGML offset
variables (`sgml-basic-offset' et al) locally, like so:

  (defun set-jsx-indentation ()
    (setq-local sgml-basic-offset js2-basic-offset))
  (add-hook \\='js2-jsx-mode-hook #\\='set-jsx-indentation)

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "js2-mode/js2-mode" '("js2-")))

;;;***

;;;### (autoloads nil "js2-mode/js2-old-indent" "js2-mode/js2-old-indent.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from js2-mode/js2-old-indent.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "js2-mode/js2-old-indent" '("js2-")))

;;;***

;;;### (autoloads nil "markdown-mode/markdown-mode" "markdown-mode/markdown-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode/markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

(autoload 'markdown-view-mode "markdown-mode/markdown-mode" "\
Major mode for viewing Markdown content.

\(fn)" t nil)

(autoload 'gfm-view-mode "markdown-mode/markdown-mode" "\
Major mode for viewing GitHub Flavored Markdown content.

\(fn)" t nil)

(autoload 'markdown-live-preview-mode "markdown-mode/markdown-mode" "\
Toggle native previewing on save for a specific markdown file.

If called interactively, enable Markdown-Live-Preview mode if ARG
is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "markdown-mode/markdown-mode" '("defun-markdown-" "gfm-" "markdown")))

;;;***

;;;### (autoloads nil "pkg-info/pkg-info" "pkg-info/pkg-info.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from pkg-info/pkg-info.el

(autoload 'pkg-info-library-original-version "pkg-info/pkg-info" "\
Get the original version in the header of LIBRARY.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no X-Original-Version
header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-library-version "pkg-info/pkg-info" "\
Get the version in the header of LIBRARY.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no proper header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-original-version "pkg-info/pkg-info" "\
Get the original version of the library defining FUNCTION.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-version "pkg-info/pkg-info" "\
Get the version of the library defining FUNCTION.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-package-version "pkg-info/pkg-info" "\
Get the version of an installed PACKAGE.

If SHOW is non-nil, show the version in the minibuffer.

Return the version as list, or nil if PACKAGE is not installed.

\(fn PACKAGE &optional SHOW)" t nil)

(autoload 'pkg-info-version-info "pkg-info/pkg-info" "\
Obtain complete version info for LIBRARY and PACKAGE.

LIBRARY is a symbol denoting a named feature, or a library name
as string.  PACKAGE is a symbol denoting an ELPA package.  If
omitted or nil, default to LIBRARY.

If SHOW is non-nil, show the version in the minibuffer.

When called interactively, prompt for LIBRARY.  When called
interactively with prefix argument, prompt for PACKAGE as well.

Return a string with complete version information for LIBRARY.
This version information contains the version from the headers of
LIBRARY, and the version of the installed PACKAGE, the LIBRARY is
part of.  If PACKAGE is not installed, or if the PACKAGE version
is the same as the LIBRARY version, do not include a package
version.

\(fn LIBRARY &optional PACKAGE SHOW)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pkg-info/pkg-info" '("pkg-info-")))

;;;***

;;;### (autoloads nil "polymode/poly-lock" "polymode/poly-lock.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/poly-lock.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/poly-lock" '("poly-lock-")))

;;;***

;;;### (autoloads nil "polymode/polymode" "polymode/polymode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode.el

(autoload 'define-polymode "polymode/polymode" "\
Define a new polymode MODE.
This macro defines command MODE and an indicator variable MODE
which becomes t when MODE is active and nil otherwise.

MODE command can be used as both major and minor mode. Using
polymodes as minor modes makes sense when :hostmode (see below)
is not specified, in which case polymode installs only inner
modes and doesn't touch current major mode.

Standard hook MODE-hook is run at the end of the initialization
of each polymode buffer (both indirect and base buffers).

This macro also defines the MODE-map keymap from the :keymap
argument and PARENT-map (see below) and poly-[MODE-NAME]-polymode
variable which holds an object of class `pm-polymode' which holds
the entire configuration for this polymode.

PARENT is either the polymode configuration object or a polymode
mode (there is 1-to-1 correspondence between config
objects (`pm-polymode') and mode functions). The new polymode
MODE inherits alll the behavior from PARENT except for the
overwrites specified by the keywords (see below). The new MODE
runs all the hooks from the PARENT-mode and inherits its MODE-map
from PARENT-map.

DOC is an optional documentation string. If present PARENT must
be provided, but can be nil.

BODY is executed after the complete initialization of the
polymode but before MODE-hook. It is executed once for each
polymode buffer - host buffer on initialization and every inner
buffer subsequently created.

Before the BODY code keyword arguments (i.e. alternating keywords
and values) are allowed. The following special keywords
controlling the behavior of the new MODE are supported:

:lighter Optional LIGHTER is displayed in the mode line when the
   mode is on. If omitted, it defaults to the :lighter slot of
   CONFIG object.

:keymap If nil, a new MODE-map keymap is created what directly
  inherits from the PARENT's keymap. The last keymap in the
  inheritance chain is always `polymode-minor-mode-map'. If a
  keymap it is used directly as it is. If a list of binding of
  the form (KEY . BINDING) it is merged the bindings are added to
  the newly create keymap.

:after-hook A single form which is evaluated after the mode hooks
  have been run. It should not be quoted.

Other keywords are added to the `pm-polymode' configuration
object and should be valid slots in PARENT config object or the
root config `pm-polymode' object if PARENT is nil. By far the
most frequently used slots are:

:hostmode Symbol pointing to a `pm-host-chunkmode' object
  specifying the behavior of the hostmode. If missing or nil,
  MODE will behave as a minor-mode in the sense that it will
  reuse the currently installed major mode and will install only
  the inner modes.

:innermodes List of symbols pointing to `pm-inner-chunkmode'
  objects which specify the behavior of inner modes (or submodes).

\(fn MODE &optional PARENT DOC &rest BODY)" nil t)

(function-put 'define-polymode 'lisp-indent-function 'defun)

(function-put 'define-polymode 'doc-string-elt '3)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode" '("pm-" "poly")))

;;;***

;;;### (autoloads nil "polymode/polymode-base" "polymode/polymode-base.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-base.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-base" '("poly-")))

;;;***

;;;### (autoloads nil "polymode/polymode-classes" "polymode/polymode-classes.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-classes.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-classes" '("pm-")))

;;;***

;;;### (autoloads nil "polymode/polymode-compat" "polymode/polymode-compat.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-compat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-compat" '("*span*" "pm-" "polymode-")))

;;;***

;;;### (autoloads nil "polymode/polymode-core" "polymode/polymode-core.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-core.el

(defvar-local polymode-default-inner-mode nil "\
Inner mode for chunks with unspecified modes.
Intended to be used as local variable in polymode buffers. A
special value `host' means use the host mode.")

(put 'polymode-default-inner-mode 'safe-local-variable #'symbolp)

(autoload 'define-hostmode "polymode/polymode-core" "\
Define a hostmode with name NAME.
Optional PARENT is a name of a hostmode to be derived (cloned)
from. If missing, the optional documentation string DOC is
generated automatically. KEY-ARGS is a list of key-value pairs.
See the documentation of the class `pm-host-chunkmode' for
possible values.

\(fn NAME &optional PARENT DOC &rest KEY-ARGS)" nil t)

(function-put 'define-hostmode 'doc-string-elt '3)

(function-put 'define-hostmode 'lisp-indent-function 'defun)

(autoload 'define-innermode "polymode/polymode-core" "\
Ddefine an innermode with name NAME.
Optional PARENT is a name of a innermode to be derived (cloned)
from. If missing the optional documentation string DOC is
generated automatically. KEY-ARGS is a list of key-value pairs.
See the documentation of the class `pm-inner-chunkmode' for
possible values.

\(fn NAME &optional PARENT DOC &rest KEY-ARGS)" nil t)

(function-put 'define-innermode 'doc-string-elt '3)

(function-put 'define-innermode 'lisp-indent-function 'defun)

(autoload 'define-auto-innermode "polymode/polymode-core" "\
Ddefine an auto innermode with name NAME.
Optional PARENT is a name of an auto innermode to be
derived (cloned) from. If missing the optional documentation
string DOC is generated automatically. KEY-ARGS is a list of
key-value pairs. See the documentation of the class
`pm-inner-auto-chunkmode' for possible values.

\(fn NAME &optional PARENT DOC &rest KEY-ARGS)" nil t)

(function-put 'define-auto-innermode 'doc-string-elt '3)

(function-put 'define-auto-innermode 'lisp-indent-function 'defun)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-core" '("*span*" "polymode-")))

;;;***

;;;### (autoloads nil "polymode/polymode-debug" "polymode/polymode-debug.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-debug.el

(autoload 'pm-debug-minor-mode "polymode/polymode-debug" "\
Turns on/off useful facilities for debugging polymode.

If called interactively, enable Pm-Debug minor mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

Key bindings:
\\{pm-debug-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'pm-debug-minor-mode-on "polymode/polymode-debug" nil nil nil)

(put 'pm-debug-mode 'globalized-minor-mode t)

(defvar pm-debug-mode nil "\
Non-nil if Pm-Debug mode is enabled.
See the `pm-debug-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pm-debug-mode'.")

(custom-autoload 'pm-debug-mode "polymode/polymode-debug" nil)

(autoload 'pm-debug-mode "polymode/polymode-debug" "\
Toggle Pm-Debug minor mode in all buffers.
With prefix ARG, enable Pm-Debug mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Pm-Debug minor mode is enabled in all buffers where
`pm-debug-minor-mode-on' would do it.
See `pm-debug-minor-mode' for more information on Pm-Debug minor mode.

\(fn &optional ARG)" t nil)

(autoload 'pm-toggle-tracing "polymode/polymode-debug" "\
Toggle polymode tracing.
With numeric prefix toggle tracing for that LEVEL. Currently
universal argument toggles maximum level of tracing (15). See
`pm-traced-functions'. Default level is 4.

\(fn LEVEL)" t nil)

(autoload 'pm-trace "polymode/polymode-debug" "\
Trace function FN.
Use `untrace-function' to untrace or `untrace-all' to untrace all
currently traced functions.

\(fn FN)" t nil)

(autoload 'pm-debug-relevant-variables "polymode/polymode-debug" "\
Get the relevant polymode variables.
If OUT-TYPE is `buffer', print the variables in the dedicated buffer,
if `message' issue a message, if nil just return a list of values.

\(fn &optional OUT-TYPE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-debug" '("pm-")))

;;;***

;;;### (autoloads nil "polymode/polymode-export" "polymode/polymode-export.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-export.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-export" '("pm-" "poly")))

;;;***

;;;### (autoloads nil "polymode/polymode-methods" "polymode/polymode-methods.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-methods.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-methods" '("pm-")))

;;;***

;;;### (autoloads nil "polymode/polymode-test-utils" "polymode/polymode-test-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-test-utils.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-test-utils" '("pm-")))

;;;***

;;;### (autoloads nil "polymode/polymode-weave" "polymode/polymode-weave.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from polymode/polymode-weave.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "polymode/polymode-weave" '("pm-" "polymode-")))

;;;***

;;;### (autoloads nil "popup/popup" "popup/popup.el" (0 0 0 0))
;;; Generated autoloads from popup/popup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "popup/popup" '("popup-")))

;;;***

;;;### (autoloads nil "projectile/projectile" "projectile/projectile.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from projectile/projectile.el

(autoload 'projectile-version "projectile/projectile" "\
Get the Projectile version as string.

If called interactively or if SHOW-VERSION is non-nil, show the
version in the echo area and the messages buffer.

The returned string includes both, the version from package.el
and the library version, if both a present and different.

If the version number could not be determined, signal an error,
if called interactively, or if SHOW-VERSION is non-nil, otherwise
just return nil.

\(fn &optional SHOW-VERSION)" t nil)

(autoload 'projectile-invalidate-cache "projectile/projectile" "\
Remove the current project's files from `projectile-projects-cache'.

With a prefix argument PROMPT prompts for the name of the project whose cache
to invalidate.

\(fn PROMPT)" t nil)

(autoload 'projectile-purge-file-from-cache "projectile/projectile" "\
Purge FILE from the cache of the current project.

\(fn FILE)" t nil)

(autoload 'projectile-purge-dir-from-cache "projectile/projectile" "\
Purge DIR from the cache of the current project.

\(fn DIR)" t nil)

(autoload 'projectile-cache-current-file "projectile/projectile" "\
Add the currently visited file to the cache." t nil)

(autoload 'projectile-discover-projects-in-directory "projectile/projectile" "\
Discover any projects in DIRECTORY and add them to the projectile cache.

If DEPTH is non-nil recursively descend exactly DEPTH levels below DIRECTORY and
discover projects there.

\(fn DIRECTORY &optional DEPTH)" t nil)

(autoload 'projectile-discover-projects-in-search-path "projectile/projectile" "\
Discover projects in `projectile-project-search-path'.
Invoked automatically when `projectile-mode' is enabled." t nil)

(autoload 'projectile-switch-to-buffer "projectile/projectile" "\
Switch to a project buffer." t nil)

(autoload 'projectile-switch-to-buffer-other-window "projectile/projectile" "\
Switch to a project buffer and show it in another window." t nil)

(autoload 'projectile-switch-to-buffer-other-frame "projectile/projectile" "\
Switch to a project buffer and show it in another frame." t nil)

(autoload 'projectile-display-buffer "projectile/projectile" "\
Display a project buffer in another window without selecting it." t nil)

(autoload 'projectile-project-buffers-other-buffer "projectile/projectile" "\
Switch to the most recently selected buffer project buffer.
Only buffers not visible in windows are returned." t nil)

(autoload 'projectile-multi-occur "projectile/projectile" "\
Do a `multi-occur' in the project's buffers.
With a prefix argument, show NLINES of context.

\(fn &optional NLINES)" t nil)

(autoload 'projectile-find-other-file "projectile/projectile" "\
Switch between files with the same name but different extensions.
With FLEX-MATCHING, match any file that contains the base name of current file.
Other file extensions can be customized with the variable
`projectile-other-file-alist'.

\(fn &optional FLEX-MATCHING)" t nil)

(autoload 'projectile-find-other-file-other-window "projectile/projectile" "\
Switch between files with different extensions in other window.
Switch between files with the same name but different extensions in other
window.  With FLEX-MATCHING, match any file that contains the base name of
current file.  Other file extensions can be customized with the variable
`projectile-other-file-alist'.

\(fn &optional FLEX-MATCHING)" t nil)

(autoload 'projectile-find-other-file-other-frame "projectile/projectile" "\
Switch between files with different extensions in other frame.
Switch between files with the same name but different extensions in other frame.
With FLEX-MATCHING, match any file that contains the base name of current
file.  Other file extensions can be customized with the variable
`projectile-other-file-alist'.

\(fn &optional FLEX-MATCHING)" t nil)

(autoload 'projectile-find-file-dwim "projectile/projectile" "\
Jump to a project's files using completion based on context.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

If point is on a filename, Projectile first tries to search for that
file in project:

- If it finds just a file, it switches to that file instantly.  This works
even if the filename is incomplete, but there's only a single file in the
current project that matches the filename at point.  For example, if
there's only a single file named \"projectile/projectile.el\" but the
current filename is \"projectile/proj\" (incomplete),
`projectile-find-file-dwim' still switches to \"projectile/projectile.el\"
immediately because this is the only filename that matches.

- If it finds a list of files, the list is displayed for selecting.  A list
of files is displayed when a filename appears more than one in the project
or the filename at point is a prefix of more than two files in a project.
For example, if `projectile-find-file-dwim' is executed on a filepath like
\"projectile/\", it lists the content of that directory.  If it is executed
on a partial filename like \"projectile/a\", a list of files with character
\"a\" in that directory is presented.

- If it finds nothing, display a list of all files in project for selecting.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-dwim-other-window "projectile/projectile" "\
Jump to a project's files using completion based on context in other window.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

If point is on a filename, Projectile first tries to search for that
file in project:

- If it finds just a file, it switches to that file instantly.  This works
even if the filename is incomplete, but there's only a single file in the
current project that matches the filename at point.  For example, if
there's only a single file named \"projectile/projectile.el\" but the
current filename is \"projectile/proj\" (incomplete),
`projectile-find-file-dwim-other-window' still switches to
\"projectile/projectile.el\" immediately because this is the only filename
that matches.

- If it finds a list of files, the list is displayed for selecting.  A list
of files is displayed when a filename appears more than one in the project
or the filename at point is a prefix of more than two files in a project.
For example, if `projectile-find-file-dwim-other-window' is executed on a
filepath like \"projectile/\", it lists the content of that directory.  If
it is executed on a partial filename like \"projectile/a\", a list of files
with character \"a\" in that directory is presented.

- If it finds nothing, display a list of all files in project for selecting.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-dwim-other-frame "projectile/projectile" "\
Jump to a project's files using completion based on context in other frame.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

If point is on a filename, Projectile first tries to search for that
file in project:

- If it finds just a file, it switches to that file instantly.  This works
even if the filename is incomplete, but there's only a single file in the
current project that matches the filename at point.  For example, if
there's only a single file named \"projectile/projectile.el\" but the
current filename is \"projectile/proj\" (incomplete),
`projectile-find-file-dwim-other-frame' still switches to
\"projectile/projectile.el\" immediately because this is the only filename
that matches.

- If it finds a list of files, the list is displayed for selecting.  A list
of files is displayed when a filename appears more than one in the project
or the filename at point is a prefix of more than two files in a project.
For example, if `projectile-find-file-dwim-other-frame' is executed on a
filepath like \"projectile/\", it lists the content of that directory.  If
it is executed on a partial filename like \"projectile/a\", a list of files
with character \"a\" in that directory is presented.

- If it finds nothing, display a list of all files in project for selecting.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file "projectile/projectile" "\
Jump to a project's file using completion.
With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-other-window "projectile/projectile" "\
Jump to a project's file using completion and show it in another window.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-file-other-frame "projectile/projectile" "\
Jump to a project's file using completion and show it in another frame.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-toggle-project-read-only "projectile/projectile" "\
Toggle project read only." t nil)

(autoload 'projectile-add-dir-local-variable "projectile/projectile" "\
Run `add-dir-local-variable' with .dir-locals.el in root of project.

Parameters MODE VARIABLE VALUE are passed directly to `add-dir-local-variable'.

\(fn MODE VARIABLE VALUE)" nil nil)

(autoload 'projectile-delete-dir-local-variable "projectile/projectile" "\
Run `delete-dir-local-variable' with .dir-locals.el in root of project.

Parameters MODE VARIABLE VALUE are passed directly to
`delete-dir-local-variable'.

\(fn MODE VARIABLE)" nil nil)

(autoload 'projectile-find-dir "projectile/projectile" "\
Jump to a project's directory using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-dir-other-window "projectile/projectile" "\
Jump to a project's directory in other window using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-dir-other-frame "projectile/projectile" "\
Jump to a project's directory in other frame using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-test-file "projectile/projectile" "\
Jump to a project's test file using completion.

With a prefix arg INVALIDATE-CACHE invalidates the cache first.

\(fn &optional INVALIDATE-CACHE)" t nil)

(autoload 'projectile-find-related-file-other-window "projectile/projectile" "\
Open related file in other window." t nil)

(autoload 'projectile-find-related-file-other-frame "projectile/projectile" "\
Open related file in other frame." t nil)

(autoload 'projectile-find-related-file "projectile/projectile" "\
Open related file." t nil)

(autoload 'projectile-related-files-fn-groups "projectile/projectile" "\
Generate a related-files-fn which relates as KIND for files in each of GROUPS.

\(fn KIND GROUPS)" nil nil)

(autoload 'projectile-related-files-fn-extensions "projectile/projectile" "\
Generate a related-files-fn which relates as KIND for files having EXTENSIONS.

\(fn KIND EXTENSIONS)" nil nil)

(autoload 'projectile-related-files-fn-test-with-prefix "projectile/projectile" "\
Generate a related-files-fn which relates tests and impl.
Use files with EXTENSION based on TEST-PREFIX.

\(fn EXTENSION TEST-PREFIX)" nil nil)

(autoload 'projectile-related-files-fn-test-with-suffix "projectile/projectile" "\
Generate a related-files-fn which relates tests and impl.
Use files with EXTENSION based on TEST-SUFFIX.

\(fn EXTENSION TEST-SUFFIX)" nil nil)

(autoload 'projectile-project-info "projectile/projectile" "\
Display info for current project." t nil)

(autoload 'projectile-find-implementation-or-test-other-window "projectile/projectile" "\
Open matching implementation or test file in other window.

See the documentation of `projectile--find-matching-file' and
`projectile--find-matching-test' for how implementation and test files
are determined." t nil)

(autoload 'projectile-find-implementation-or-test-other-frame "projectile/projectile" "\
Open matching implementation or test file in other frame.

See the documentation of `projectile--find-matching-file' and
`projectile--find-matching-test' for how implementation and test files
are determined." t nil)

(autoload 'projectile-toggle-between-implementation-and-test "projectile/projectile" "\
Toggle between an implementation file and its test file.


See the documentation of `projectile--find-matching-file' and
`projectile--find-matching-test' for how implementation and test files
are determined." t nil)

(autoload 'projectile-grep "projectile/projectile" "\
Perform rgrep in the project.

With a prefix ARG asks for files (globbing-aware) which to grep in.
With prefix ARG of `-' (such as `M--'), default the files (without prompt),
to `projectile-grep-default-files'.

With REGEXP given, don't query the user for a regexp.

\(fn &optional REGEXP ARG)" t nil)

(autoload 'projectile-ag "projectile/projectile" "\
Run an ag search with SEARCH-TERM in the project.

With an optional prefix argument ARG SEARCH-TERM is interpreted as a
regular expression.

\(fn SEARCH-TERM &optional ARG)" t nil)

(autoload 'projectile-ripgrep "projectile/projectile" "\
Run a ripgrep (rg) search with `SEARCH-TERM' at current project root.

With an optional prefix argument ARG SEARCH-TERM is interpreted as a
regular expression.

This command depends on of the Emacs packages ripgrep or rg being
installed to work.

\(fn SEARCH-TERM &optional ARG)" t nil)

(autoload 'projectile-regenerate-tags "projectile/projectile" "\
Regenerate the project's [e|g]tags." t nil)

(autoload 'projectile-find-tag "projectile/projectile" "\
Find tag in project." t nil)

(autoload 'projectile-run-command-in-root "projectile/projectile" "\
Invoke `execute-extended-command' in the project's root." t nil)

(autoload 'projectile-run-shell-command-in-root "projectile/projectile" "\
Invoke `shell-command' in the project's root.

\(fn COMMAND &optional OUTPUT-BUFFER ERROR-BUFFER)" t nil)

(autoload 'projectile-run-async-shell-command-in-root "projectile/projectile" "\
Invoke `async-shell-command' in the project's root.

\(fn COMMAND &optional OUTPUT-BUFFER ERROR-BUFFER)" t nil)

(autoload 'projectile-run-gdb "projectile/projectile" "\
Invoke `gdb' in the project's root." t nil)

(autoload 'projectile-run-shell "projectile/projectile" "\
Invoke `shell' in the project's root.

Switch to the project specific shell buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-eshell "projectile/projectile" "\
Invoke `eshell' in the project's root.

Switch to the project specific eshell buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-ielm "projectile/projectile" "\
Invoke `ielm' in the project's root.

Switch to the project specific ielm buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-term "projectile/projectile" "\
Invoke `term' in the project's root.

Switch to the project specific term buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-run-vterm "projectile/projectile" "\
Invoke `vterm' in the project's root.

Switch to the project specific term buffer if it already exists.

Use a prefix argument ARG to indicate creation of a new process instead.

\(fn &optional ARG)" t nil)

(autoload 'projectile-replace "projectile/projectile" "\
Replace literal string in project using non-regexp `tags-query-replace'.

With a prefix argument ARG prompts you for a directory and file name patterns
on which to run the replacement.

\(fn &optional ARG)" t nil)

(autoload 'projectile-replace-regexp "projectile/projectile" "\
Replace a regexp in the project using `tags-query-replace'.

With a prefix argument ARG prompts you for a directory on which
to run the replacement.

\(fn &optional ARG)" t nil)

(autoload 'projectile-kill-buffers "projectile/projectile" "\
Kill project buffers.

The buffer are killed according to the value of
`projectile-kill-buffers-filter'." t nil)

(autoload 'projectile-save-project-buffers "projectile/projectile" "\
Save all project buffers." t nil)

(autoload 'projectile-dired "projectile/projectile" "\
Open `dired' at the root of the project." t nil)

(autoload 'projectile-dired-other-window "projectile/projectile" "\
Open `dired'  at the root of the project in another window." t nil)

(autoload 'projectile-dired-other-frame "projectile/projectile" "\
Open `dired' at the root of the project in another frame." t nil)

(autoload 'projectile-vc "projectile/projectile" "\
Open `vc-dir' at the root of the project.

For git projects `magit-status-internal' is used if available.
For hg projects `monky-status' is used if available.

If PROJECT-ROOT is given, it is opened instead of the project
root directory of the current buffer file.  If interactively
called with a prefix argument, the user is prompted for a project
directory to open.

\(fn &optional PROJECT-ROOT)" t nil)

(autoload 'projectile-recentf "projectile/projectile" "\
Show a list of recently visited files in a project." t nil)

(autoload 'projectile-configure-project "projectile/projectile" "\
Run project configure command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-compile-project "projectile/projectile" "\
Run project compilation command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-test-project "projectile/projectile" "\
Run project test command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-install-project "projectile/projectile" "\
Run project install command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-package-project "projectile/projectile" "\
Run project package command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-run-project "projectile/projectile" "\
Run project run command.

Normally you'll be prompted for a compilation command, unless
variable `compilation-read-command'.  You can force the prompt
with a prefix ARG.

\(fn ARG)" t nil)

(autoload 'projectile-repeat-last-command "projectile/projectile" "\
Run last projectile external command.

External commands are: `projectile-configure-project',
`projectile-compile-project', `projectile-test-project',
`projectile-install-project', `projectile-package-project',
and `projectile-run-project'.

If the prefix argument SHOW_PROMPT is non nil, the command can be edited.

\(fn SHOW-PROMPT)" t nil)

(autoload 'projectile-switch-project "projectile/projectile" "\
Switch to a project we have visited before.
Invokes the command referenced by `projectile-switch-project-action' on switch.
With a prefix ARG invokes `projectile-commander' instead of
`projectile-switch-project-action.'

\(fn &optional ARG)" t nil)

(autoload 'projectile-switch-open-project "projectile/projectile" "\
Switch to a project we have currently opened.
Invokes the command referenced by `projectile-switch-project-action' on switch.
With a prefix ARG invokes `projectile-commander' instead of
`projectile-switch-project-action.'

\(fn &optional ARG)" t nil)

(autoload 'projectile-find-file-in-directory "projectile/projectile" "\
Jump to a file in a (maybe regular) DIRECTORY.

This command will first prompt for the directory the file is in.

\(fn &optional DIRECTORY)" t nil)

(autoload 'projectile-find-file-in-known-projects "projectile/projectile" "\
Jump to a file in any of the known projects." t nil)

(autoload 'projectile-cleanup-known-projects "projectile/projectile" "\
Remove known projects that don't exist anymore." t nil)

(autoload 'projectile-clear-known-projects "projectile/projectile" "\
Clear both `projectile-known-projects' and `projectile-known-projects-file'." t nil)

(autoload 'projectile-reset-known-projects "projectile/projectile" "\
Clear known projects and rediscover." t nil)

(autoload 'projectile-remove-known-project "projectile/projectile" "\
Remove PROJECT from the list of known projects.

\(fn &optional PROJECT)" t nil)

(autoload 'projectile-remove-current-project-from-known-projects "projectile/projectile" "\
Remove the current project from the list of known projects." t nil)

(autoload 'projectile-add-known-project "projectile/projectile" "\
Add PROJECT-ROOT to the list of known projects.

\(fn PROJECT-ROOT)" t nil)

(autoload 'projectile-ibuffer "projectile/projectile" "\
Open an IBuffer window showing all buffers in the current project.

Let user choose another project when PROMPT-FOR-PROJECT is supplied.

\(fn PROMPT-FOR-PROJECT)" t nil)

(autoload 'projectile-commander "projectile/projectile" "\
Execute a Projectile command with a single letter.
The user is prompted for a single character indicating the action to invoke.
The `?' character describes then
available actions.

See `def-projectile-commander-method' for defining new methods." t nil)

(autoload 'projectile-browse-dirty-projects "projectile/projectile" "\
Browse dirty version controlled projects.

With a prefix argument, or if CACHED is non-nil, try to use the cached
dirty project list.

\(fn &optional CACHED)" t nil)

(autoload 'projectile-edit-dir-locals "projectile/projectile" "\
Edit or create a .dir-locals.el file of the project." t nil)

(defvar projectile-mode nil "\
Non-nil if Projectile mode is enabled.
See the `projectile-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `projectile-mode'.")

(custom-autoload 'projectile-mode "projectile/projectile" nil)

(autoload 'projectile-mode "projectile/projectile" "\
Minor mode to assist project management and navigation.

When called interactively, toggle `projectile-mode'.  With prefix
ARG, enable `projectile-mode' if ARG is positive, otherwise disable
it.

When called from Lisp, enable `projectile-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `projectile-mode'.
Otherwise behave as if called interactively.

\\{projectile-mode-map}

\(fn &optional ARG)" t nil)

(define-obsolete-function-alias 'projectile-global-mode 'projectile-mode "1.0")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "projectile/projectile" '("??" "compilation-find-file-projectile-find-compilation-buffer" "def-projectile-commander-method" "delete-file-projectile-remove-from-cache" "project")))

;;;***

;;;### (autoloads nil "request/request" "request/request.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from request/request.el

(autoload 'request-response-header "request/request" "\
Fetch the values of RESPONSE header field named FIELD-NAME.

It returns comma separated values when the header has multiple
field with the same name, as :RFC:`2616` specifies.

Examples::

  (request-response-header response
                           \"content-type\") ; => \"text/html; charset=utf-8\"
  (request-response-header response
                           \"unknown-field\") ; => nil

\(fn RESPONSE FIELD-NAME)" nil nil)

(autoload 'request-response-headers "request/request" "\
Return RESPONSE headers as an alist.
I would have chosen a function name that wasn't so suggestive that
`headers` is a member of the `request-response` struct, but
as there's already precedent with `request-response-header', I
hew to consistency.

\(fn RESPONSE)" nil nil)

(autoload 'request "request/request" "\
Main entry requesting URL with property list SETTINGS as follow.

==================== ========================================================
Keyword argument      Explanation
==================== ========================================================
TYPE          (string)   type of request to make: POST/GET/PUT/DELETE
PARAMS         (alist)   set \"?key=val\" part in URL
DATA    (string/alist)   data to be sent to the server
FILES          (alist)   files to be sent to the server (see below)
PARSER        (symbol)   a function that reads current buffer and return data
HEADERS        (alist)   additional headers to send with the request
ENCODING      (symbol)   encoding for request body (utf-8 by default)
SUCCESS     (function)   called on success
ERROR       (function)   called on error
COMPLETE    (function)   called on both success and error
TIMEOUT       (number)   timeout in second
STATUS-CODE    (alist)   map status code (int) to callback
SYNC            (bool)   If non-nil, wait until request is done. Default is nil.
==================== ========================================================


* Callback functions

Callback functions STATUS, ERROR, COMPLETE and `cdr\\='s in element of
the alist STATUS-CODE take same keyword arguments listed below.  For
forward compatibility, these functions must ignore unused keyword
arguments (i.e., it\\='s better to use `&allow-other-keys\\=' [#]_).::

    (CALLBACK                      ; SUCCESS/ERROR/COMPLETE/STATUS-CODE
     :data          data           ; whatever PARSER function returns, or nil
     :error-thrown  error-thrown   ; (ERROR-SYMBOL . DATA), or nil
     :symbol-status symbol-status  ; success/error/timeout/abort/parse-error
     :response      response       ; request-response object
     ...)

.. [#] `&allow-other-keys\\=' is a special \"markers\" available in macros
   in the CL library for function definition such as `cl-defun\\=' and
   `cl-function\\='.  Without this marker, you need to specify all arguments
   to be passed.  This becomes problem when request.el adds new arguments
   when calling callback functions.  If you use `&allow-other-keys\\='
   (or manually ignore other arguments), your code is free from this
   problem.  See info node `(cl) Argument Lists\\=' for more information.

Arguments data, error-thrown, symbol-status can be accessed by
`request-response-data\\=', `request-response-error-thrown\\=',
`request-response-symbol-status\\=' accessors, i.e.::

    (request-response-data RESPONSE)  ; same as data

Response object holds other information which can be accessed by
the following accessors:
`request-response-status-code\\=',
`request-response-url\\=' and
`request-response-settings\\='

* STATUS-CODE callback

STATUS-CODE is an alist of the following format::

    ((N-1 . CALLBACK-1)
     (N-2 . CALLBACK-2)
     ...)

Here, N-1, N-2,... are integer status codes such as 200.


* FILES

FILES is an alist of the following format::

    ((NAME-1 . FILE-1)
     (NAME-2 . FILE-2)
     ...)

where FILE-N is a list of the form::

    (FILENAME &key PATH BUFFER STRING MIME-TYPE)

FILE-N can also be a string (path to the file) or a buffer object.
In that case, FILENAME is set to the file name or buffer name.

Example FILES argument::

    `((\"passwd\"   . \"/etc/passwd\")                ; filename = passwd
      (\"scratch\"  . ,(get-buffer \"*scratch*\"))    ; filename = *scratch*
      (\"passwd2\"  . (\"password.txt\" :file \"/etc/passwd\"))
      (\"scratch2\" . (\"scratch.txt\"  :buffer ,(get-buffer \"*scratch*\")))
      (\"data\"     . (\"data.csv\"     :data \"1,2,3\\n4,5,6\\n\")))

.. note:: FILES is implemented only for curl backend for now.
   As furl.el_ supports multipart POST, it should be possible to
   support FILES in pure elisp by making furl.el_ another backend.
   Contributions are welcome.

   .. _furl.el: https://code.google.com/p/furl-el/


* PARSER function

PARSER function takes no argument and it is executed in the
buffer with HTTP response body.  The current position in the HTTP
response buffer is at the beginning of the buffer.  As the HTTP
header is stripped off, the cursor is actually at the beginning
of the response body.  So, for example, you can pass `json-read\\='
to parse JSON object in the buffer.  To fetch whole response as a
string, pass `buffer-string\\='.

When using `json-read\\=', it is useful to know that the returned
type can be modified by `json-object-type\\=', `json-array-type\\=',
`json-key-type\\=', `json-false\\=' and `json-null\\='.  See docstring of
each function for what it does.  For example, to convert JSON
objects to plist instead of alist, wrap `json-read\\=' by `lambda\\='
like this.::

    (request
     \"https://...\"
     :parser (lambda ()
               (let ((json-object-type \\='plist))
                 (json-read)))
     ...)

This is analogous to the `dataType\\=' argument of jQuery.ajax_.
Only this function can access to the process buffer, which
is killed immediately after the execution of this function.

* SYNC

Synchronous request is functional, but *please* don\\='t use it
other than testing or debugging.  Emacs users have better things
to do rather than waiting for HTTP request.  If you want a better
way to write callback chains, use `request-deferred\\='.

If you can\\='t avoid using it (e.g., you are inside of some hook
which must return some value), make sure to set TIMEOUT to
relatively small value.

Due to limitation of `url-retrieve-synchronously\\=', response slots
`request-response-error-thrown\\=', `request-response-history\\=' and
`request-response-url\\=' are unknown (always nil) when using
synchronous request with `url-retrieve\\=' backend.

* Note

API of `request\\=' is somewhat mixture of jQuery.ajax_ (Javascript)
and requests.request_ (Python).

.. _jQuery.ajax: https://api.jquery.com/jQuery.ajax/
.. _requests.request: https://docs.python-requests.org

\(fn URL &rest SETTINGS &key (PARAMS nil) (DATA nil) (HEADERS nil) (ENCODING \\='utf-8) (ERROR nil) (SYNC nil) (RESPONSE (make-request-response)) &allow-other-keys)" nil nil)

(function-put 'request 'lisp-indent-function 'defun)

(autoload 'request-untrampify-filename "request/request" "\
Return FILE as the local file name.

\(fn FILE)" nil nil)

(autoload 'request-abort "request/request" "\
Abort request for RESPONSE (the object returned by `request').
Note that this function invoke ERROR and COMPLETE callbacks.
Callbacks may not be called immediately but called later when
associated process is exited.

\(fn RESPONSE)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "request/request" '("request-")))

;;;***

;;;### (autoloads nil "request/request-deferred" "request/request-deferred.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from request/request-deferred.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "request/request-deferred" '("request-deferred")))

;;;***

;;;### (autoloads nil "s/s" "s/s.el" (0 0 0 0))
;;; Generated autoloads from s/s.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "s/s" '("s-")))

;;;***

;;;### (autoloads nil "simple-httpd/simple-httpd" "simple-httpd/simple-httpd.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from simple-httpd/simple-httpd.el

(autoload 'httpd-start "simple-httpd/simple-httpd" "\
Start the web server process. If the server is already
running, this will restart the server. There is only one server
instance per Emacs instance." t nil)

(autoload 'httpd-stop "simple-httpd/simple-httpd" "\
Stop the web server if it is currently running, otherwise do nothing." t nil)

(autoload 'httpd-running-p "simple-httpd/simple-httpd" "\
Return non-nil if the simple-httpd server is running." nil nil)

(autoload 'httpd-serve-directory "simple-httpd/simple-httpd" "\
Start the web server with given `directory' as `httpd-root'.

\(fn DIRECTORY)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "simple-httpd/simple-httpd" '("defservlet" "httpd" "with-httpd-buffer")))

;;;***

;;;### (autoloads nil "simple-httpd/simple-httpd-test" "simple-httpd/simple-httpd-test.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from simple-httpd/simple-httpd-test.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "simple-httpd/simple-httpd-test" '("httpd--flet")))

;;;***

;;;### (autoloads nil "skewer-mode/cache-table" "skewer-mode/cache-table.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from skewer-mode/cache-table.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "skewer-mode/cache-table" '("cache-table-")))

;;;***

;;;### (autoloads nil "skewer-mode/skewer-bower" "skewer-mode/skewer-bower.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from skewer-mode/skewer-bower.el

(autoload 'skewer-bower-refresh "skewer-mode/skewer-bower" "\
Update the package listing and packages synchronously." t nil)

(autoload 'skewer-bower-load "skewer-mode/skewer-bower" "\
Dynamically load a library from bower into the current page.

\(fn PACKAGE &optional VERSION)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "skewer-mode/skewer-bower" '("skewer")))

;;;***

;;;### (autoloads nil "skewer-mode/skewer-css" "skewer-mode/skewer-css.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from skewer-mode/skewer-css.el

(autoload 'skewer-css-mode "skewer-mode/skewer-css" "\
Minor mode for interactively loading new CSS rules.

If called interactively, enable Skewer-Css mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "skewer-mode/skewer-css" '("skewer-css")))

;;;***

;;;### (autoloads nil "skewer-mode/skewer-html" "skewer-mode/skewer-html.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from skewer-mode/skewer-html.el

(autoload 'skewer-html-mode "skewer-mode/skewer-html" "\
Minor mode for interactively loading new HTML.

If called interactively, enable Skewer-Html mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "skewer-mode/skewer-html" '("skewer-html-")))

;;;***

;;;### (autoloads nil "skewer-mode/skewer-mode" "skewer-mode/skewer-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from skewer-mode/skewer-mode.el

(autoload 'list-skewer-clients "skewer-mode/skewer-mode" "\
List the attached browsers in a buffer." t nil)

(autoload 'skewer-mode "skewer-mode/skewer-mode" "\
Minor mode for interacting with a browser.

If called interactively, enable Skewer mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'run-skewer "skewer-mode/skewer-mode" "\
Attach a browser to Emacs for a skewer JavaScript REPL. Uses
`browse-url' to launch a browser.

With a prefix arugment (C-u), it will ask the filename of the
root document.  With two prefix arguments (C-u C-u), it will use
the contents of the current buffer as the root document.

\(fn &optional ARG)" t nil)

(autoload 'skewer-run-phantomjs "skewer-mode/skewer-mode" "\
Connect an inferior PhantomJS process to Skewer, returning the process." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "skewer-mode/skewer-mode" '("httpd/skewer/" "phantomjs-program-name" "skewer")))

;;;***

;;;### (autoloads nil "skewer-mode/skewer-repl" "skewer-mode/skewer-repl.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from skewer-mode/skewer-repl.el

(autoload 'skewer-repl--response-hook "skewer-mode/skewer-repl" "\
Catches all browser messages logging some to the REPL.

\(fn RESPONSE)" nil nil)

(autoload 'skewer-repl "skewer-mode/skewer-repl" "\
Start a JavaScript REPL to be evaluated in the visiting browser." t nil)

(eval-after-load 'skewer-mode '(progn (add-hook 'skewer-response-hook #'skewer-repl--response-hook) (add-hook 'skewer-repl-mode-hook #'skewer-repl-mode-compilation-shell-hook) (define-key skewer-mode-map (kbd "C-c C-z") #'skewer-repl)))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "skewer-mode/skewer-repl" '("company-skewer-repl" "skewer-")))

;;;***

;;;### (autoloads nil "skewer-mode/skewer-setup" "skewer-mode/skewer-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from skewer-mode/skewer-setup.el

(autoload 'skewer-setup "skewer-mode/skewer-setup" "\
Fully integrate Skewer into js2-mode, css-mode, and html-mode buffers." nil nil)

;;;***

;;;### (autoloads nil "solidity-mode/company-solidity" "solidity-mode/company-solidity.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solidity-mode/company-solidity.el

(autoload 'company-solidity "solidity-mode/company-solidity" "\
Autocompletion for solidity with company mode.

Argument COMMAND `company-backend` functions.
Optional argument ARG the completion target prefix.
Optional argument IGNORED Additional arguments are ingnored.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solidity-mode/company-solidity" '("company-solidity-")))

;;;***

;;;### (autoloads nil "solidity-mode/solidity-common" "solidity-mode/solidity-common.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solidity-mode/solidity-common.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solidity-mode/solidity-common" '("solidity-sol")))

;;;***

;;;### (autoloads nil "solidity-mode/solidity-flycheck" "solidity-mode/solidity-flycheck.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solidity-mode/solidity-flycheck.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solidity-mode/solidity-flycheck" '("get-solc-version" "sol")))

;;;***

;;;### (autoloads nil "solidity-mode/solidity-mode" "solidity-mode/solidity-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from solidity-mode/solidity-mode.el

(add-to-list 'auto-mode-alist '("\\.sol\\'" . solidity-mode))

(autoload 'solidity-mode "solidity-mode/solidity-mode" "\
Major mode for editing solidity language buffers.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "solidity-mode/solidity-mode" '("solidity-")))

;;;***

;;;### (autoloads nil "tern/emacs/tern" "tern/emacs/tern.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from tern/emacs/tern.el

(autoload 'tern-use-server "tern/emacs/tern" "\


\(fn PORT SERVER)" t nil)

(autoload 'tern-mode "tern/emacs/tern" "\
Minor mode binding to the Tern JavaScript analyzer

If called interactively, enable Tern mode if ARG is positive, and
disable it if ARG is zero or negative.  If called from Lisp, also
enable the mode if ARG is omitted or nil, and toggle it if ARG is
`toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tern/emacs/tern" '("tern-")))

;;;***

;;;### (autoloads nil "tern/emacs/tern-auto-complete" "tern/emacs/tern-auto-complete.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tern/emacs/tern-auto-complete.el

(autoload 'tern-ac-setup "tern/emacs/tern-auto-complete" "\
Setup auto-complete for tern-mode." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "tern/emacs/tern-auto-complete" '("tern-ac-")))

;;;***

;;;### (autoloads nil "web-mode/web-mode" "web-mode/web-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from web-mode/web-mode.el

(autoload 'web-mode "web-mode/web-mode" "\
Major mode for editing web templates.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "web-mode/web-mode" '("web-mode-")))

;;;***

;;;### (autoloads nil "websocket/websocket" "websocket/websocket.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from websocket/websocket.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "websocket/websocket" '("websocket-")))

;;;***

;;;### (autoloads nil "websocket/websocket-functional-test" "websocket/websocket-functional-test.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from websocket/websocket-functional-test.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "websocket/websocket-functional-test" '("websocket-")))

;;;***

;;;### (autoloads nil "websocket/websocket-test" "websocket/websocket-test.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from websocket/websocket-test.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "websocket/websocket-test" '("websocket-test-")))

;;;***

;;;### (autoloads nil nil ("auto-complete/auto-complete-pkg.el" "code-cells/code-cells-autoloads.el"
;;;;;;  "code-cells/code-cells-pkg.el" "dash/dash-functional.el"
;;;;;;  "ein/lisp/ein-completer.el" "ein/lisp/ein-pkg.el" "ein/lisp/ein.el"
;;;;;;  "el-get/el-get-install.el" "polymode/polymode-tangle.el"
;;;;;;  "skewer-mode/skewer-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here

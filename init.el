;;----------------------------------------------------------------------------
;; El Get
;;----------------------------------------------------------------------------


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;;----------------------------------------------------------------------------
;; MELPA
;;----------------------------------------------------------------------------
(require 'el-get-elpa)
(unless (file-directory-p el-get-recipe-path-elpa)
  (el-get-elpa-build-local-recipes))

;;----------------------------------------------------------------------------
;; General
;;----------------------------------------------------------------------------

;; Disable splash screen
(setq inhibit-startup-message t)

;; Enable mouse wheel scrolling
(mouse-wheel-mode t)

;; Show line number
(line-number-mode 1)

;; Show column number
(column-number-mode 1)

;; Disable auto backup
(setq make-backup-files nil)

;; Indent with spaces
(setq-default indent-tabs-mode nil)

;; Auto indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Save always
(defun save-buffer-always ()
  "Save the buffer even if it is not modified."
  (interactive)
  (set-buffer-modified-p t)
  (save-buffer))

;; Make #! scripts executable after saving them
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;;----------------------------------------------------------------------------
;; Projectile Mode
;;----------------------------------------------------------------------------

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(projectile-global-mode)
(setq projectile-enable-caching t)

;;----------------------------------------------------------------------------
;; Helm Projectile Mode
;;----------------------------------------------------------------------------

(require 'helm-projectile)
(helm-projectile-on)

(global-set-key (kbd "C-c p x x") 'helm-do-ag)

;;----------------------------------------------------------------------------
;; Ruby Mode
;;----------------------------------------------------------------------------

(add-hook 'ruby-mode-hook 'turn-on-font-lock)

(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-arglist nil)

;; Set column marker at 100 characters
(add-hook 'ruby-mode-hook
	  (lambda () (interactive) (column-marker-1 100)))

;; Comment region in Ruby
(add-hook 'ruby-mode-hook
	 (lambda () (define-key ruby-mode-map (kbd "C-#") 'comment-or-uncomment-region)))

;; Unindent line for closing paren
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; Remove encoding information on save
(setq ruby-insert-encoding-magic-comment nil)

;;----------------------------------------------------------------------------
;; Tern mode
;;----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/el-get/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;;----------------------------------------------------------------------------
;; Web mode
;;----------------------------------------------------------------------------

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (tern-mode t)

  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 2)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)

  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))

  (setq web-mode-enable-auto-quoting nil)

  (setq web-mode-comment-formats
        '(("js"  . "/*")
          ("jsx" . "//")
          ))
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;;----------------------------------------------------------------------------
;; Javascript mode
;;----------------------------------------------------------------------------

(setq js-indent-level 2)

;;----------------------------------------------------------------------------
;; Solidity mode
;;----------------------------------------------------------------------------

(require 'solidity-mode)

(add-hook 'solidity-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '((company-solidity company-capf company-dabbrev-code))
                         company-backends))))

;;----------------------------------------------------------------------------
;; Flycheck Mode
;;----------------------------------------------------------------------------

(require 'flycheck)
(setq-default flycheck-temp-prefix ".flycheck")

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Disable jshint and json-jsonlist
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; Use Eslint for JS/JSX. Allow local eslint config
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
(flycheck-add-mode 'javascript-eslint 'web-mode)

(setq solidity-flycheck-solc-checker-active t)
(setq solidity-flycheck-solium-checker-active t)

;;----------------------------------------------------------------------------
;; Notebooks
;;----------------------------------------------------------------------------

;; Auto sync linked files via jupytext on save
(defun my@sync-jupytext ()
  "Sync linked files via jupytext."
  (shell-command-to-string (format "jupytext --sync %s" buffer-file-name)))

(add-hook 'after-save-hook #'my@sync-jupytext)

(defun my@sync-jupytext-ein (orig-fn notebook &rest args)
  "Sync linked files via jupytext when in ein mode."
  (apply orig-fn notebook args)
  (message "[jupytext] %s"
           (shell-command-to-string
            (format "jupytext --sync %s"
                    (expand-file-name (ein:$notebook-notebook-name notebook))))))

(advice-add 'ein:notebook-save-notebook-success :around #'my@sync-jupytext-ein)

;;----------------------------------------------------------------------------
;; File associations
;;----------------------------------------------------------------------------

;; Ruby file associations
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rsel$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Guardfile$" . ruby-mode))

;; JS file associations
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;;----------------------------------------------------------------------------
;; Custom
;;----------------------------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point 'symbol)
 '(package-selected-packages '(let-alist)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

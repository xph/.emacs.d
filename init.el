;;----------------------------------------------------------------------------
;; El Get
;;----------------------------------------------------------------------------

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
;; Flx Ido Mode
;;----------------------------------------------------------------------------

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; Disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;;----------------------------------------------------------------------------
;; Projectile Mode
;;----------------------------------------------------------------------------

(projectile-global-mode)
(setq projectile-enable-caching t)

;;----------------------------------------------------------------------------
;; Helm Projectile Mode
;;----------------------------------------------------------------------------

(require 'helm-projectile)
(helm-projectile-on)

(custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point 'symbol))

;;----------------------------------------------------------------------------
;; Ruby Mode
;;----------------------------------------------------------------------------

(add-hook 'ruby-mode-hook 'turn-on-font-lock)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

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
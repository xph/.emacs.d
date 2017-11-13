((ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el" :depends
            (dash s)))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (column-marker status "installed" recipe
                (:name column-marker :description "Highlight certain character columns" :type emacswiki :features column-marker))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
                ("el-get.*\\.el$" "methods/")
                :features el-get :post-init
                (when
                    (memq 'el-get
                          (bound-and-true-p package-activated-list))
                  (message "Deleting melpa bootstrap el-get")
                  (unless package--initialized
                    (package-initialize t))
                  (when
                      (package-installed-p 'el-get)
                    (let
                        ((feats
                          (delete-dups
                           (el-get-package-features
                            (el-get-elpa-package-directory 'el-get)))))
                      (el-get-elpa-delete-package 'el-get)
                      (dolist
                          (feat feats)
                        (unload-feature feat t))))
                  (require 'el-get))))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (flx status "installed" recipe
      (:name flx :description "Fuzzy matching with good sorting in ido" :type github :pkgname "lewang/flx"))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension" :depends
                  (dash pkg-info let-alist seq)))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental completion and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
              (("make"))
              :build/darwin
              `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (let
                  ((generated-autoload-file
                    (expand-file-name "helm-autoloads.el"))
                   \
                   (backup-inhibited t))
              (update-directory-autoloads default-directory)
              nil)
       :features "helm-config" :post-init
       (helm-mode)))
(helm-ag status "installed" recipe
(:name helm-ag :description "The silver search with helm interface." :type github :pkgname "syohex/emacs-helm-ag" :depends
(helm)))
(helm-projectile status "installed" recipe
(:name helm-projectile :description "Helm integration for Projectile." :type github :pkgname "bbatsov/helm-projectile" :depends
(projectile helm dash cl-lib)))
(inf-ruby status "installed" recipe
(:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
(js2-mode status "installed" recipe
(:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
(autoload 'js2-mode "js2-mode" nil t)))
(let-alist status "installed" recipe
(:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
(package status "installed" recipe
(:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
(progn
(let
((old-package-user-dir
(expand-file-name
(convert-standard-filename
(concat
(file-name-as-directory default-directory)
"elpa")))))
(when
(file-directory-p old-package-user-dir)
(add-to-list 'package-directory-list old-package-user-dir)))
(setq package-archives
(bound-and-true-p package-archives))
(mapc
(lambda
(pa)
(add-to-list 'package-archives pa 'append))
'(("ELPA" . "http://tromey.com/elpa/")
("melpa" . "http://melpa.org/packages/")
("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(projectile status "installed" recipe
(:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends
(dash s f pkg-info)))
(ruby-mode status "installed" recipe
(:name ruby-mode :builtin "24" :type http :description "Major mode for editing Ruby files." :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/ruby-mode.el"))
(rvm status "installed" recipe
(:name rvm :description "Emacs integration for rvm" :type github :features rvm :pkgname "senny/rvm.el" :compile "rvm.el" :post-init
(rvm-use-default)))
(s status "installed" recipe
(:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
(seq status "installed" recipe
(:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
(slim-mode status "installed" recipe
(:name slim-mode :description "Syntax highlighting for Slim" :type github :pkgname "slim-template/emacs-slim" :features slim-mode))
(tern status "installed" recipe
(:name tern :description "A JavaScript code analyzer for deep, cross-editor language support." :type github :pkgname "marijnh/tern" :build
'(("npm" "--production" "install"))
:prepare
(add-to-list 'auto-mode-alist
'("\\.tern-\\(project\\|\\config\\)\\'" . json-mode))
:load-path
("emacs")))
(web-mode status "installed" recipe
(:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode")))

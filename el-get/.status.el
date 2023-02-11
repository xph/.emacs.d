((cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :website "http://elpa.gnu.org/packages/cl-lib.html"))
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
 (emacs-async status "installed" recipe
              (:name emacs-async :description "Simple library for asynchronous processing in Emacs" :type github :pkgname "jwiegley/emacs-async"))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension" :depends
                  (dash pkg-info let-alist seq)))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental completion and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
              `(("make" ,(concat "ASYNC_ELPA_DIR="
                                 (el-get-package-directory 'emacs-async))))
              :depends
              (emacs-async)
              :build/darwin
              `(("make" ,(concat "ASYNC_ELPA_DIR="
                                 (el-get-package-directory 'emacs-async))
                 ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (let
                  ((generated-autoload-file
                    (expand-file-name "helm-autoloads.el"))
                   \
                   (backup-inhibited t))
                (update-directory-autoloads default-directory)
                nil)
              :build/berkeley-unix
              `(("gmake" ,(concat "ASYNC_ELPA_DIR="
                                  (el-get-package-directory 'emacs-async))))
              :features "helm-autoloads" :post-init
              (helm-mode)))
 (helm-ag status "installed" recipe
          (:name helm-ag :description "The silver search with helm interface." :type github :pkgname "emacsorphanage/helm-ag" :depends
                 (helm)))
 (helm-projectile status "installed" recipe
                  (:name helm-projectile :description "Helm integration for Projectile." :type github :pkgname "bbatsov/helm-projectile" :depends
                         (projectile helm cl-lib)))
 (let-alist status "installed" recipe
            (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :website "https://elpa.gnu.org/packages/let-alist.html"))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "emacsorphanage/pkg-info" :depends
                  (dash epl)))
 (projectile status "installed" recipe
             (:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends pkg-info))
 (ruby-mode status "installed" recipe
            (:name ruby-mode :builtin "24" :type http :description "Major mode for editing Ruby files." :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/ruby-mode.el"))
 (seq status "installed" recipe
      (:name seq :description "Sequence manipulation functions" :builtin "25" :type elpa :website "https://elpa.gnu.org/packages/seq.html"))
 (solidity-mode status "installed" recipe
                (:name solidity-mode :description "Language mode for Ethereum's Solidity Language" :type github :website "https://github.com/ethereum/emacs-solidity" :pkgname "ethereum/emacs-solidity"))
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

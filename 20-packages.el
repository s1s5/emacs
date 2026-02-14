;; インストールパッケージ一覧
(require 'cl)

(defvar installing-package-list
  '(
    ag
    bash-completion
    helm
    helm-rg
    helm-ls-git
    json-mode
    key-combo
	magit
    markdown-mode
    popwin
    yaml-mode
    web-mode
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

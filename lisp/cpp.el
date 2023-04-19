;; general c++ and cmake stuff

(add-hook 'c++-mode-hook 'linum-mode)
(add-hook 'c++-mode-hook 'electric-pair-mode)
(add-hook 'cmake-mode-hook 'linum-mode)
(add-hook 'cmake-mode-hook 'electric-pair-mode)

;; not sure this does anything
(setq c-default-style "stroustrup")

;; clang-format elisp interface
(package-install 'clang-format)
(require 'clang-format)

;; need to format on save in c++/c buffers only
(defun format-and-save () (interactive)
       (clang-format-buffer)
       (save-buffer)
       )

;; override C-x s behaviour for a specific mode - probably better way to do this
(add-hook 'c++-mode-hook (lambda ()
			   (local-set-key (kbd "C-x C-s") 'format-and-save)
			   )
	  )

;; dap-mode uses vscode launch.json for non-trivial launch configurations

;; dap-mode only works properly with lsp-mode, not really worth setting up, use vscode
;; as debugger.

;; installs vscode debug-server if not present (could be slow)
;; (require 'dap-cpptools)
;; (dap-cpptools-setup)

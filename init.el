;; use double colon for comments or get weird newline behaviour


;; disable weird graphical stuff
;; https://superuser.com/questions/127420/how-can-i-hide-the-tool-bar-in-emacs-persistently
(menu-bar-mode -1)
(toggle-scroll-bar -1) ;; might want this
(tool-bar-mode -1)

(toggle-frame-fullscreen)

(desktop-save-mode 1)

(load-theme 'manoj-dark)

(setq ring-bell-function 'ignore) ;; no noise

(setq create-lockfiles nil)
(setq make-backup-files nil) ;; stop creating ~ files

;; put "auto-save" #file1.cpp# in junk directory https://www.emacswiki.org/emacs/AutoSave
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; mac only, need M-3 for '#'
;; https://stackoverflow.com/questions/3977069/emacs-question-hash-key
(global-set-key (kbd "M-3") (lambda () (interactive) (insert "#")))

;: shorter to type interactive prompts
(defalias 'yes-or-no-p 'y-or-n-p)
 
;: C-<left> etc. hijacked by mac window system
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-<left>") 'windmove-left)
(global-set-key (kbd "s-<up>") 'windmove-up)
(global-set-key (kbd "s-<down>") 'windmove-down)

;; https://stackoverflow.com/questions/4987760/how-to-change-size-of-split-screen-emacs-windows
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)

(defun new-shell ()
  (interactive)

  (let (
        (currentbuf (get-buffer-window (current-buffer)))
        (newbuf     (generate-new-buffer-name "*shell*"))
       )

   (generate-new-buffer newbuf)
   (set-window-dedicated-p currentbuf nil)
   (set-window-buffer currentbuf newbuf)
   (shell newbuf)
  )
  )

;: for some reason fn-f9 on mac
(global-set-key (kbd "<f9>") 'new-shell)

;; Some packages only available on MELPA (mumbo-jumbo)
;; https://www.emacswiki.org/emacs/InstallingPackages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; elisp ugh, color parens so easier to follow
;; (package-install 'rainbow-delimiters)
;; (require 'rainbow-delimiters)
;; (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

;; how to get autocompletion from language servers
;; company-mode handles autocompletion

;; viewing pdfs in emacs, probably don't install by default
(load "~/.emacs.d/lisp/pdf.el")

;; markdown mode
(package-install 'markdown-mode)

;; cmake-mode
(package-install 'cmake-mode)

;; eglot - on Mac C++ configuration "just works", nastier on other OSs
(package-install 'eglot)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'cmake-mode-hook 'eglot-ensure)

;; company - autocompletion
(package-install 'company)
;; bad-idea - just enable autocompletion everywhere
(global-company-mode)

;; cmake-language-server python package
;; pip3 install cmake-language-server

;; dap mode uses vscode debug adapters (slow install + lot of junk + depends on lsp)
;; (package-install 'dap-mode)

(load (concat user-emacs-directory "lisp/cpp.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rainbow-delimiters dap-mode clang-format company pdf-tools eglot cmake-mode markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

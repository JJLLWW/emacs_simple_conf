(package-install 'pdf-tools)
(pdf-tools-install)

(add-hook 'pdf-view-mode-hook (lambda () (local-set-key (kbd "<right>") 'pdf-view-next-page)))
(add-hook 'pdf-view-mode-hook (lambda () (local-set-key (kbd "<left>") 'pdf-view-previous-page)))

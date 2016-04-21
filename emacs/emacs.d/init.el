; All packages that are required further in configuration
(setq package-list '(color-theme-monokai
		     color-theme
		     ensime
		     helm
		     helm-ls-git		     
		     monokai-theme
		     sbt-mode
		     scala-mode2
		     magit))


(require 'package)
(require 'helm-ls-git)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)


; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


; Remove useless GUI elements 
(tool-bar-mode 0) 
(menu-bar-mode 0) 
(scroll-bar-mode 0)
(fset `yes-or-no-p `y-or-n-p)

; Show line numbers
(global-linum-mode t)

; Custom key bindings
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

(load-theme 'monokai t)
(global-set-key (kbd "M-]") 'next-buffer)
(global-set-key (kbd "M-[") 'previous-buffer)

; Helm configuration
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "s-o") 'helm-ls-git-ls)


; Ensime configuration
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

					; Magit configuration
(magit-file-mode t)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit helm-ls-git ensime sbt-mode scala-mode2 recentf-ext monokai-theme helm color-theme-monokai color-theme-molokai))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


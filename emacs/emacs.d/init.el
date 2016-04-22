; All packages that are required further in configuration
(setq package-list '(color-theme-monokai
		     color-theme
		     ensime
		     helm
		     helm-ls-git
		     monokai-theme
		     sbt-mode
		     scala-mode2
		     auto-complete
		     magit
		     flycheck
		     web-mode
		     js2-mode
		     json-mode
		     exec-path-from-shell))


(require 'package)
;(require 'helm-ls-git)
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

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

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
(global-magit-file-mode t)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)


;
; JS Config
;

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (exec-path-from-shell json-mode web-mode auto-complete ac-js2 magit helm-ls-git ensime sbt-mode scala-mode2 recentf-ext monokai-theme helm color-theme-monokai color-theme-molokai))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


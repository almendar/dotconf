;; Update package-archive lists
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile
  (require 'use-package))

(require 'use-package)
 (setq
   use-package-always-ensure t
   package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
 		      ("org" . "http://orgmode.org/elpa/")
 		     ("melpa" . "http://melpa.org/packages/")))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))




(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))







; global variables
(setq
  inhibit-startup-screen t
  create-lockfiles nil
  make-backup-files nil
  column-number-mode t
  scroll-error-top-bottom t
  show-paren-delay 0.5
  use-package-always-ensure t
  sentence-end-double-space nil)

;; buffer local variables
(setq-default
  mac-option-modifier 'meta
  mac-right-option-modifier nil
  indent-tabs-mode nil
  tab-width 4
  c-basic-offset 4)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'neotree-find)
; noetree
(use-package neotree)


;osx stuff
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


; helm
(use-package helm)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(helm-mode 1)


;projectile
(use-package projectile)
(use-package helm-projectile)
(helm-projectile-on)
(projectile-global-mode)

;company-mode
(use-package company)
(use-package helm-company)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(global-company-mode)
(setq company-tooltip-align-annotations t)

; flycheck
(use-package flycheck)
(global-flycheck-mode)

;which-key
(use-package which-key)
(which-key-mode)

;iedit
(use-package iedit)

;ag
(use-package ag)
(use-package helm-ag)

; scala stuff
; (use-package ensime)
(use-package scala-mode)

; python stuff
(use-package elpy)
(add-hook 'python-mode-hook #'elpy-enable)

; rust stuff
(use-package rust-mode)
(use-package flycheck-rust)
(use-package racer)
(setq racer-cmd "/Users/tomaszk/.cargo/bin/racer")
(setq racer-rust-src-path "/Users/tomaszk/Development/github-clones/rust/src/")
(setq flycheck-rust-cargo-executable "/usr/local/bin/cargo")
(setq flycheck-rust-executable "/usr/local/Cellar/rust/1.8.0//bin/rustc")
(setq rust-rustfmt-bin "~/.cargo/bin/rustfmt")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)


; Look and feel stuff
;(use-package sublime-themes)
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(use-package monokai-theme)
(set-default-font "Monaco")
(scroll-bar-mode -1)
(load-theme 'monokai t)
(tool-bar-mode -1)

(defun swap-meta-and-super ()
  "Swap the mapping of meta and super. Very useful for people using their Mac
with a Windows external keyboard from time to time."
  (interactive)
  (if (eq mac-command-modifier 'super)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (message "Command is now bound to META and Option is bound to SUPER."))
    (progn
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta)
      (message "Command is now bound to SUPER and Option is bound to META."))))

(global-set-key (kbd "C-c w") 'swap-meta-and-super)




;;;init.el enDs Here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1e3b2c9e7e84bb886739604eae91a9afbdfb2e269936ec5dd4a9d3b7a943af7f" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(package-selected-packages
   (quote
    (monokai-theme rainbow-delimiters racer flycheck-rust rust-mode elpy scala-mode helm-ag ag iedit which-key flycheck helm-company company helm-projectile projectile helm exec-path-from-shell neotree use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

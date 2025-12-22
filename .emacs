;;;;;;;;;;;;;;;;;;;;
;; Packages Stuff ;;
;;;;;;;;;;;;;;;;;;;;

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
		  ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(defun my/pkg-i (pkg)
  "Adds a package `pkg`"
  (unless (package-installed-p pkg)
    (package-install pkg)))

;;;;;;;;;;;;;;;;;;;
;; Actual Config ;;
;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(indent-tabs-mode 0)
(tab-bar-mode t)
(setq inhibit-startup-screen 1)

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(set-frame-font "Menlo 16")

(setq tab-width 3)
(setq c-basic-offset 3)
(setq scroll-margin 3)
(setq scroll-conservatively 101)
(setq mouse-wheel-scroll-amount 3)
(setq backup-inhibited t)
(setq word-wrap t)

(global-set-key (kbd "<C-tab>") 'tab-bar-switch-to-next-tab)
(global-set-key (kbd "<C-S-tab>") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "C-x C-p") 'previous-line)
(global-set-key (kbd "C-x C-n") 'next-line)
(global-set-key (kbd "C-x f") 'find-file)

(my/pkg-i 'eglot)
(my/pkg-i 'cmake-mode)
(my/pkg-i 'magit)

(my/pkg-i 'htmlize)
(my/pkg-i 'package-lint)
(my/pkg-i 'package-lint-flymake)
(my/pkg-i 'package-build)

(my/pkg-i 'royal-hemlock-theme)
(load-theme 'royal-hemlock)

(setq package-archive-zip-program '("gtar" "-z" "--no-same-owner"))

(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(setq org-startup-truncated nil)
(setq word-wrap t)

;; Eglot
(require 'eglot)
(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)
(add-hook 'cmake-mode-hook #'eglot-ensure)

;; dape
(my/pkg-i 'dape)

;;;;;;;;;;;;;;;;;;;;;;;;
;; EMACS-ADDED CONFIG ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(setq gc-cons-threshold 50000000)

(unless (display-graphic-p) (xterm-mouse-mode 1))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)

(custom-set-faces
 '(default ((t (:family "Hack Nerd Font" :foundry "SRC" :slant normal :weight regular :height 120 :width normal))))
 '(ansi-color-bold ((t (:inherit bold :foreground "#f5466d"))))
 '(font-latex-bold-face ((t (:inherit bold :foreground "#bd93f9"))))
 '(font-latex-italic-face ((t (:inherit italic :foreground "#bd93f9"))))
 '(font-latex-math-face ((t (:foreground "#37D5ED"))))
 '(font-lock-builtin-face ((t (:foreground "#bd93f9"))))
 '(font-lock-comment-face ((t (:foreground "#f0a5c0"))))
 '(font-lock-constant-face ((t (:foreground "#f0a5c0"))))
 '(font-lock-function-name-face ((t (:foreground "#e3c7fb"))))
 '(font-lock-keyword-face ((t (:foreground "#8897f4"))))
 '(font-lock-string-face ((t (:foreground "#8897f4"))))
 '(font-lock-type-face ((t (:inherit deafult :foreground "#f5466d"))))
 '(font-lock-variable-name-face ((t (:foreground "#e3c7fc"))))
 '(link ((t (:foreground "purple" :underline t))))
 '(nix-builtin-face ((t (:inherit font-lock-builtin-face :foreground "#f0a5c0"))))
 '(nix-constant-face ((t (:inherit font-lock-constant-face :foreground "#bd93f9"))))
 '(nix-keyword-face ((t (:inherit font-lock-keyword-face :foreground "#f5466d")))))
(set-face-background 'default "#191724")
(set-face-foreground 'default "#e3c7fb")
(set-face-background 'mode-line "#191724")

; Evil emacs
(require 'evil
	 (evil-mode 1)
	 (evil-set-undo-system 'undo-tree))

; Ivy 
(require 'ivy
	 (ivy-mode))

; Undo tree
(require 'undo-tree)
(global-undo-tree-mode 1)

; PDF viewer
 (with-eval-after-load 'tex
    (add-to-list 'TeX-view-program-selection
                 '(output-pdf "Zathura")))

; Treemacs and other things
(treemacs)

(require 'flycheck
	 (global-flycheck-mode))

(require 'company-mode
	 (global-company-mode))


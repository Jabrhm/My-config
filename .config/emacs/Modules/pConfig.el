; Evil emacs
(require 'evil
	 (evil-mode 1)
	 (evil-set-undo-system 'undo-tree))

; PDF viewer
 (with-eval-after-load 'tex
    (add-to-list 'TeX-view-program-selection
                 '(output-pdf "Zathura")))

;; Other modes
(global-undo-tree-mode 1)
(vertico-mode)
(global-flycheck-mode)
(global-company-mode)
(marginalia-mode)

(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles partial-completion)))
      completion-pcm-leading-wildcard t) ;; Emacs 31: partial-completion behaves like substring

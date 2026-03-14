(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-overrides '((file (styles partial-completion)))
      completion-pcm-leading-wildcard t) ;; Emacs 31: partial-completion behaves like substring

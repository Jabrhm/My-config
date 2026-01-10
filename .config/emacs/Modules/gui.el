;; Frame and numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)
(push '(tool-bar-lines . 0) default-frame-alist)
(add-to-list 'default-frame-alist '(undecorated . t))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-parameter nil 'alpha-background 60)
(add-to-list 'default-frame-alist '(alpha-background . 50))


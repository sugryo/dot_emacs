;; utf-8 にする
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)

;; Mozc Setting
(require 'mozc)
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)

;; Rubyの時、標準でutf-8になるから
;; マジックコメントいらない
(setq ruby-insert-encoding-magic-comment nil)

;; C-hで字を消せるようにする
(keyboard-translate ?\C-h ?\C-?)

;; C-tでウィンドウ切り替え
(define-key global-map (kbd "C-t") 'other-window)

;; カラム番号表示
(column-number-mode t)

;; 時計(24時間表示)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)

;; バッテリ残量表示(今は、いらないかも)
(display-battery-mode t)

;; ファイルサイズを表示
(size-indication-mode t)

;; Cask Setting
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Ruby Setting
(add-to-list 'auto-mode-alist '("\\.rb$latex" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(setq ruby-indent-level 2)
(setq ruby-indent-tabs-mode t)
(setq tab-width 2)

;; Ruby-electric Setting
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list t)

;; Ruby-block Setting
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highloght-toggle 'nothing)

;; Auto-Complete Setting
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
  "~/ac-dict")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-config-default)

;; Flymake-Ruby Setting
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; Flycheck-Ruby Setting
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'ruby-mode-hook 'flycheck-mode)

;; Markdown-mode Setting
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; CoffeeScript-mode Setting
(defun coffee-custom () "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2)))
(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; Rubocop Setting
(add-hook 'ruby-mode-hook 'rubycop-mode)

;; Twittering-mode Setting
(setq twittering-use-master-password t)

;; Ruby-end
(require 'ruby-end)

;; Milkode Setting
(require 'milkode)
;; Shortcut setting
(global-set-key (kbd "M-g") 'milkode:search)
(global-set-key (kbd "M-s") 'milkode:search-at-point)

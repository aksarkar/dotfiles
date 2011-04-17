; Local elisp directory
(add-to-list 'load-path "~/.emacs.d/lisp/")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

; Color themes
(require 'color-theme)
(require 'color-theme-solarized)

; Solarized color theme
(color-theme-solarized-light)

; Get around UNIX selection nonsense
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

; Set window title
(setq frame-title-format '(buffer-file-name "%f - Emacs" "Emacs")) 

; Do not create newline on Ctrl-n.
(setq next-line-add-newlines nil)

; Turn off bell on error
(setq visible-bell nil)

; Scroll up/down one line only when cursor is at top/bottom of page.
(setq scroll-conservatively 1000)

; Auto fill lines
(setq-default fill-column 79)
(auto-fill-mode)

; Stop forcing me to spell out "yes"
(fset 'yes-or-no-p 'y-or-n-p) 

; Put backups and autosaves in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

; Remove superfluous GUI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

; Disable splash screen
(setq inhibit-startup-message t)

; Disable scratch message
(setq initial-scratch-message nil)

; Enable syntax highlighting
(global-font-lock-mode 't)
(setq font-lock-support-mode 'jit-lock-mode)

; Show (in)correctly matched parantheses
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

; Disable blinking cursor
(blink-cursor-mode 0)

; ISwitch buffers
(iswitchb-mode t)

; Make editing CamelCase less painful
(global-subword-mode t)

; Make eshell completion match bash
(setq eshell-cmpl-cycle-completions nil)

; C comments
(add-hook 'c-mode-hook
          '(lambda()
             (setq comment-start "//")
             (setq comment-end "")))

; Google C/C++ style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; Run XeLaTeX from tex-compile
(add-hook 'tex-mode-hook
          '(lambda()
             (add-to-list 'tex-compile-commands 
                          '("xelatex --papersize=letter %r" 
                            "%r.tex" "%r.pdf"))))

; Modeline
(setq display-time-day-and-date nil)
(line-number-mode 1)
(column-number-mode 1)
(which-function-mode 1)
(setq default-mode-line-format
      (quote ("-" (line-number-mode "L%l-")
	      (column-number-mode "C%c-")
	      mode-line-modified mode-line-frame-identification
	      mode-line-buffer-identification " "
	      global-mode-string " ("
	      mode-name mode-line-process minor-mode-alist "%n" ")-"
	      (which-func-mode
	       ("" which-func-format "-")) (-3 . "%p") "-%-")))

; Always display line number
(setq line-number-display-limit nil)

; Enable incremental completion
(icomplete-mode 1)

; Always indent using spaces
(setq-default indent-tabs-mode nil)

; When mark is active, highlight selected region
(transient-mark-mode 1)

; Don't automatically page up/down when scrolling
(setq scroll-preserve-screen-position t)

; Use aspell instead of ispell
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")

; Python mode
(load-library "python-mode")
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

; nXhtml mode
(load "~/.lisp/nxhtml/autostart.el")

; PHP mode
(require 'php-mode)

; js2 (Javascript) mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-use-font-lock-faces t)

; TRAMP mode
(setq tramp-default-method "ssh")

; Haskell mode
(load "~/.emacs.d/lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)

; Tuareg mode (OCaml)
(add-to-list 'load-path "~/.lisp/tuareg-mode")
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

; git
(require 'git)
(require 'gitsum)

; Compile the current Java buffer
(defun javac-current()
  (interactive)
  (compile (concat "javac " buffer-file-name)))

(add-hook 'java-mode-hook
          (lambda ()
            (local-set-key "\C-c\C-c" 'javac-current)))

;; FIXME temp hack to get a little better java 1.5 support
(let* ((java-keywords
        (eval-when-compile
          (regexp-opt
           '("catch" "do" "enum" "else" "super" "this" "finally" "for" "if"
             ;; Anders Lindgren <****> says these have gone. "cast" "byvalue"
             ;; "future" "generic" "operator" "var" "inner" "outer" "rest"
             "implements" "extends" "throws" "instanceof" "new" "interface"
             "return" "switch" "throw" "try" "while"))))
       ;;
       ;; Classes immediately followed by an object name.
       (java-type-names
        `(mapconcat 'identity
                    (cons
                     ,(eval-when-compile
                        (regexp-opt '("boolean" "char" "byte" "short" "int"
                        "long"
                                      "float" "double" "void")))
                     java-font-lock-extra-types)
                    "\\|")) (java-type-names-depth `(regexp-opt-depth
       ,java-type-names))
       ;;
       ;; These are eventually followed by an object name.
       (java-type-specs
        (eval-when-compile
          (regexp-opt
           '("abstract" "const" "final" "synchronized" "transient" "static"
             ;; Anders Lindgren <****> says this has gone. "threadsafe"
             "volatile" "public" "private" "protected" "native"
             ;; Carl Manning <caroma@xxxxxxxxxx> says this is new.
             "strictfp")))) )

  (setq java-font-lock-keywords-3
        (append

         (list
          ;; support static import statements
          '("\\<\\(import\\)\\>\\s-+\\(static\\)\\s-+\\(\\sw+\\)"
            (1 font-lock-keyword-face) (2 font-lock-keyword-face) (3 (if (equal
            (char-after (match-end 0)) ?\.)
                   'jde-java-font-lock-package-face 'font-lock-type-face))
            ("\\=\\.\\(\\sw+\\)" nil nil
             (1 (if (and (equal (char-after (match-end 0)) ?\.)
                         (not (equal (char-after (+ (match-end 0) 1)) ?\*)))
                    'jde-java-font-lock-package-face
                  'font-lock-type-face)))) )

         java-font-lock-keywords-2

         ;;
         ;; More complicated regexps for more complete highlighting for types.
         ;; We still have to fontify type specifiers individually, as Java is
         ;; hairy.
         (list
          ;;
          ;; Fontify class names with ellipses
          `(eval .
                 (cons (concat "\\<\\(" ,java-type-names "\\)\\>\\.\\.\\.[^.]")
                       '(1 font-lock-type-face)))
          ;;
          ;; Fontify random types immediately followed by an item or items.
          `(eval .
                 (list (concat "\\<\\(\\(?:" ,java-type-names "\\)"
                               "\\(?:\\(?:<.*>\\)\\|\\>\\)\\(?:\\.\\.\\.\\)?\\)"
                               "\\([ \t]*\\[[ \t]*\\]\\)*"
                               "\\([ \t]*\\sw\\)")
                       ;; Fontify each declaration item.
                       (list
                       'font-lock-match-c-style-declaration-item-and-skip-to-next
                             ;; Start and finish with point after the type
                             ;; specifier.
                             (list 'goto-char (list 'match-beginning
                                                    (+ ,java-type-names-depth
                             3))) (list 'goto-char (list 'match-beginning
                                                    (+ ,java-type-names-depth
                             3)))
                             ;; Fontify as a variable or function name.
                             '(1 (if (match-beginning 2)
                                     font-lock-function-name-face
                                   font-lock-variable-name-face)))))
          ;;
          ;; Fontify those that are eventually followed by an item or items.
          (list (concat "\\<\\(" java-type-specs "\\)\\>"
                        "\\([ \t]+\\sw+\\>"
                        "\\([ \t]*\\[[ \t]*\\]\\)*"
                        "\\)*")
                ;; Fontify each declaration item.
                '(font-lock-match-c-style-declaration-item-and-skip-to-next
                  ;; Start with point after all type specifiers.
                  (goto-char (or (match-beginning 5) (match-end 1)))
                  ;; Finish with point after first type specifier.
                  (goto-char (match-end 1))
                  ;; Fontify as a variable or function name.
                  (1 (if (match-beginning 2)
                         font-lock-function-name-face
                       font-lock-variable-name-face))))))))

; Key bindings
(global-set-key "\C-z" 'undo)  ; Use C-z for undo instead of minimize
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-&" 'replace-string)
(global-set-key "\M-#" 'query-replace-regexp)
(global-set-key "\M-$" 'replace-regexp)
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-unset-key "\e[")
(global-set-key "\eOP" 'help-command)
(global-set-key "\e[C" 'forward-char)
(global-set-key "\e[D" 'backward-char)
(global-set-key "\e[A" 'previous-line)
(global-set-key "\e[B" 'next-line)
(global-set-key "\eOv" 'forward-char)
(global-set-key "\eOt" 'backward-char)
(global-set-key "\eOx" 'previous-line)
(global-set-key "\eOr" 'next-line)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:inherit font-lock-warning))))
 '(flymake-warnline ((t (:inherit font-lock-warning))))
 '(font-wikipedia-bold-face ((((class color) (background dark)) (:inherit bold))))
 '(font-wikipedia-italic-face ((((class color) (background dark)) (:inherit italic))))
 '(font-wikipedia-math-face ((((class color) (background dark)) (:inherit font-lock-string-face))))
 '(font-wikipedia-string-face ((((class color) (background dark)) (:inherit font-lock-string-face))))
 '(font-wikipedia-verbatim-face ((((class color) (background dark)) (:inherit font-lock-keyword-face))))
 '(font-wikipedia-warning-face ((((class color) (background dark)) (:inherit font-lock-warning))))
 '(git-status-face ((((class color) (background dark)) (:inherit font-lock-warning-face))))
 '(git-unknown-face ((((class color) (background dark)) nil)))
 '(git-unmerged-face ((((class color) (background dark)) (:inherit font-lock-warning))))
 '(git-uptodate-face ((((class color) (background dark)) (:inherit font-lock-comment))))
 '(js2-warning-face ((t (:inherit font-lock-warning))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) (:background "#3f3f3f"))))
 '(mumamo-background-chunk-submode ((((class color) (min-colors 88) (background dark)) (:background "#303030")))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(asm-comment-char 35)
 '(c-basic-offset 4)
 '(js2-basic-offset 4)
 '(js2-mode-indent-ignore-first-tab t)
 '(max-lisp-eval-depth 4096)
 '(max-specpdl-size 10000)
 '(mumamo-chunk-coloring (quote submode-colored))
 '(nxhtml-skip-welcome t)
 '(py-python-command "python2")
 '(python-python-command "python2")
 '(sentence-end-double-space nil)
 '(tab-width 4))

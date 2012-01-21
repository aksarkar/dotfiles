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

(add-hook 'tex-mode-hook
          '(lambda()
             ; Run XeLaTeX from tex-compile
             (add-to-list 'tex-compile-commands 
                          '("xelatex --papersize=letter %r" 
                            "%r.tex" "%r.pdf"))
             (flyspell-mode 1)
             (auto-fill-mode 1)))

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
	      (which-func-mode ("" which-func-format "-"))
          (-3 . "%p") "-%-")))

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

; Use hunspell instead of ispell
(setq ispell-program-name "hunspell")

; Python mode
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python3-mode))

; js2 (Javascript) mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-use-font-lock-faces t)

; TRAMP mode
(setq tramp-default-method "ssh")

; Haskell mode
(load "~/.emacs.d/lisp/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'font-lock-mode)

; Wikipedia mode
(require 'wikipedia-mode)

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

; rcirc
(require 'rcirc-controls)
(defun rcirc-urgency-hint (process sender response target text)
  (let ((frame (selected-frame)))
    (when (and (eq (framep frame) 'x)   ; Only X11 frames
               (not (string= (rcirc-nick process) sender))
               (not (string= (rcirc-server-name process) sender))
               (or (string-match (rcirc-nick process) text) ; hl
                   (not (string-match "^[&#]" target))))    ; query
      (let* ((wm-hints (append (x-window-property
                                "WM_HINTS" frame "WM_HINTS"
                                (string-to-number
                                 (frame-parameter frame 'outer-window-id))
                                nil t) nil))
             (flags (car wm-hints)))
        (setcar wm-hints (logior flags #x00000100))
        (x-change-window-property "WM_HINTS" wm-hints frame "WM_HINTS" 32 t)))))
(defun rcirc-bell (process sender response target text)
  (let ((frame (selected-frame)))
    (when (and (not window-system)  ; only terminal
               (not (string= (rcirc-nick process) sender))
               (not (string= (rcirc-server-name process) sender))
               (or (string-match (rcirc-nick process) text) ; hl
                   (not (string-match "^[&#]" target))))    ; query
      (send-string-to-terminal "^G"))))
(add-hook 'rcirc-print-hooks 'rcirc-urgency-hint)
(add-hook 'rcirc-print-hooks 'rcirc-bell)

(defadvice rcirc-format-response-string (after dim-entire-line)
  "Dim whole line for senders whose nick matches `rcirc-dim-nicks'."
  (when (and rcirc-dim-nicks sender
             (string-match (regexp-opt rcirc-dim-nicks 'words) sender))
    (setq ad-return-value (rcirc-facify ad-return-value 'rcirc-dim-nick))))
(ad-activate 'rcirc-format-response-string)

(setq rcirc-server-alist
      '(("irc.foonetic.net" :channels ("#xkcd" "#xkcd-compsci" "#xkcd-cs"))
        ("im.bitlbee.org" :channels ("&bitlbee"))))
(load "~/.emacs.d/lisp/my-rcirc-auth.el")
(setq rcirc-default-full-name "A. Sarkar")
(setq rcirc-fill-prefix "      ")
(setq rcirc-time-format "%H:%M ")
(setq rcirc-buffer-maximum-lines 500)
(setq rcirc-omit-threshold 0)

(add-hook 'rcirc-mode-hook 
          '(lambda()
             (rcirc-track-minor-mode 1)
             (rcirc-omit-mode)
             (flyspell-mode 1)))

(defun rcirc-mode-p (buffer-name)
  (eq (buffer-local-value 'major-mode (get-buffer buffer-name)) 'rcirc-mode))

(defun rcirc-track-clear-activity ()
  (interactive)
  (mapc 'rcirc-clear-activity
        (remove-if-not 'rcirc-mode-p (buffer-list)))
  (rcirc-update-activity-string)
  (force-mode-line-update t))

; ibuffer
(setq ibuffer-display-summary nil)
(setq ibuffer-default-sorting-mode 'alphabetic)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("irc" (mode . rcirc-mode))
               ("git" (name . "^\\*git.*\\*$"))
               ("emacs" (name . "^\\*.*\\*$"))))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

; Key bindings
(global-set-key "\C-z" 'undo)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-&" 'replace-regexp)
(global-set-key "\C-x\C-b" 'ibuffer)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "conkeror")
 '(js2-basic-offset 4)
 '(js2-mode-indent-ignore-first-tab t)
 '(max-lisp-eval-depth 4096)
 '(max-specpdl-size 10000)
 '(py-python-command "python")
 '(python-python-command "python")
 '(sentence-end-double-space nil)
 '(solarized-degrade nil)
 '(solarized-termcolors 16)
 '(tab-width 4))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

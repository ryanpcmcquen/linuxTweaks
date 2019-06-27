(setq-default
    tab-always-indent 'complete
    indent-tabs-mode nil
    tab-width 4
    default-tab-width 4
    tab-stop-list (quote (4 8))
    standard-indent 4
    tab-indent-level 4

    ;; A global option would be phenomenal.
    c-basic-indent 4
    c-basic-offset 4
    c-indent-level 4
    cperl-indent-level 4
    cpython-indent-level 4
    css-indent-level 4
    css-indent-offset 4
    ess-indent-level 4
    html-basic-offset 4
    html-tab-width 4
    java-basic-offset 4
    java-tab-width 4
    jde-basic-offset 4
    jde-tab-width 4
    js-indent-level 4
    lisp-indent-offset 4
    lua-indent-level 4
    perl-indent-level 4
    py-indent-offset 4
    python-indent-offset 4
    r-indent-level 4
    sgml-basic-offset 4
    sgml-indent-level 4
    sh-basic-offset 4
    sh-tab-width 4
    xml-basic-offset 4
    xml-tab-width 4

    ;; Do not clutter the world with temp files.
    backup-directory-alist
        `((".*" . ,temporary-file-directory))
    auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))

    ;; Highlight code blocks in Org mode.
    org-src-fontify-natively t
)

;; Show matching parens.
(show-paren-mode 1)

;; Automatially indent on newlines and such.
(electric-indent-mode 1)

;; No line numbers, as they take
;; away from the immersion and
;; can occasionally hurt
;; performance.
(global-linum-mode 0)

;; Start somewhere sane, rather
;; than the directory where
;; emacs lives.
(setq default-directory "~/")

;; Increase default font size.
(set-face-attribute 'default nil :height 125)

(custom-set-variables
    '(inhibit-startup-screen t)
    '(initial-frame-alist (quote
        ((fullscreen . maximized))
        )
    )
)


;;; naysayer-theme.el --- The naysayer color theme

;; Author: Nick Aversano <nickav@users.noreply.github.com>
;; Version: 0.2
;; Filename: naysayer-theme.el
;; Package-Requires: ((emacs "24"))
;; URL: https://github.com/nickav/naysayer-theme.el
;; License: GPL-3+

;;; Commentary:

;; Dark green blue color scheme with tan colors. Inspired by Jonathan Blow's compiler livestreams.

;;; Code:

(unless (>= emacs-major-version 24)
  (error "The naysayer theme requires Emacs 24 or later!"))

(deftheme naysayer "The naysayer color theme")

;; Monokai colors
(defcustom naysayer-theme-yellow "#E6DB74" "Primary colors - yellow" :type 'string :group 'monokai)
(defcustom naysayer-theme-orange "#FD971F" "Primary colors - orange" :type 'string :group 'monokai)
(defcustom naysayer-theme-red "#F92672" "Primary colors - red" :type 'string :group 'monokai)
(defcustom naysayer-theme-magenta "#FD5FF0" "Primary colors - magenta" :type 'string :group 'monokai)
(defcustom naysayer-theme-blue "#66D9EF" "Primary colors - blue" :type 'string :group 'monokai)
(defcustom naysayer-theme-green "#A6E22E" "Primary colors - green" :type 'string :group 'monokai)
(defcustom naysayer-theme-cyan "#A1EFE4" "Primary colors - cyan" :type 'string :group 'monokai)
(defcustom naysayer-theme-violet "#AE81FF" "Primary colors - violet" :type 'string :group 'monokai)

(let ((background "#082628")
      (gutters    "#082628")
      (gutter-fg  "#082628")
      (gutters-active "#082628")
      (builtin      "#ffffff")
      (selection  "#0000ff")
      (text       "#d2b58d")
      (comments   "#67cd5d")
      (punctuation "#86E08F")
      (keywords "#ffffff")
      (variables "#d4d4d4")
      (functions "#d4d4d4")
      (methods    "#d4d4d4")
      (strings    "#2ec09c")
      (constants "#8fe1c8")
      (macros "#86E08F")
      (white     "#ffffff")
      (error "#ff0000")
      (warning "#ffaa00")
      (highlight-line "#0b3335")
      (line-fg "#126367"))

  (custom-theme-set-faces
   'naysayer

   ;; Default colors
   ;; *****************************************************************************

   `(default                          ((t (:foreground ,text :background ,background, :weight normal))))
   `(region                           ((t (:foreground nil :background ,selection))))
   `(cursor                           ((t (:background ,white                        ))))
   `(fringe                           ((t (:background ,background   :foreground ,white))))
   `(linum                            ((t (:background ,background :foreground ,gutter-fg))))
   `(highlight ((t (:foreground nil :background ,selection))))

   ;; Font lock faces
   ;; *****************************************************************************

   `(font-lock-keyword-face           ((t (:foreground ,keywords, :weight normal))))
   `(font-lock-type-face              ((t (:foreground ,punctuation))))
   `(font-lock-constant-face          ((t (:foreground ,constants))))
   `(font-lock-variable-name-face     ((t (:foreground ,variables))))
   `(font-lock-builtin-face           ((t (:foreground ,builtin))))
   `(font-lock-string-face            ((t (:foreground ,strings))))
   `(font-lock-comment-face           ((t (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comments))))
   `(font-lock-function-name-face     ((t (:foreground ,functions))))
   `(font-lock-doc-string-face        ((t (:foreground ,strings))))
   `(font-lock-preprocessor-face      ((t (:foreground ,macros))))

   ;; Plugins
   ;; *****************************************************************************
   `(trailing-whitespace ((t (:foreground nil :background ,warning))))
   `(whitespace-trailing ((t (:background nil :foreground ,warning :inverse-video t))))

   `(linum ((t (:foreground ,line-fg :background ,background))))
   `(linum-relative-current-face ((t (:foreground ,line-fg :background ,background))))
   `(line-number ((t (:foreground ,line-fg :background ,background))))
   `(line-number-current-line ((t (:foreground ,white :background ,background))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,highlight-line))))
   `(hl-line-face ((t (:background ,highlight-line))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,naysayer-theme-violet))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,naysayer-theme-blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,naysayer-theme-green))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,naysayer-theme-yellow))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,naysayer-theme-orange))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,naysayer-theme-red))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,naysayer-theme-violet))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,naysayer-theme-blue))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,naysayer-theme-green))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,naysayer-theme-yellow))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,naysayer-theme-orange))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,naysayer-theme-red))))

   ;; mode-line and powerline
   `(mode-line-buffer-id ((t (:foreground ,background :distant-foreground ,text :text ,text :weight bold))))
   `(mode-line ((t (:inverse-video unspecified
                                   :underline unspecified
                                   :foreground ,background
                                   :background ,text
                                   :box nil))))
   `(powerline-active1 ((t (:background ,text :foreground ,background))))
   `(powerline-active2 ((t (:background ,text :foreground ,background))))

   `(mode-line-inactive ((t (:inverse-video unspecified
                                            :underline unspecified
                                            :foreground ,text
                                            :background ,background
                                            :box nil))))
   `(powerline-inactive1 ((t (:background ,background :foreground ,text))))
   `(powerline-inactive2 ((t (:background ,background :foreground ,text))))
  )

  (custom-theme-set-variables
    'naysayer
    '(linum-format " %5i ")
  )
)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;; *****************************************************************************

(provide-theme 'naysayer)

;; Local Variables:
;; no-byte-compile: t
;; End:

(provide 'naysayer-theme)

;;; naysayer-theme.el ends here

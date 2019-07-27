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
)

; Jon Blow's Emacs color scheme:
; https://www.twitch.tv/naysayer88/clip/SpoopyEphemeralClipzTriHard
; https://pastebin.com/5tTEjWjL

(custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(default ((t (:foreground "#d3b58d" :background "#041818"))))
    '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
    '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
    '(font-lock-builtin-face ((t nil)))
    ; '(font-lock-comment-face ((t (:foreground "yellow"))))
    '(font-lock-comment-face ((t (:foreground "#3fdflf"))))
    '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white"))))
    '(font-lock-keyword-face ((t (:foreground "white" ))))
    ; '(font-lock-string-face ((t (:foreground "gray160" :background "gray16"))))
    '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
    '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))
    ; '(font-lock-warning-face ((t (:foreground "#695a46"))))
    '(font-lock-warning-face ((t (:foreground "#504038"))))
    '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
    '(mode-line ((t (:inverse-video t))))
    '(region ((t (:background "blue"))))
    '(widget-field-face ((t (:foreground "white"))) t)
    '(widget-single-line-field-face ((t (:background "darkgray"))) t)
)

(global-font-lock-mode 1)
(set-cursor-color "lightgreen")
(set-background-color "#072626")
;(global-set-key [C-return] 'save-buffer)

;(set-face-attribute 'default nil :font "Anonymous Pro-14")
;(set-face-attribute 'default nil :font "Consolas-174")

(set-face-foreground 'font-lock-builtin-face "lightgreen")

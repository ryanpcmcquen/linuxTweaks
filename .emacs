(setq-default
    indent-tabs-mode nil
    default-tab-width 4
    tab-width 4
    tab-stop-list (quote (4 8))
    standard-indent 4
    tab-indent-level 4

    ;; A global option would be phenomenal.
    c-basic-offset 4
    c-indent-level 4
    cperl-indent-level 4
    cpython-indent-level 4
    css-indent-level 4
    css-indent-offset 4
    html-basic-offset 4
    html-tab-width 4
    java-basic-offset 4
    java-tab-width 4
    jde-basic-offset 4
    jde-tab-width 4
    js-indent-level 4
    lua-indent-level 4
    php-indent-offset 4
    py-indent-offset 4
    python-indent-offset 4
    sgml-indent-level 4
    sh-basic-offset 4
    sh-tab-width 4
    xml-basic-offset 4
    xml-tab-width 4

    linum-format "%d "
    backup-directory-alist
        `((".*" . ,temporary-file-directory))
    auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))
)

(electric-indent-mode 1)

(global-linum-mode 1)


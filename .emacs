(setq-default
    indent-tabs-mode nil
    tab-width 4
    tab-stop-list (number-sequence 4 20000 4)
    linum-format "%d "
    backup-directory-alist
        `((".*" . ,temporary-file-directory))
    auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))
)
(global-linum-mode 1)

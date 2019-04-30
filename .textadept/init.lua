-- 4 spaces FTW!
buffer.tab_width = 4
buffer.use_tabs = false

-- Turn on line wrapping:
buffer.wrap_mode = buffer.WRAP_WORD

-- https://foicica.com/textadept/api.html#textadept.editing.auto_pairs
-- Do not automatically generate pairs
-- for certain characters
-- (', ", (, [, {).
textadept.editing.auto_pairs = nil

-- Trim trailing whitespace:
textadept.editing.strip_trailing_spaces = true

-- Increase font size for GUI:
buffer:set_theme(
    'light',
    {
        font = 'IBM Plex Mono',
        fontsize = 15
    }
)
-- Interpret PICO-8 files as Lua.
textadept.file_types.extensions.p8 = 'lua'

-- Make Alt have the same functionality as
-- Ctrl with word selection using Shift.
-- Since the default functionality
-- makes no sense.
keys.asleft = buffer.word_left_extend
keys.asright = buffer.word_right_extend

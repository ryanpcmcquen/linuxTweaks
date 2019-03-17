-- 4 spaces FTW!
buffer.tab_width = 4
buffer.use_tabs = false

-- Turn on line wrapping:
buffer.wrap_mode = buffer.WRAP_WORD

-- Increase font size for GUI:
buffer:set_theme(
    'light',
    {
        font = 'IBM Plex Mono',
        fontsize = 18
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

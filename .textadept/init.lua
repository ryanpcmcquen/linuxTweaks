-- 4 spaces FTW!
buffer.tab_width = 4
buffer.use_tabs = false
-- Increase font size for GUI:
buffer:set_theme(
    'light',
    {
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

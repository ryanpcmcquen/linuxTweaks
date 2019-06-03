-- 4 spaces FTW!
buffer.tab_width = 4
buffer.use_tabs = false

-- Do not show line numbers.
events.connect(
    events.VIEW_NEW,
    function()
        buffer.margin_width_n[0] = 0
    end
)
events.connect(
    events.FILE_OPENED,
    function()
        buffer.margin_width_n[0] = 0
    end
)

-- Turn off line wrapping:
buffer.wrap_mode = buffer.WRAP_NONE

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
        font = 'IBM Plex Mono'
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

--
-- Formatting stuff!
--

--[[
JavaScript:
--]]
prettier = '/usr/local/bin/node /usr/local/bin/prettier --tab-width 4 --single-quote --no-semi --arrow-parens always --parser babel '

-- Format JavaScript with the 'Compile' command.
textadept.run.compile_commands.javascript = prettier .. '--write "%f"'

-- Format JavaScript before save:
events.connect(
    events.FILE_BEFORE_SAVE,
    function()
        if buffer:get_lexer() == 'javascript' then
            return textadept.editing.filter_through(
                prettier .. '--stdin'
            )
        else
            return
        end
    end
)

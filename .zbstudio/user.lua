--[[--
  Use this file to specify **System** preferences.
  Review [examples](+/Applications/ZeroBraneStudio.app/Contents/ZeroBraneStudio/cfg/user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--
output.fontname = "IBM Plex Mono"
output.fontsize = 18
editor.fontname = "IBM Plex Mono"
editor.fontsize = 16
editor.tabwidth = 4

-- Correct indentation on save (autoformat).
package {
    name = "Auto format files on save (Correct Indentation).",
    description = "Re-indents files before saving them.",
    author = "Ryan P. C. McQuen",
    version = 0.1,

    onEditorPreSave = function(self, editor)
        ide:GetMainFrame():ProcessEvent(
            wx.wxCommandEvent(
                wx.wxEVT_COMMAND_MENU_SELECTED,
                ID.REINDENT
            )
        )
    end,
}

-- Remove trailing whitespace on save.
package {
    name = "Strip trailing whitespaces on save",
    description = "Strips trailing whitespaces before saving a file.",
    author = "Paul Kulchenko",
    version = 0.1,

    onEditorPreSave = function(self, editor)
        for line = editor:GetLineCount()-1, 0, -1 do
            local spos, _, spaces = editor:GetLine(line):find("([ \t]+)([\r\n]*)$")
            if spos then
                editor:DeleteRange(editor:PositionFromLine(line)+spos-1, #spaces)
            end
        end
    end,
}

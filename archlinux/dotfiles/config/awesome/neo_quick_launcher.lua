-- Standard awesome library
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local result = { }
local btns = { }

btns["emacs"] = awful.widget.launcher({
    name = "emacs",
    --image = beautiful.awesome_icon,
    image = "/usr/share/icons/Faenza/apps/16/emacs.png",
    command = "env LC_ALL=zh_CN.UTF-8 /usr/bin/emacs"
})

result["btns"] = btns

return result

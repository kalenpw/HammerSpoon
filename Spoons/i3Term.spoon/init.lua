local obj = {}

obj.name = "i3Term"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
    hs.hotkey.bind({"cmd"}, "return", function()
        iTerm = hs.application.find("iTerm2")
        if iTerm ~= nil then
            local strNewWindow = {"Shell", "New Window"}
            iTerm:selectMenuItem(strNewWindow)
            hs.eventtap.keyStroke({"alt", "shift"}, "Z")
        else
            hs.application.launchOrFocus("iTerm")
        end
    end)
end

function obj:i3LikeOpenTerminal()
    hs.hotkey.bind({"cmd"}, "return", function()
        iTerm = hs.application.find("iTerm2")
        if iTerm ~= nil then
            local strNewWindow = {"Shell", "New Window"}
            iTerm:selectMenuItem(strNewWindow)
            hs.eventtap.keyStroke({"alt", "shift"}, "Z")
        else
            hs.application.launchOrFocus("iTerm")
        end
    end)
end

return obj
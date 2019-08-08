local obj = {}

obj.name = "MoveWindows"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
    hs.hotkey.bind({"shift", "alt"}, "right", function()
        focused = hs.window.focusedWindow()
        focused:moveOneScreenEast()
        reTile()
    end)

    hs.hotkey.bind({"shift", "alt"}, "left", function()
        focused = hs.window.focusedWindow()
        focused:moveOneScreenWest()
        reTile()
    end)
end

function reTile()
    hs.eventtap.keyStroke({"alt", "shift"}, "Z")
end

return obj
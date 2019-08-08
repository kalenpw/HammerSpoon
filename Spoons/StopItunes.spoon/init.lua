local obj = {}

obj.name = "StopItunes"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
    local wf = hs.window.filter
    wf.new({"iTunes"}):subscribe(wf.windowCreated, function(window, name, caller)
        window:focus()
        hs.eventtap.keyStroke({}, "escape")
        hs.eventtap.keyStroke({"cmd"}, "Q")
    end)
end

return obj
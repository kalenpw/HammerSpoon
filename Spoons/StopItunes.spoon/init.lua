local obj = {}

obj.name = "StopItunes"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
    local wf = hs.window.filter
    wf.new({"iTunes"}):subscribe(wf.windowCreated, function(window, name, caller)
        quitText = "Quit " .. name
        closeWindow = {name, quitText}
        window:application():selectMenuItem(closeWindow)
    end)
end

return obj
local obj = {}

obj.name = "ActuallyClose"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
    local wf = hs.window.filter
    windowsToClose = wf.new{
        "Firefox", "Code", "FileZilla",
        "MySQLWorkbench", "Spark", "Evernote", "Preview",
        "Safari", "Automator", "Activity Monitor"
    }
    windowsToClose:subscribe(wf.windowDestroyed, function(window, name, caller)
        window:focus()
        hs.eventtap.keyStroke({"cmd"}, "Q")
    end)
end

return obj
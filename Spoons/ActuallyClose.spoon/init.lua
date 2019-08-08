local obj = {}

obj.name = "ActuallyClose"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
    local wf = hs.window.filter
    windowsToClose = wf.new{
        "Code", "FileZilla", "Calculator", "TextEdit",
        "MySQLWorkbench", "Evernote", "Preview",
        "Safari", "Automator", "Activity Monitor"
    }
    windowsToClose:subscribe(wf.windowDestroyed, function(window, name, caller)
        quitText = "Quit " .. name
        closeWindow = {name, quitText}
        window:application():selectMenuItem(closeWindow)
    end)
end

return obj
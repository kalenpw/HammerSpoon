function actuallyClose()
    local wf = hs.window.filter
    windowsToClose = wf.new{
        "Chrome", "Firefox", "Code", "FileZilla",
        "MySQLWorkbench", "Spark", "Evernote", "Preview"
    }
    windowsToClose:subscribe(wf.windowDestroyed, function(window, name, caller)
        window:focus()
        hs.eventtap.keyStroke({"cmd"}, "Q")
    end)
end

function i3LikeOpenTerminal()
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

function stopiTunes()
    local wf = hs.window.filter
    wf.new({"iTunes"}):subscribe(wf.windowCreated, function(window, name, caller)
        window:focus()
        hs.eventtap.keyStroke({}, "escape")
        hs.eventtap.keyStroke({"cmd"}, "Q")
    end)
end

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

actuallyClose()
i3LikeOpenTerminal()
stopiTunes()

myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

function showAlert(message)
    hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
        hs.notify.new({title=message, informativeText="Hello World"}):send()
    end)
end

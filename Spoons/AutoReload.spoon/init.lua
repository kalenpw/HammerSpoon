local obj = {}

obj.name = "AutoReload"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
    myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/Documents/Hammerspoon/", reloadConfig):start()
    hs.alert.show("Config loaded")
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

function obj:showAlert(message)
    -- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.notify.new({title=message, informativeText="Hello World"}):send()
    -- end)
end

return obj
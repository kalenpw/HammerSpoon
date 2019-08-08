local obj = {}

obj.name = "ShowAlert"
obj.version = "1.0"
obj.author = "Kalen Williams"

function obj:init()
end

function obj:showAlert(message)
    -- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.notify.new({title=message, informativeText="Hello World"}):send()
    -- end)
end

return obj
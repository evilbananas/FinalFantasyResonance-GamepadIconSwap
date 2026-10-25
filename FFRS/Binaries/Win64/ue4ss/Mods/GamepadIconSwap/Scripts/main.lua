-- Icon set to show for gamepads: "PS5", "PS4" or "Switch"
local ICONS = "PS5"

local function controllerData(name)
    return StaticFindObject(string.format(
        "/Game/UI/Foundation/Platform/Input/Dev_%s/CommonInput_Gamepad_%s.Default__CommonInput_Gamepad_%s_C", name, name, name))
end

-- Copy the chosen icon set over the default (Xbox) one, once the controller data has loaded
local done = false
LoopAsync(1000, function()
    ExecuteInGameThread(function()
        if done then return end
        local default, wanted = controllerData("Windows"), controllerData(ICONS)
        if not (default and default:IsValid() and wanted and wanted:IsValid()) then return end

        local icons = {}
        local src = wanted.InputBrushDataMap
        for i = 1, #src do icons[src[i].Key.KeyName:ToString()] = src[i].KeyBrush.ResourceObject end

        local dst = default.InputBrushDataMap
        for i = 1, #dst do
            local icon = icons[dst[i].Key.KeyName:ToString()]
            if icon then dst[i].KeyBrush.ResourceObject = icon end
        end
        done = true
    end)
    return done
end)

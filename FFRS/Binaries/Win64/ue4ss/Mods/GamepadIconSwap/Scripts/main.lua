-- Icon set to show for gamepads: "PS5", "PS4" or "Switch"
local ICONS = "PS5"

local function controllerData(name)
    local data = StaticFindObject(string.format(
        "/Game/UI/Foundation/Platform/Input/Dev_%s/CommonInput_Gamepad_%s.Default__CommonInput_Gamepad_%s_C", name, name, name))
    return data and data:IsValid() and data or nil
end

-- The icon sets load at different times in the demo and the full game, so retry until both exist
local done = false
LoopAsync(1000, function()
    ExecuteInGameThread(function()
        if done then return end
        local default, wanted = controllerData("Windows"), controllerData(ICONS)
        if not (default and wanted) then return end
        default.InputBrushDataMap = wanted.InputBrushDataMap
        done = true
        print("[GamepadIconSwap] Swapped gamepad icons to " .. ICONS .. "\n")
    end)
    return done
end)

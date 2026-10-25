-- Icon set to show for gamepads: "PS5", "PS4" or "Switch"
local ICONS = "PS5"

local function controllerData(name)
    return StaticFindObject(string.format(
        "/Game/UI/Foundation/Platform/Input/Dev_%s/CommonInput_Gamepad_%s.Default__CommonInput_Gamepad_%s_C", name, name, name))
end

-- Replace the default (Xbox) icon set with the chosen one; controller data is loaded before this subsystem is created
NotifyOnNewObject("/Script/CommonInput.CommonInputSubsystem", function()
    controllerData("Windows").InputBrushDataMap = controllerData(ICONS).InputBrushDataMap
end)

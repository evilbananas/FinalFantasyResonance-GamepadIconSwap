# Final Fantasy Resonance - Gamepad Icon Swap

A [UE4SS](https://github.com/UE4SS-RE/RE-UE4SS) mod for **Final Fantasy Resonance** that shows **PS5**, **PS4** or **Switch** button icons instead of the Xbox ones.

Useful if the game shows Xbox icons with your PlayStation or Switch controller. It uses the game's own icon sets, swapped in memory, so no game files are modified.

Also works with the **Demo**.

## Requirements
- Final Fantasy Resonance or Final Fantasy Resonance Demo

UE4SS (experimental build v3.0.1-1181, required for Unreal Engine 5.6) is included in the download, so you don't need to install it separately.

## Installation

Download the zip for the icon set you want (PS5, PS4 or Switch) from [Releases](https://github.com/evilbananas/FinalFantasyResonance-GamepadIconSwap/releases) and extract it into the top-level game folder, the one containing `FFRS.exe`.

You should end up with:
```
FFRS\Binaries\Win64\
├── ue4ss\
│   ├── Mods\GamepadIconSwap\
│   ├── UE4SS.dll
│   ├── UE4SS-settings.ini
│   └── UE4SS_LICENSE.txt
└── dwmapi.dll
```

> If already using UE4SS, extract only the `ue4ss\Mods\GamepadIconSwap` folder into your existing UE4SS `Mods` folder.

To switch icon sets later, edit this line at the top of `ue4ss\Mods\GamepadIconSwap\Scripts\main.lua`:
```lua
local ICONS = "PS5" -- or "PS4" or "Switch"
```

## Uninstall
- **Remove the mod:** delete the `FFRS\Binaries\Win64\ue4ss\Mods\GamepadIconSwap` folder.
- **Remove UE4SS:** delete `dwmapi.dll` and the `ue4ss` folder from `FFRS\Binaries\Win64\`.

## Credits
- [UE4SS](https://github.com/UE4SS-RE/RE-UE4SS) experimental build v3.0.1-1181 by the UE4SS-RE team, included under the MIT License (see `UE4SS_LICENSE.txt`)

## License
[MIT](LICENSE)

# CFJoker
This mod adds a new CurseForge themed Joker card to game Balatro.

## Player Info

### Install Guide
1. Make sure you have downloaded and installed [Steamodded](https://github.com/Steamodded/smods) and [Lovely](https://github.com/ethangreen-dev/lovely-injector).
2. Download this mod from the [CurseForge](https://www.curseforge.com/balatro) page.
3. Unzip the mod file into your Balatro mods folder.
    - Windows: `%AppData%/Balatro/Mods`
    - Mac: `~/Library/Application Support/Balatro/Mods`
    - Linux: `~/.local/share/Steam/steamapps/compatdata/2379780/pfx/drive_c/users/steamuser/AppData/Roaming/Balatro/Mods`
4. The mod should not be loaded when you launch the game.

### Joker Info
The CurseForge Joker is an uncommon joker card that will give +10 chips for
each mod that you have installed. This joker appears in shops, joker booster
packs, and other places where jokers can be found. It is compatible with the
Blueprint joker and has a base cost of $6.

### Localization
This mod is only localized to english currently. We plan to add support for
more languages in a future update. If you speak another language 
localization PRs are welcome!

## Developer Info

### Language Server
This mod was developed using the [Lua extension by sumneko](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).
When properly configured, this extension will give you code completion based on
the available functions and globals. You can configure this extension by 
creating a `.luarc.json` file in the root of the project directory and adding
paths to the libraries you use. You likely want to include Steamodded and the
game code dump created by lovely.

```json
{
    "workspace": {
      "library": [
        "C:\\Users\\your_user\\AppData\\Roaming\\Balatro\\Mods\\Steamodded-main",
        "C:\\Users\\your_user\\AppData\\Roaming\\Balatro\\Mods\\lovely\\dump"
      ]
    }
  }
```

### Textures
Balatro requires a 1x and 2x resolution version of all textures. This means
that any changes made the the 1x textures must also be made to the 2x copy to 
maintain consistency. To make this easier, we create the textures at the 1x 
resolution and then upscale them to 2x using a nearest neighbor algorithm.

### Exporting
The project can be exported by zipping up the project directory. At minimum the
export must include `cfjoker.json`, `main.lua`, any additional source files,
and the `/assets` folder.

### Debug Mode
To help debug and test this mod we have added debug mode which can be enabled
by changing `local debug_mode = false` to true in `main.lua`. When debug mode
is enabled a new debug deck will be created that starts with a regular, holo,
foil, polychrome, and negative CurseForge joker card. It also starts with a 
negative blueprint card.
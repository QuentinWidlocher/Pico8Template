pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include src/globals.lua
#include src/states.lua
#include src/helpers.lua

#include src/models/default/object.model.lua
#include src/models/default/game-object.model.lua
#include src/models/default/vector.model.lua
#include src/models/default/box.model.lua
#include src/models/default/sprite.model.lua
#include src/models/default/camera.model.lua

#include src/models/player.model.lua

#include src/init/camera.init.lua
#include src/init/main.init.lua

#include src/update/camera.update.lua
#include src/update/main.update.lua

#include src/draw/debug.draw.lua
#include src/draw/main.draw.lua

__gfx__
0000000000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000cccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000cccccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000cccccc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000cccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

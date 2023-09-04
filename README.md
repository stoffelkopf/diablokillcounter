# Diablo Monster Killcounter / works with DevilutionX

The Diablo Killcounter reads the killdata from your savegame / Devilutionx memory and creates a HTML page

## Howto keep killcounts with your multiplayer char

- start a new multikplayer session in slay some monsters
- press escape -> new game
- press escape to main menu
- start a single player game and create a killcounter char
- press escape -> save your game and quit Diablo / DevilutionX

- when you start the game the next time start singleplayer and load you killcounter char
- press escape -> new game -> start your multiplayer session
- when done, press escape -> new game -> goto main menu
- this time select you killcounter char and select *new game* !!!!!!
- press escape -> save game and quit Diablo / Devilutionx

## How to create killcounter stats

### Easy way with Cheat Engine and DevilutionX

- start Devilution 1.5.0 or 1.5.1
- open the cheat table for your game version
- load killcounter char in single player
- in Cheat Engine open the "Table" menu -> "Show Cheat Table LUA Script"
- select you release version
- -  1 table data only for wordpress or other sites (you must upload the monster images to oyu webspace and change the imagepath1 var)
  -  0 for local data with complete html (imagepath will be images/)
- press the Execute Script Button
- copy the data from the output window

### Killdata from your D1 Save / DevilutionX save file

- download MPQEditor (http://www.zezula.net/en/mpq/download.html)
- Download LUA (https://github.com/rjpcomputing/luaforwindows/releases)
- compile the SV Tool (https://github.com/stoffelkopf/djavul/tree/master/cmd/sv)
- copy your single player savegame (single_0.hsv) to the programm folder
- edit the variables in the killcounter.lua script (release version etc.)
- start killcounter.bat

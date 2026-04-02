# Diablo Monster Killcounter / works with DevilutionX

The Diablo Killcounter reads the killdata from your savegame and creates a HTML page.

Example Page: [Diablo Killcounter](https://stoffelkopf.github.io/killcounter.html) 

## Howto keep killcounts with your multiplayer char

- start a new multiplayer session in kill some mobs
- press escape -> new game
- press escape -> to main menu
- start a single player game and create a killcounter char
- press escape -> save your game and quit Diablo / DevilutionX

- when you start the game the next time -> start singleplayer and load you killcounter char
- press escape -> new game -> start your multiplayer session
- when done, press escape -> new game -> goto main menu
- this time select you killcounter char and select *new game* !!!!!!
- press escape -> save game and quit Diablo / Devilutionx

## How to create killcounter stats

- download MPQEditor (http://www.zezula.net/en/mpq/download.html)
- download LUA 5.5
- copy your single player savegame (e.g. single_0.hsv) to the programm folder
- change the savegame filename in killcounter.cmd (standard: single_0.hsv)
- edit the variables in the killcounter.lua script
- start killcounter.bat
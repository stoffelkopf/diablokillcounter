@echo off
MPQEditor.exe /console killcounter.cmd
sv.exe game > game_tmp
del game
ren game_tmp game
lua54.exe killcounter.lua > killcounter.html

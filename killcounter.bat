@echo off
MPQEditor.exe extract single_0.hsv File00000000.xxx
sv.exe File00000000.xxx > game
lua54.exe killcounter.lua > killcounter.html
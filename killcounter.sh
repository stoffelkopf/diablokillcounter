smpq -L hellfire.txt -x single_0.hsv game
./sv game > game_tmp
rm game
mv game_tmp game
lua killcounter.lua > killcounter.html
rm game
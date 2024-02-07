local imagepath = "https://yoursite.files.wordpress.com/2023/08"
local image_extension ="webp"
local gamefile = "game" --name of the unencrypted gamedata
-- if you dont have an unencrypted save you can copy the hexadecimal kill data to this string e.g. from memory, cheat engine etc
local kill_gamedata = "000000A0000000BA0000001900000034000000DE000000F80000003D0000007D0000011A000000000000006F000000A10000011D00000080000000E00000005E0000011D00000072000000BA000000910000004C0000007B0000014A000000CD0000013C00000104000000670000012000000000000000A9000000A300000135000000FB00000040000000520000007A0000000600000054000000B60000009A000000DE0000014B00000068000000960000003600000053000000DE000001000000012D00000129000000040000000800000050000000EC00000066000000EA000000000000000000000000000000000000009E0000007700000113000000F80000008E00000064000000AE000000FB0000000000000000000000000000000000000000000000000000000000000000000000160000014500000078000000B000000098000000C30000003400000077000000000000002A0000003300000051000001720000014D000003A00000029300000139000000BA000000B8000004570000069F0000002800000000000000000000000000000193000002CC000003F70000012A0000006D00000105000000F5000002F00000000D00000004000000000000005700000059000000230000001B0000003C0000001C00000034000000060000001C0000001C0000001D0000000100000001000000480000002A000000260000002A00000072000000000000002B000000140000007F00000057000000310000002800000002"
local monsterlist = {
"Zombie","Ghoul","Rotting Carcass","Black Death","Fallen One Spear","Carver Spear","Devil Kin Spear","Dark One Spear","Skeleton","Corpse Axe","Burning Dead","Horror","Fallen One","Carver","Devil Kin","Dark One","Scavenger",
"Plague Eater","Shadow Beast","Bone Gasher","Skeleton Bow","Corpse Bow","Burning Dead Bow","Horror Bow","Skeleton Captain","Corpse Captain","Burning Dead Captain","Horror Captain","?Invisible Lord","Hidden","Stalker","Unseen",
"Illusion Weaver","Satyr Lord","Flesh Clan","Stone Clan","Fire Clan","Night Clan","Fiend","Blink","Gloom","Familiar","Flesh Clan Bow","Stone Clan Bow","Fire Clan Bow","Night Clan Bow","Acid Beast","Poison Spitter","Pit Beast",
"Lava Maw","Skeleton King","The Butcher","Overlord","Mud Man","Toad Demon","Flayed One","? Wyrm","? Cave Slug","? Devil Wyrm","? Devourer","Magma Demon","Blood Stone","Hell Stone","Lava Lord","Horned Demon","Mud Runner",
"Frost Charger","Obsidian Lord","? Oldboned","? Red Death","? Litch Demon","? Undead Balrog","? Incinerator","? Flame Lord","? Doom Fire","? Hell Burner","Red Storm","Storm Rider","Storm Lord","Maelstorm","Devil Kin Brute",
"Winged Demon","Gargoyle","Blood Claw","Death Wing","Slayer","Guardian","Vortex Lord","Balrog","Cave Viper","Fire Drake","Gold Viper","Azure Drake","Black Knight","Doom Guard","Steel Lord","Blood Knight","The Shredded",
"? Hollow One","? Pain Master","? Reality Weaver","Succubus","Snow Witch","Hell Spawn","Soul Burner","Counselor","Magistrate","Cabalist","Advocate","? Golem","Diablo","? The Arch-Litch Malignus","Hellboar","Stinger","Psychorb",
"Arachnon","Felltwin","Hork Spawn","Venomtail","Necromorb","Spider Lord","Lashworm","Torchant","Hork Demon","The Defiler","Gravedigger","Tomb Rat","Firebat","Skullwing","Lich","Crypt Demon","Hellbat","Bone Demon","Arch Lich",
"Biclops","Flesh Thing","Reaper","Na-Krul"
}
local total = 0
local golems
local picname
local i
local killdata = {name={},kills={}}

function switch(str)
  -- html image file will be monstername.imageextension (hork-demon.webp)
  -- if you want to replace the image file for a certain monster you can add it here
  local replace_pic = {
--[[  
    ["monstername_to_replace"] = function()
      return "filename_without_extension"
  	  end,
    ["2nd_monstername_to_replace"] = function()
      return "2nd_filename_without_extension"
  	  end,
    ["Biclops"] = function()
  	  return "biclops-2758036587-e1693209259316"
  	  end
--]]	  
  }

  local check = replace_pic[str]
  if (check) then
    return check()
  else
    return str
  end
end

function format_number(value)
  -- add  thousands separator to kill numbers
  local f_number = value
  while true do
    f_number, k = string.gsub(f_number, "^(-?%d+)(%d%d%d)", '%1.%2')
    if (k==0) then
      break
    end
  end
  return f_number
end

function parse_killdata(monsters,kills)
  local i = 1
  local j = 1
  local tmp = {name={},kills={}}
  local g
  if string.len(kills) ~= 1104 then
	print(string.format("Wrong killstring length. expected: 1104. got: %i",string.len(kills)))
	os.exit()
  end
  for i=1,#monsterlist+1 do
	tmp.name[i]=monsters[i]
  end
  for i=1,string.len(kills),8 do
    tmp.kills[j] = tonumber(string.sub(kills,i,i+7),16)
	j = j + 1
  end
  while i < #tmp.name+1 do
    if string.sub(tmp.name[i], 1, 1) == "?" then
      if tmp.name[i] == "? Golem" then
        g = format_number(tmp.kills[i])
      end   
      table.remove(tmp.name,i)	
      table.remove(tmp.kills,i)	
	  i=i-1
    end
    i=i+1
  end
  --change monster positions in the array
  tmp = change_list(107,120,tmp) 	--Defiler
  tmp = change_list(106,119,tmp) 	--Hork Demon
  tmp = change_list(94,118,tmp) 	--Diablo
  tmp = change_list(51,117,tmp) 	--The Butcher
  tmp = change_list(50,117,tmp) 	--Skeleton King
  tmp = change_list(108,112,tmp) 	--Crypt Demon
  tmp = change_list(110,108,tmp) 	--Arch Lich
  tmp = change_list(109,106,tmp) 	--Hellbat
  tmp = change_list(110,108,tmp) 	--Bone Demon
  tmp = change_list(33,103,tmp) 	--Satyr lord
  tmp = change_list(82,102,tmp) 	--The Shredded
  tmp = change_list(65,101,tmp) 	--Devil Kin Brute
  tmp = change_list(95,98,tmp) 		--Venom Tail
  tmp = change_list(92,96,tmp) 		--Arachnon
  tmp = change_list(91,94,tmp) 		--Psychorb
  tmp = change_list(37,45,tmp) 		--Fiend
  tmp = change_list(37,45,tmp) 		--Blink
  tmp = change_list(37,45,tmp) 		--Gloom
  tmp = change_list(37,45,tmp) 		--Familar  
  return tmp,g
end

function change_list(old,new,killdata)
  --change positions in the array
  if old > new then
    local tmp1
    local tmp2
    tmp1 = killdata.name[old]
    tmp2 = killdata.kills[old]
    table.remove(killdata.name,old)	
    table.remove(killdata.kills,old)	
    table.insert(killdata.name,new,tmp1)	
    table.insert(killdata.kills,new,tmp2)		
  else
    table.insert(killdata.kills,new,killdata.kills[old])	
    table.insert(killdata.name,new,killdata.name[old])	
    table.remove(killdata.name,old)	
    table.remove(killdata.kills,old)	
  end
  return killdata
end

function tohex(str)
  --convert binary data to hex
  return (str:gsub('.', function (c)
    return string.format('%02X', string.byte(c))
  end))
end

file=io.open(gamefile, "rb")
if file then 
  file:seek("cur",23411)
  kill_gamedata=""
  kill_gamedata=tohex(file:read(552))
  file:close()     
end
killdata,golems = parse_killdata(monsterlist,kill_gamedata)
print("<table style=\"background-color:#383838;font-size:16px; padding: .3em; margin-left:auto; margin-right:auto; border-collapse: collapse\">")
for i=1,#killdata.name,4 do
  print ("<tr style=\"text-align: center;vertical-align: bottom\">")
  for j=0,3 do
    picname = switch(killdata.name[i+j])
    print(string.format("    <td width=\"25%%\" style=\"border-width: 1px;border-style: solid;border-color: gray;border-spacing: 0px;border-bottom:none\"><img src=\"%s/%s.%s\"></td>", imagepath, string.gsub(string.lower(picname)," ","-"), image_extension))
  end  
  print ("  </tr>")
  print ("  <tr style=\"text-align: center;vertical-align: bottom\">")  
  for j=0,3 do
    total = total + (tonumber(killdata.kills[i+j]) or 0)
    print(string.format("    <td width=\"25%%\" style=\"border-width: 1px;border-style: solid;border-color: gray;border-spacing: 0px;border-top:none;padding-top:20px\"><p>%s<br>%s</p></td>", killdata.name[i+j],  format_number(killdata.kills[i+j])))
  end
  print ("  </tr>")
end
print ("  <tr>")
print(string.format("    <td colspan=\"4\" style=\"text-align: center; border-width: 1px; border-style: solid; border-color: gray; border-spacing: 0px;	vertical-align: top\"><br><img src=\"%s/golem.%s\"><br><br>... and %s innocent Golems lost their life too ;)</td>", imagepath, image_extension, format_number(golems)))
print ("  </tr>")
print ("</table>")
print("<p align=\"center\">Total Kills:",format_number(total),"</p>")
print("<p style=\"font-size:12px;padding-top:40px\" align=\"right\">Last Update:",os.date ("%d.%m.%Y %H:%M"),"</p>")
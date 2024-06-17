local imagepath = "https://yoursite.files.wordpress.com/2023/08"
local image_extension ="webp"
local gamefile = "game" --name of the unencrypted gamedata
-- if you dont have an unencrypted save you can copy the hexadecimal kill data to this string e.g. from memory, cheat engine etc
local kill_gamedata = "000000A0000000BA0000001900000034000000DE000000F80000003D0000007D0000011A000000000000006F000000A10000011D00000080000000E00000005E0000011D00000072000000BA000000910000004C0000007B0000014A000000CD0000013C00000104000000670000012000000000000000A9000000A300000135000000FB00000040000000520000007A0000000600000054000000B60000009A000000DE0000014B00000068000000960000003600000053000000DE000001000000012D00000129000000040000000800000050000000EC00000066000000EA000000000000000000000000000000000000009E0000007700000113000000F80000008E00000064000000AE000000FB0000000000000000000000000000000000000000000000000000000000000000000000160000014500000078000000B000000098000000C30000003400000077000000000000002A0000003300000051000001720000014D000003A00000029300000139000000BA000000B8000004570000069F0000002800000000000000000000000000000193000002CC000003F70000012A0000006D00000105000000F5000002F00000000D00000004000000000000005700000059000000230000001B0000003C0000001C00000034000000060000001C0000001C0000001D0000000100000001000000480000002A000000260000002A00000072000000000000002B000000140000007F00000057000000310000002800000002"
local monsterlist = {
-- name, sorting position, print to html 1=Yes 0= no;
  {"Zombie",1,1},
  {"Ghoul",2,1},
  {"Rotting Carcass",3,1},
  {"Black Death",4,1},
  {"Fallen One Spear",5,1},
  {"Carver Spear",6,1},
  {"Devil Kin Spear",7,1},
  {"Dark One Spear",8,1},
  {"Skeleton",9,1},
  {"Corpse Axe",10,1},
  {"Burning Dead",11,1},
  {"Horror",12,1},
  {"Fallen One",13,1},
  {"Carver",14,1},
  {"Devil Kin",15,1},
  {"Dark One",16,1},
  {"Scavenger",17,1},
  {"Plague Eater",18,1},
  {"Shadow Beast",19,1},
  {"Bone Gasher",20,1},
  {"Skeleton Bow",21,1},
  {"Corpse Bow",22,1},
  {"Burning Dead Bow",23,1},
  {"Horror Bow",24,1},
  {"Skeleton Captain",25,1},
  {"Corpse Captain",26,1},
  {"Burning Dead Captain",27,1},
  {"Horror Captain",28,1},
  {"Invisible Lord",121,0},
  {"Hidden",29,1},
  {"Stalker",30,1},
  {"Unseen",31,1},
  {"Illusion Weaver",32,1},
  {"Satyr Lord",102,1},
  {"Flesh Clan",33,1},
  {"Stone Clan",34,1},
  {"Fire Clan",35,1},
  {"Night Clan",36,1},
  {"Fiend",41,1},
  {"Blink",42,1},
  {"Gloom",43,1},
  {"Familiar",44,1},
  {"Flesh Clan Bow",37,1},
  {"Stone Clan Bow",38,1},
  {"Fire Clan Bow",39,1},
  {"Night Clan Bow",40,1},
  {"Acid Beast",45,1},
  {"Poison Spitter",46,1},
  {"Pit Beast",47,1},
  {"Lava Maw",48,1},
  {"Skeleton King",116,1},
  {"The Butcher",115,1},
  {"Overlord",49,1},
  {"Mud Man",50,1},
  {"Toad Demon",51,1},
  {"Flayed One",52,1},
  {"Wyrm",122,0},
  {"Cave Slug",123,0},
  {"Devil Wyrm",124,0},
  {"Devourer",125,0},
  {"Magma Demon",53,1},
  {"Blood Stone",54,1},
  {"Hell Stone",55,1},
  {"Lava Lord",56,1},
  {"Horned Demon",57,1},
  {"Mud Runner",58,1},
  {"Frost Charger",59,1},
  {"Obsidian Lord",60,1},
  {"Oldboned",126,0},
  {"Red Death",127,0},
  {"Litch Demon",128,0},
  {"Undead Balrog",129,0},
  {"Incinerator",130,0},
  {"Flame Lord",131,0},
  {"Doom Fire",132,0},
  {"Hell Burner",133,0},
  {"Red Storm",61,1},
  {"Storm Rider",62,1},
  {"Storm Lord",63,1},
  {"Maelstorm",64,1},
  {"Devil Kin Brute",101,1},
  {"Winged Demon",65,1},
  {"Gargoyle",66,1},
  {"Blood Claw",67,1},
  {"Death Wing",68,1},
  {"Slayer",69,1},
  {"Guardian",70,1},
  {"Vortex Lord",71,1},
  {"Balrog",72,1},
  {"Cave Viper",73,1},
  {"Fire Drake",74,1},
  {"Gold Viper",75,1},
  {"Azure Drake",76,1},
  {"Black Knight",77,1},
  {"Doom Guard",78,1},
  {"Steel Lord",79,1},
  {"Blood Knight",80,1},
  {"The Shredded",100,1},
  {"Hollow One",134,0},
  {"Pain Master",135,0},
  {"Reality Weaver",136,0},
  {"Succubus",81,1},
  {"Snow Witch",82,1},
  {"Hell Spawn",83,1},
  {"Soul Burner",84,1},
  {"Counselor",85,1},
  {"Magistrate",86,1},
  {"Cabalist",87,1},
  {"Advocate",88,1},
  {"Golem",137,0},
  {"Diablo",117,1},
  {"The Arch-Litch Malignus",138,0},
  {"Hellboar",89,1},
  {"Stinger",90,1},
  {"Psychorb",93,1},
  {"Arachnon",95,1},
  {"Felltwin",91,1},
  {"Hork Spawn",92,1},
  {"Venomtail",97,1},
  {"Necromorb",94,1},
  {"Spider Lord",96,1},
  {"Lashworm",98,1},
  {"Torchant",99,1},
  {"Hork Demon",118,1},
  {"The Defiler",119,1},
  {"Gravedigger",103,1},
  {"Tomb Rat",104,1},
  {"Firebat",105,1},
  {"Skullwing",107,1},
  {"Lich",109,1},
  {"Crypt Demon",111,1},
  {"Hellbat",106,1},
  {"Bone Demon",108,1},
  {"Arch Lich",110,1},
  {"Biclops",112,1},
  {"Flesh Thing",113,1},
  {"Reaper",114,1},
  {"Na-Krul",120,1}
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
  local g = 0
  if string.len(kills) ~= 1104 then
	print(string.format("Wrong killstring length. expected: 1104. got: %i",string.len(kills)))
	os.exit()
  end
  for i=1,#monsterlist do
	if monsters[i][3] == 1 then
	  tmp.name[monsters[i][2]]=monsters[i][1]
	  tmp.kills[monsters[i][2]] = tonumber(string.sub(kills,j,j+7),16)
	else
	  if monsters[i][1] == "Golem" then
        g = tonumber(string.sub(kills,j,j+7),16)
      end
	end
	j = j + 8
  end
  return tmp,g
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
local imagepath = "https://yoursite.files.wordpress.com/2023/08"
-- number of html table columns
local t_columns = 4
-- HF = Hellfire addon, D1 = Diablo normal
local game = "HF"
local image_extension ="webp"
-- filename of the unencrypted gamedata
local gamefile = "game" 
-- if you dont have an unencrypted save you can copy the hexadecimal kill data to this string e.g. from memory, cheat engine etc
local kill_gamedata = "000000A0000000BA0000001900000034000000DE000000F80000003D0000007D0000011A000000000000006F000000A10000011D00000080000000E00000005E0000011D00000072000000BA000000910000004C0000007B0000014A000000CD0000013C00000104000000670000012000000000000000A9000000A300000135000000FB00000040000000520000007A0000000600000054000000B60000009A000000DE0000014B00000068000000960000003600000053000000DE000001000000012D00000129000000040000000800000050000000EC00000066000000EA000000000000000000000000000000000000009E0000007700000113000000F80000008E00000064000000AE000000FB0000000000000000000000000000000000000000000000000000000000000000000000160000014500000078000000B000000098000000C30000003400000077000000000000002A0000003300000051000001720000014D000003A00000029300000139000000BA000000B8000004570000069F0000002800000000000000000000000000000193000002CC000003F70000012A0000006D00000105000000F5000002F00000000D00000004000000000000005700000059000000230000001B0000003C0000001C00000034000000060000001C0000001C0000001D0000000100000001000000480000002A000000260000002A00000072000000000000002B000000140000007F00000057000000310000002800000002"
local monsterlist = {
-- name, sorting position, print to html 1=yes 0=no, game D1 = Diablo HF = Hellfire
  {"Zombie",1,1,"D1"},
  {"Ghoul",2,1,"D1"},
  {"Rotting Carcass",3,1,"D1"},
  {"Black Death",4,1,"D1"},
  {"Fallen One Spear",5,1,"D1"},
  {"Carver Spear",6,1,"D1"},
  {"Devil Kin Spear",7,1,"D1"},
  {"Dark One Spear",8,1,"D1"},
  {"Skeleton",9,1,"D1"},
  {"Corpse Axe",10,1,"D1"},
  {"Burning Dead",11,1,"D1"},
  {"Horror",12,1,"D1"},
  {"Fallen One",13,1,"D1"},
  {"Carver",14,1,"D1"},
  {"Devil Kin",15,1,"D1"},
  {"Dark One",16,1,"D1"},
  {"Scavenger",17,1,"D1"},
  {"Plague Eater",18,1,"D1"},
  {"Shadow Beast",19,1,"D1"},
  {"Bone Gasher",20,1,"D1"},
  {"Skeleton Bow",21,1,"D1"},
  {"Corpse Bow",22,1,"D1"},
  {"Burning Dead Bow",23,1,"D1"},
  {"Horror Bow",24,1,"D1"},
  {"Skeleton Captain",25,1,"D1"},
  {"Corpse Captain",26,1,"D1"},
  {"Burning Dead Captain",27,1,"D1"},
  {"Horror Captain",28,1,"D1"},
  {"Invisible Lord",121,0,"D1"},
  {"Hidden",29,1,"D1"},
  {"Stalker",30,1,"D1"},
  {"Unseen",31,1,"D1"},
  {"Illusion Weaver",32,1,"D1"},
  {"Satyr Lord",102,1,"HF"},
  {"Flesh Clan",33,1,"D1"},
  {"Stone Clan",34,1,"D1"},
  {"Fire Clan",35,1,"D1"},
  {"Night Clan",36,1,"D1"},
  {"Fiend",41,1,"D1"},
  {"Blink",42,1,"D1"},
  {"Gloom",43,1,"D1"},
  {"Familiar",44,1,"D1"},
  {"Flesh Clan Bow",37,1,"D1"},
  {"Stone Clan Bow",38,1,"D1"},
  {"Fire Clan Bow",39,1,"D1"},
  {"Night Clan Bow",40,1,"D1"},
  {"Acid Beast",45,1,"D1"},
  {"Poison Spitter",46,1,"D1"},
  {"Pit Beast",47,1,"D1"},
  {"Lava Maw",48,1,"D1"},
  {"Skeleton King",116,1,"D1"},
  {"The Butcher",115,1,"D1"},
  {"Overlord",49,1,"D1"},
  {"Mud Man",50,1,"D1"},
  {"Toad Demon",51,1,"D1"},
  {"Flayed One",52,1,"D1"},
  {"Wyrm",122,0,"D1"},
  {"Cave Slug",123,0,"D1"},
  {"Devil Wyrm",124,0,"D1"},
  {"Devourer",125,0,"D1"},
  {"Magma Demon",53,1,"D1"},
  {"Blood Stone",54,1,"D1"},
  {"Hell Stone",55,1,"D1"},
  {"Lava Lord",56,1,"D1"},
  {"Horned Demon",57,1,"D1"},
  {"Mud Runner",58,1,"D1"},
  {"Frost Charger",59,1,"D1"},
  {"Obsidian Lord",60,1,"D1"},
  {"Oldboned",126,0,"D1"},
  {"Red Death",127,0,"D1"},
  {"Litch Demon",128,0,"D1"},
  {"Undead Balrog",129,0,"D1"},
  {"Incinerator",130,0,"D1"},
  {"Flame Lord",131,0,"D1"},
  {"Doom Fire",132,0,"D1"},
  {"Hell Burner",133,0,"D1"},
  {"Red Storm",61,1,"D1"},
  {"Storm Rider",62,1,"D1"},
  {"Storm Lord",63,1,"D1"},
  {"Maelstorm",64,1,"D1"},
  {"Devil Kin Brute",101,1,"HF"},
  {"Winged Demon",65,1,"D1"},
  {"Gargoyle",66,1,"D1"},
  {"Blood Claw",67,1,"D1"},
  {"Death Wing",68,1,"D1"},
  {"Slayer",69,1,"D1"},
  {"Guardian",70,1,"D1"},
  {"Vortex Lord",71,1,"D1"},
  {"Balrog",72,1,"D1"},
  {"Cave Viper",73,1,"D1"},
  {"Fire Drake",74,1,"D1"},
  {"Gold Viper",75,1,"D1"},
  {"Azure Drake",76,1,"D1"},
  {"Black Knight",77,1,"D1"},
  {"Doom Guard",78,1,"D1"},
  {"Steel Lord",79,1,"D1"},
  {"Blood Knight",80,1,"D1"},
  {"The Shredded",100,1,"HF"},
  {"Hollow One",134,0,"D1"},
  {"Pain Master",135,0,"D1"},
  {"Reality Weaver",136,0,"D1"},
  {"Succubus",81,1,"D1"},
  {"Snow Witch",82,1,"D1"},
  {"Hell Spawn",83,1,"D1"},
  {"Soul Burner",84,1,"D1"},
  {"Counselor",85,1,"D1"},
  {"Magistrate",86,1,"D1"},
  {"Cabalist",87,1,"D1"},
  {"Advocate",88,1,"D1"},
  {"Golem",137,0,"D1"},
  {"Diablo",117,1,"D1"},
  {"The Arch-Litch Malignus",138,0,"D1"},
  {"Hellboar",89,1,"HF"},
  {"Stinger",90,1,"HF"},
  {"Psychorb",93,1,"HF"},
  {"Arachnon",95,1,"HF"},
  {"Felltwin",91,1,"HF"},
  {"Hork Spawn",92,1,"HF"},
  {"Venomtail",97,1,"HF"},
  {"Necromorb",94,1,"HF"},
  {"Spider Lord",96,1,"HF"},
  {"Lashworm",98,1,"HF"},
  {"Torchant",99,1,"HF"},
  {"Hork Demon",118,1,"HF"},
  {"The Defiler",119,1,"HF"},
  {"Gravedigger",103,1,"HF"},
  {"Tomb Rat",104,1,"HF"},
  {"Firebat",105,1,"HF"},
  {"Skullwing",107,1,"HF"},
  {"Lich",109,1,"HF"},
  {"Crypt Demon",111,1,"HF"},
  {"Hellbat",106,1,"HF"},
  {"Bone Demon",108,1,"HF"},
  {"Arch Lich",110,1,"HF"},
  {"Biclops",112,1,"HF"},
  {"Flesh Thing",113,1,"HF"},
  {"Reaper",114,1,"HF"},
  {"Na-Krul",120,1,"HF"}
}
local total = 0
local golems
local picname
local i
local t_width = 100/t_columns
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

  local function kill_the_nils(t)
    local nilfree = {}
    for _,v in pairs(t) do
      nilfree[#nilfree+1] = v
    end
    return nilfree
  end  

  local i = 1
  local j = 1
  local tmp = {name={},kills={}}
  local g = 0
  if game == "HF" and string.len(kills) ~= 1104 then
    print(string.format("Wrong killstring length. expected: 1104. got: %i",string.len(kills)))
    os.exit()
  elseif game == "D1" and string.len(kills) ~= 896 then
    print(string.format("Wrong killstring length. expected: 896. got: %i",string.len(kills)))
    os.exit()
  end
  for i=1,#monsterlist do
    if monsters[i][3] == 1 and ((game=="D1" and monsters[i][4] == "D1") or game=="HF") then
      tmp.name[monsters[i][2]]=monsters[i][1]
      tmp.kills[monsters[i][2]] = tonumber(string.sub(kills,j,j+7),16)
    else
      if monsters[i][1] == "Golem" then
        g = tonumber(string.sub(kills,j,j+7),16)
      end
    end
    j = j + 8
  end
  tmp.name = kill_the_nils(tmp.name)
  tmp.kills = kill_the_nils(tmp.kills) 
  return tmp,g
end

function tohex(str)
  --convert binary data to hex
  return (str:gsub('.', function (c)
    return string.format('%02X', string.byte(c))
  end))
end

if game ~= "HF" and game ~= "D1" then
  print("Error: game variable must be D1 or HF")
  os.exit()
end
file=io.open(gamefile, "rb")
if file then 
  file:seek("cur",23411)
  kill_gamedata=""
  if game == "HF" then
    kill_gamedata=tohex(file:read(552))
  elseif game =="D1" then
    kill_gamedata=tohex(file:read(448))
  end
  file:close()     
end
killdata,golems = parse_killdata(monsterlist,kill_gamedata)
print("<table style=\"background-color:#383838;font-size:16px; padding: .3em; margin-left:auto; margin-right:auto; border-collapse: collapse\">")
for i=1,#killdata.name,t_columns do
  print ("<tr style=\"text-align: center;vertical-align: bottom\">")
  for j=0,t_columns-1 do    
    if i+j <= #killdata.name then
      picname = switch(killdata.name[i+j])
      print(string.format("    <td width=\"%.2f%%\" style=\"border-width: 1px;border-style: solid;border-color: gray;border-spacing: 0px;border-bottom:none\"><img src=\"%s/%s.%s\"></td>", t_width,imagepath, string.gsub(string.lower(picname)," ","-"), image_extension))
    end
  end
  print ("  </tr>")
  print ("  <tr style=\"text-align: center;vertical-align: bottom\">")  
  for j=0,t_columns-1 do
    if i+j <= #killdata.name then
      total = total + (tonumber(killdata.kills[i+j]) or 0)
      print(string.format("    <td width=\"%.2f%%\" style=\"border-width: 1px;border-style: solid;border-color: gray;border-spacing: 0px;border-top:none;padding-top:20px\"><p>%s<br>%s</p></td>", t_width,killdata.name[i+j],  format_number(killdata.kills[i+j])))
    end  
  end
  print ("  </tr>")
end
print ("  <tr>")
print(string.format("    <td colspan=\"%s\" style=\"text-align: center; border-width: 1px; border-style: solid; border-color: gray; border-spacing: 0px; vertical-align: top\"><br><img src=\"%s/golem.%s\"><br><br>... and %s innocent Golems lost their life too ;)</td>", t_columns,imagepath, image_extension, format_number(golems)))
print ("  </tr>")
print ("</table>")
print("<p align=\"center\">Total Kills:",format_number(total),"</p>")
print("<p style=\"font-size:12px;padding-top:40px\" align=\"right\">Last Update:",os.date ("%d.%m.%Y %H:%M"),"</p>")
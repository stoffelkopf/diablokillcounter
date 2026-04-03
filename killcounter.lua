----------------------------------------------------------------------
-- killcounter.lua
-- Diablo 1 / HF Killcounter
-- prints a HTML Monsterlist with ingame kills
----------------------------------------------------------------------

----------------------------------------------------------------------
-- configuration
----------------------------------------------------------------------

-- monster image files path
local imagepath = "https://yourdomain.xyz/images"
-- number of html table columns
local t_columns = 4
-- image file extension
local image_extension ="webp"
-- HTML filename
outfile_name = "killcounter.html"

----------------------------------------------------------------------
-- variables
----------------------------------------------------------------------

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

----------------------------------------------------------------------
-- Diablo SHA
----------------------------------------------------------------------

local sha1 = {}
sha1.BlockSize = 64
sha1.Size = 20

local function rol(x, shift)
    x = x & 0xFFFFFFFF
    if x >= 0x80000000 then
        x = x - 0x100000000
    end
    return ((x << shift) | (x >> (32 - shift))) & 0xFFFFFFFF
end

local function u32le(s, i)
    local b1,b2,b3,b4 = s:byte(i,i+3)
    return ((b4<<24)|(b3<<16)|(b2<<8)|b1) & 0xFFFFFFFF
end

local function put_u32le(x)
    return string.char(
        x & 0xFF,
        (x >> 8) & 0xFF,
        (x >> 16) & 0xFF,
        (x >> 24) & 0xFF
    )
end

function sha1.new()
    local ctx = {
        State = {},
        Count = {0,0},
        Buffer = {},
    }

    function ctx:Init()
        self.State[1] = 0x67452301
        self.State[2] = 0xEFCDAB89
        self.State[3] = 0x98BADCFE
        self.State[4] = 0x10325476
        self.State[5] = 0xC3D2E1F0
        self.Count[1], self.Count[2] = 0, 0
    end

    function ctx:Transform()
        local w = {}
        local b = string.char(table.unpack(self.Buffer))
        for i=0,63,4 do
            w[i//4+1] = u32le(b, i+1)
        end
        for i=1,64 do
            w[i+16] = (w[i] ~ w[i+2] ~ w[i+8] ~ w[i+13]) & 0xFFFFFFFF
        end

        local a,b_,c,d,e = table.unpack(self.State)
        local g

        for i=1,20 do
            g = (w[i] + rol(a,5) + e + ((b_ & c) | (~b_ & d)) + 0x5A827999) & 0xFFFFFFFF
            e,d,c,b_,a = d,c,rol(b_,30),a,g
        end
        for i=21,40 do
            g = (w[i] + rol(a,5) + e + (b_ ~ c ~ d) + 0x6ED9EBA1) & 0xFFFFFFFF
            e,d,c,b_,a = d,c,rol(b_,30),a,g
        end
        for i=41,60 do
            g = (w[i] + rol(a,5) + e + ((b_&c)|(b_&d)|(c&d)) - 0x70E44324) & 0xFFFFFFFF
            e,d,c,b_,a = d,c,rol(b_,30),a,g
        end
        for i=61,80 do
            g = (w[i] + rol(a,5) + e + (b_ ~ c ~ d) - 0x359D3E2A) & 0xFFFFFFFF
            e,d,c,b_,a = d,c,rol(b_,30),a,g
        end

        self.State[1] = (self.State[1] + a) & 0xFFFFFFFF
        self.State[2] = (self.State[2] + b_) & 0xFFFFFFFF
        self.State[3] = (self.State[3] + c) & 0xFFFFFFFF
        self.State[4] = (self.State[4] + d) & 0xFFFFFFFF
        self.State[5] = (self.State[5] + e) & 0xFFFFFFFF
    end

    function ctx:Update(data)
        local len = #data
        local bits = self.Count[1] + len*8
        if bits < self.Count[1] then
            self.Count[2] = self.Count[2] + 1
        end
        self.Count[1] = bits & 0xFFFFFFFF
        self.Count[2] = (self.Count[2] + (len >> 29)) & 0xFFFFFFFF

        local p = 1
        while p + 63 <= len do
            for i=1,64 do
                self.Buffer[i] = data:byte(p+i-1)
            end
            self:Transform()
            p = p + 64
        end

        for i=1,(len-p+1) do
            self.Buffer[i] = data:byte(p+i-1)
        end
    end

    function ctx:Final()
        local idx = (self.Count[1] >> 3) & 63
        local padLen = (idx < 56) and (56-idx) or (120-idx)
        self:Update("\128" .. string.rep("\0", padLen-1))
        self:Update(put_u32le(self.Count[1]) .. put_u32le(self.Count[2]))

        return table.concat({
            put_u32le(self.State[1]),
            put_u32le(self.State[2]),
            put_u32le(self.State[3]),
            put_u32le(self.State[4]),
            put_u32le(self.State[5]),
        })
    end

    function ctx:Sum()
        local copy = sha1.new()
        copy.State = {table.unpack(self.State)}
        copy.Count = {table.unpack(self.Count)}
        copy.Buffer = {table.unpack(self.Buffer)}
        return copy:Final()
    end

    ctx:Init()
    return ctx
end

local seed = 0
local function setSeed(s) seed = s & 0xFFFFFFFF end

local function rand()
    seed = (seed * 214013 + 2531011) & 0xFFFFFFFF
    return (seed >> 16) & 0x7FFF
end

local function initKey()   
	setSeed(28760)
    local rnd = {}    
    for i=1,136 do rnd[i] = rand() & 0xFF end
    
    local pwd = {string.byte(string.char(120, 114, 103, 121, 114, 107, 106, 49)	,1,8)}
	local block = {}
    for i=1,64 do block[i] = pwd[(i-1)%#pwd+1] end

    local ctx = sha1.new()
    ctx:Update(string.char(table.unpack(block)))
    local digest = {string.byte(ctx:Final(),1,20)}

    for i=1,#rnd do
        rnd[i] = rnd[i] ~ digest[(i-1)%20+1]
    end

    local h = sha1.new()
    h:Update(string.char(table.unpack(rnd,73)))
    return h
end

----------------------------------------------------------------------
-- decode gamedata
----------------------------------------------------------------------

local function decode(data)
	
	local h = initKey()
    local n = #data - 8
    if n <= 0 or (n % 64 ~= 0) then
        return nil, "Invalid file size"
    end

    local out = {}
    for pos=1,n,64 do
        local block = {string.byte(data, pos, pos+63)}
        local digest = {string.byte(h:Sum(),1,20)}
        for i=1,64 do
            block[i] = block[i] ~ digest[(i-1)%20+1]
            out[#out+1] = block[i]
        end
        h:Update(string.char(table.unpack(block)))
    end
    return string.char(table.unpack(out))
end

----------------------------------------------------------------------
-- killcounter
----------------------------------------------------------------------

local function parse_killdata(monsters,kills, game)

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


local function print_killcount_html(game_data,game)

    local function tohex(str)
        --convert binary data to hex
        return (str:gsub('.', function (c)
        return string.format('%02X', string.byte(c)) end))
    end

    local function format_number(value)
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

    local function switch(str)
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

    local function out(...)
        local parts = {}
        for i = 1, select("#", ...) do
            parts[#parts + 1] = tostring(select(i, ...))
        end
        outfile:write(table.concat(parts), "\n")
    end

    local offset = 23411
    local kill_gamedata = ""
    outfile = assert(io.open(outfile_name, "wb"))
	if game == "HF" then
        kill_gamedata = tohex(game_data:sub(offset+1, offset+552))
    elseif game == "D1" then
        kill_gamedata = tohex(game_data:sub(offset+1, offset+448))
    end
    if game ~= "HF" and game ~= "D1" then
        print("Error: game variable must be D1 or HF")
        os.exit()
    end
    killdata, golems = parse_killdata(monsterlist, kill_gamedata, game)
    out("<!DOCTYPE html>")
    out("<html><head><meta charset=\"utf-8\">")
    out("<title>Diablo Killcounter</title>")
    out([[
    <style type="text/css">
    :root {
        --bg-page: #222222;
        --bg-table: #383838;
        --text-main: #e0e0e0;
        --border-color: #555;
        --bg-golem: #404040;
    }

    body.light {
        --bg-page: #e6e6e6;
        --bg-table: #dcdcdc;
        --text-main: #1a1a1a;
        --border-color: #888888;
        --bg-golem: #d2d2d2;
    }

    body::before {
        content: "";
        position: fixed;
        inset: 0;
        pointer-events: none;
        box-shadow: inset 0 0 120px rgba(0,0,0,0.6);
    }

    body {
        background-color: var(--bg-page);
        color: var(--text-main);
        line-height: 1.5;
        margin: 0;
    }

    h1 {
      text-align: center;
    }

    table {
        background-color: var(--bg-table);
        font-size: 16px;
        padding: .3em;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
    }

    table td {
        border-width: 1px;
        border-style: solid;
        border-color: var(--border-color);
        border-spacing: 0;
        text-align: center;
        transition: background-color 0.15s ease;		        	
    }

    table tr:nth-child(odd) td {
        border-bottom: none;
        height: 110px;
        vertical-align: bottom;
    }

    table tr:nth-child(even) td {
        border-top: none;
        padding-top: 20px;
    }

    table tr:last-child td {
        border-bottom: 1px solid var(--border-color);
        background-color: var(--bg-golem);
        vertical-align: top;
        padding-bottom: 20px;
    }

    table img {
        display: block;
        margin: 0 auto;
        transition: filter 0.15s ease;
		transition: transform 0.5s ease;
    }

    p.total {
        font-size: 20px;
        padding-top: 20px;
        text-align: center;
    }

    p.last-update {
        font-size: 12px;
        padding-top: 40px;
        text-align: center;
    }

    .theme-toggle {
        position: fixed;
        top: 10px;
        right: 10px;
        font-size: 12px;
        padding: 4px 8px;
    }

    table tr:nth-child(odd):hover td,
    table tr:nth-child(odd):hover + tr td,
    table tr:nth-child(even):hover td,
    table tr:has(+ tr:nth-child(even):hover) td {
        background-color: rgba(255, 255, 255, 0.06);
    }

    body.light table tr:nth-child(odd):hover td,
    body.light table tr:nth-child(odd):hover + tr td,
    body.light table tr:nth-child(even):hover td,
    body.light table tr:has(+ tr:nth-child(even):hover) td {
        background-color: rgba(0, 0, 0, 0.1);
    }

    table p:first-line {
        font-size: 1.05em;
    }

    td.boss p {
        color: #e6c28a;
        letter-spacing: 0.6px;
        text-shadow: 0 0 2px rgba(230, 194, 138, 0.25);
    }

    body.light td.boss p {
        color: #9a6b2f;  
        text-shadow: 0 0 1px rgba(154, 107, 47, 0.25);
    }

    table tr:nth-child(even):hover td.boss p {
        text-shadow:
        0 0 6px rgba(230, 194, 138, 0.6),
        0 0 12px rgba(230, 194, 138, 0.25);
    }

    table tr:nth-child(odd):hover + tr td.boss p {
        text-shadow:
        0 0 6px rgba(230, 194, 138, 0.6),
        0 0 12px rgba(230, 194, 138, 0.25);
    }

    table tr:has(+ tr:nth-child(even):hover) td.boss p {
        text-shadow:
        0 0 6px rgba(230, 194, 138, 0.6),
        0 0 12px rgba(230, 194, 138, 0.25);
    }

    table tr:nth-child(odd):hover td img {
        filter: brightness(0.85) contrast(1.05);
		transform: scale(1.07);
    }

    table tr:has(+ tr:nth-child(even):hover) td img {
        filter: brightness(0.85) contrast(1.05);
		transform: scale(1.07);
    }
    </style>
    ]])
    out("</head><body>")
	out("<button class=\"theme-toggle\" onclick=\"document.body.classList.toggle('light')\">Light / Dark</button>")
    out("<h1>Diablo Kill-Counter</h1>")
    out("<table>")	
    local bosses = {["The Butcher"] = true,["Skeleton King"] = true,["Diablo"] = true,["Na-Krul"] = true,["The Defiler"] = true,["Hork Demon"] = true}
    for i=1,#killdata.name,t_columns do
        out("<tr>")
        for j=0,t_columns-1 do
            if i+j <= #killdata.name then
                picname = switch(killdata.name[i+j])
                out(string.format(
                "<td width=\"%.2f%%\"><img src=\"%s/%s.%s\"></td>",
                t_width,
                imagepath,
                string.gsub(string.lower(picname)," ","-"),
                image_extension))
            end
        end
        out("</tr>")
        out("<tr>")
        for j=0,t_columns-1 do
            if i+j <= #killdata.name then
                total = total + (tonumber(killdata.kills[i+j]) or 0)
                local is_boss = bosses[killdata.name[i+j]] and " boss" or ""
                out(string.format(
                "<td width=\"%.2f%%\" class=\"%s\"><p>%s<br>%s</p></td>",
                t_width,
                is_boss,
                killdata.name[i+j],
                format_number(killdata.kills[i+j])))

            end
        end
        out("</tr>")
    end
    out("<tr>")
    out(string.format(
	"<td colspan=\"%s\"><br><img src=\"%s/golem.%s\"><br><br>... and %s innocent Golems lost their life too ;)</td>",
    t_columns,
    imagepath,
    image_extension,
    format_number(golems)))
    out("</tr>")
    out("</table>")
    out("<p class=\"total\">Total Kills: ", format_number(total), "</p>")
    out("<p class=\"last-update\">Last update: ", os.date("%d.%m.%Y %H:%M"), "</p>")
    out("</body></html>")
	outfile:close()
	print("Success: created killcount file " .. outfile_name)
end

local function start_killcount(fname,game)

    if not fname then
        print("Error: killcount mode requires game file")
		os.exit()
    end
    local f = io.open(fname,"rb")
	if not f then
        print("Error: File not found " .. fname)
        os.exit()
	end
    local enc = f:read("*all")
    f:close()
    local dec, err = decode(enc)
    if not dec then
        print("Error: Failed to decode game file: " .. err)		
    end
    print_killcount_html(dec,game)	
end

----------------------------------------------------------------------
-- main
----------------------------------------------------------------------

local game   = arg[1] -- HF|D1
local file   = arg[2] -- game file
print("\nDiablo HTML Killcounter")
print("-----------------------\n")
if not game  or not file or (game ~= "HF" and game ~= "D1") then
    print("Usage: lua killcounter.lua <HF|D1> <gamefile>")
    os.exit(1)
end
start_killcount(file,game)

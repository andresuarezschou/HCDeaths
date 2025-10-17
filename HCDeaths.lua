HCDeath = {}

local HCDeath_Handler = CreateFrame("Frame")

HCDeaths_Settings = {
	message = true,
	log = true,
	toast = true,
	color = false,
	deathsound = true,
	levelsound = false,
	roar = false,
	toastscale = 1,
	logscale = 1,
	toasttime = 10,
}


local deathsound = {
	["Dwarf"] = {
		[1] = "Sound\\Character\\Dwarf\\DwarfFemale\\Emote\\DwarfFemale_Roar01.wav",
		[2] = "Sound\\Character\\Dwarf\\DwarfMale\\Emote\\DwarfMale_Roar02.wav",
	},

	["Gnome"] = {
		[1] = "Sound\\Character\\Gnome\\GnomeFemale\\Emote\\GnomeFemale_Roar01.wav",
		[2] = "Sound\\Character\\Gnome\\GnomeMale\\Emote\\GnomeMale_Roar01.wav",
	},

	["Goblin"] = {
		[1] = "Sound\\Character\\Goblin\\GoblinFemale\\Emote\\GoblinFemale_Roar01.ogg",
		[2] = "Sound\\Character\\Goblin\\GoblinMale\\Emote\\GoblinMale_Roar02.wav",
	},
		
	["High Elf"] = {
		[1] = "Sound\\Character\\HighElf\\HighElfFemale\\Emote\\HighElfFemale_Roar01.wav",
		[2] = "Sound\\Character\\HighElf\\HighElfMale\\Emote\\HighElfMale_Roar01.wav",		
	},

	["Human"] = {
		[1] = "Sound\\Character\\Human\\HumanFemale\\Emote\\HumanFemale_Roar01.wav",
		[2] = "Sound\\Character\\Human\\HumanMale\\Emote\\HumanMale_Roar02.wav",
	},
	
	["Night Elf"] = {
		[1] = "Sound\\Character\\NightElf\\NightElfFemale\\Emote\\NightElfFemale_Roar01.wav",
		[2] = "Sound\\Character\\NightElf\\NightElfMale\\Emote\\NightElfMale_Roar02.wav",
	},

	["Orc"] = {
		[1] = "Sound\\Character\\Orc\\OrcFemale\\Emote\\OrcFemale_Roar01.wav",
		[2] = "Sound\\Character\\Orc\\OrcMale\\Emote\\OrcMale_Roar01.wav",
	},

	["Tauren"] = {
		[1] = "Sound\\Character\\Tauren\\TaurenFemale\\Emote\\TaurenFemale_Roar01.wav",
		[2] = "Sound\\Character\\Tauren\\TaurenMale\\Emote\\TaurenMale_Roar01.wav",
	},

	["Troll"] = {
		[1] = "Sound\\Character\\Troll\\TrollFemale\\Emote\\TrollFemale_Roar01.wav",
		[2] = "Sound\\Character\\Troll\\TrollMale\\Emote\\TrollMale_Roar02.wav",
	},

	["Undead"] = {
		[1] = "Sound\\Character\\Undead\\UndeadFemale\\Emote\\UndeadFemale_Roar01.wav",
		[2] = "Sound\\Character\\Undead\\UndeadMale\\Emote\\UndeadMale_Roar02.wav",
	},
}

local progress = {
	["Dwarf"] = {		
		[1] = "\\Sound\\Character\\Dwarf\\DwarfVocalFemale\\DwarfFemaleCheer01.wav",
		[2] = "\\Sound\\Character\\Dwarf\\DwarfVocalFemale\\DwarfFemaleCheer02.wav",
		[3] = "\\Sound\\Character\\Dwarf\\DwarfVocalMale\\DwarfMaleCheer01.wav",
		[4] = "\\Sound\\Character\\Dwarf\\DwarfVocalMale\\DwarfMaleCheer02.wav",
	},

	["Gnome"] = {
		[1] = "\\Sound\\Character\\Gnome\\GnomeVocalFemale\\GnomeFemaleCheer01.wav",
		[2] = "\\Sound\\Character\\Gnome\\GnomeVocalFemale\\GnomeFemaleCheer02.wav",
		[3] = "\\Sound\\Character\\Gnome\\GnomeVocalMale\\GnomeMaleCheer01.wav",
		[4] = "\\Sound\\Character\\Gnome\\GnomeVocalMale\\GnomeMaleCheer02.wav",
	},

	["Goblin"] = {
		[1] = "Sound\\Character\\Goblin\\GoblinFemale\\Emote\\GoblinFemale_Cheer01.ogg",
		[2] = "Sound\\Character\\Goblin\\GoblinFemale\\Emote\\GoblinFemale_Cheer02.ogg",
		[3] = "Sound\\Character\\Goblin\\GoblinMale\\Emote\\GoblinMale_Cheer01.wav",
		[4] = "Sound\\Character\\Goblin\\GoblinMale\\Emote\\GoblinMale_Cheer02.wav",
	},
		
	["High Elf"] = {
		[1] = "Sound\\Character\\HighElf\\HighElfFemale\\Emote\\HighElfFemale_Cheer01.wav",
		[2] = "Sound\\Character\\HighElf\\HighElfFemale\\Emote\\HighElfFemale_Cheer03.wav",
		[3] = "Sound\\Character\\HighElf\\HighElfMale\\Emote\\HighElfMale_Cheer01.wav",
		[4] = "Sound\\Character\\HighElf\\HighElfMale\\Emote\\HighElfMale_Cheer02.wav",
	},

	["Human"] = {
		[1] = "Sound\\Character\\Human\\HumanVocalFemale\\HumanFemaleCheer01.wav",
		[2] = "Sound\\Character\\Human\\HumanVocalFemale\\HumanFemaleCheer02.wav",
		[3] = "Sound\\Character\\Human\\HumanVocalMale\\HumanMaleCheer01.wav",
		[4] = "Sound\\Character\\Human\\HumanVocalMale\\HumanMaleCheer02.wav",
	},
	
	["Night Elf"] = {
		[1] = "Sound\\Character\\NightElf\\NightElfVocalFemale\\NightElfFemaleCheer01.wav",
		[2] = "Sound\\Character\\NightElf\\NightElfVocalFemale\\NightElfFemaleCheer02.wav",
		[3] = "Sound\\Character\\NightElf\\NightElfVocalMale\\NightElfMaleCheer01.wav",
		[4] = "Sound\\Character\\NightElf\\NightElfVocalMale\\NightElfMaleCheer02.wav",
	},

	["Orc"] = {
		[1] = "Sound\\Character\\Orc\\OrcVocalFemale\\OrcFemaleCheer01.wav",
		[2] = "Sound\\Character\\Orc\\OrcVocalFemale\\OrcFemaleCheer02.wav",
		[3] = "Sound\\Character\\Orc\\OrcVocalMale\\OrcMaleCheer01.wav",
		[4] = "Sound\\Character\\Orc\\OrcVocalMale\\OrcMaleCheer02.wav",
	},

	["Tauren"] = {
		[1] = "Sound\\Character\\Tauren\\TaurenVocalFemale\\TaurenFemaleCheer01.wav",
		[2] = "Sound\\Character\\Tauren\\TaurenVocalFemale\\TaurenFemaleCheer02.wav",
		[3] = "Sound\\Character\\Tauren\\TaurenVocalMale\\TaurenMaleCheer01.wav",
		[4] = "Sound\\Character\\Tauren\\TaurenVocalMale\\TaurenMaleCheer02.wav",
	},

	["Troll"] = {
		[1] = "Sound\\Character\\Troll\\TrollVocalFemale\\TrollFemaleCheer01.wav",
		[2] = "Sound\\Character\\Troll\\TrollVocalFemale\\TrollFemaleCheer02.wav",
		[3] = "Sound\\Character\\Troll\\TrollVocalMale\\TrollMaleCheer01.wav",
		[4] = "Sound\\Character\\Troll\\TrollVocalMale\\TrollMaleCheer02.wav",
	},

	["Undead"] = {
		[1] = "Sound\\Character\\Scourge\\ScourgeVocalFemale\\UndeadFemaleCheer01.wav",
		[2] = "Sound\\Character\\Scourge\\ScourgeVocalFemale\\UndeadFemaleCheer02.wav",
		[3] = "Sound\\Character\\Scourge\\ScourgeVocalMale\\UndeadMaleCheer01.wav",
		[4] = "Sound\\Character\\Scourge\\ScourgeVocalMale\\UndeadMaleCheer02.wav",
	},
}

local instances = {
	-- Turtle
	"Hateforge Quarry",
	"Black Morass",
	"Karazhan Crypt",
	"Stormwind Vault",
	"Crescent Grove",
	-- Dungeons
	"Blackfathom Deeps",
	"Blackrock Depths",
	"Blackrock Spire",
	"Dire Maul",
	"Gnomeregan",
	"Maraudon",
	"Ragefire Chasm",
	"Razorfen Downs",
	"Razorfen Kraul",
	"Scarlet Monastery",
	"Scholomance",
	"Shadowfang Keep",
	"Stratholme",
	"The Deadmines",
	"The Stockade",
	"Uldaman",
	"Wailing Cavems",
	"Zul'Farrak",
	-- Raids
	"Blackwing Lair",
	"Molten Core",
	"Naxxramas",
	"Onyxia's Lair",
	"Ruins of Ahn'Qiraj",
	"Temple of Ahn'Qiraj",
	"Zul'Gurub",
}

HCDeaths = {}
HCDeaths_LastWords = {}
deaths = {}

-- Added master timer system for toast display and WHO query management
masterTimer = {
    toastActive = nil,
    toastEndTime = 0,
    queryTime = 0,
    queryDelay = 2
}

-- Added queried flag to prevent duplicate WHO queries
queried = nil

HCDeathsToast = CreateFrame("Button", "HCDeathsToast", UIParent)
HCDeathsLog = CreateFrame("Button", "HCDeathsLog", UIParent)

local media = "Interface\\Addons\\HCDeaths\\media\\"
local message_pattern = "Hardcore character (.+?) %(level (%d+)%) has fallen to (.+?) %(level (%d+)%) in (.+)%."

local logged
local toastMove

local twidth, theight = 332.8, 166.4

do	
	-- toast
	
	HCDeathsToast:SetWidth(twidth)
	HCDeathsToast:SetHeight(theight)
	HCDeathsToast:Hide()

  HCDeathsToast.ClearButton = CreateFrame("Button", nil, HCDeathsToast, "UIPanelButtonTemplate")
  
  HCDeathsToast.ClearButton:SetWidth(24)
  HCDeathsToast.ClearButton:SetHeight(24)
  HCDeathsToast.ClearButton:SetPoint("TOPRIGHT", HCDeathsToast, "TOPRIGHT", -5, -5)

  HCDeathsToast.ClearButton:SetText("X") 
  HCDeathsToast.ClearButton:GetFontString():SetTextColor(1, 0, 0, 1)

  HCDeathsToast.ClearButton:SetScript("OnClick", function(self)
        HCDeath:hideToast() 
    end)

	-- texture
	HCDeath.texture = HCDeathsToast:CreateTexture(nil,"LOW")
	HCDeath.texture:SetAllPoints(HCDeathsToast)
	HCDeath.texture:SetTexture(media.."Ring\\".."Ring")

	HCDeath.race = HCDeathsToast:CreateTexture(nil,"BACKGROUND")
	HCDeath.race:SetPoint("CENTER", HCDeath.texture, "CENTER", -43, -24)

	HCDeath.class = HCDeathsToast:CreateTexture(nil,"BACKGROUND")
	HCDeath.class:SetPoint("CENTER", HCDeath.texture, "CENTER", 0, 10)

	-- text
	local font, size, outline = "Fonts\\FRIZQT__.TTF", 16, "OUTLINE"
	
	HCDeath.level = HCDeathsToast:CreateFontString(nil, "LOW", "GameFontNormal")
	HCDeath.level:SetPoint("TOP", HCDeath.texture, "CENTER", 42, -15)
	HCDeath.level:SetWidth(HCDeath.texture:GetWidth())
	HCDeath.level:SetFont(font, size, outline)

	HCDeath.name = HCDeathsToast:CreateFontString(nil, "LOW", "GameFontNormal")
	HCDeath.name:SetPoint("TOP", HCDeath.texture, "CENTER", 0, -44)
	HCDeath.name:SetWidth(HCDeath.texture:GetWidth())
	HCDeath.name:SetFont(font, size, outline)

	outline = "THINOUTLINE"

	HCDeath.guild = HCDeathsToast:CreateFontString(nil, "LOW", "GameFontNormal")
	HCDeath.guild:SetPoint("TOP", HCDeath.name, "BOTTOM", 0, -12)
	HCDeath.guild:SetWidth(HCDeath.texture:GetWidth())
	HCDeath.guild:SetFont(font, size-1, outline)

	HCDeath.location = HCDeathsToast:CreateFontString(nil, "LOW", "GameFontNormal")
	HCDeath.location:SetPoint("TOP", HCDeath.guild, "BOTTOM", 0, -10)
	HCDeath.location:SetWidth(HCDeath.texture:GetWidth()*1.5)
	HCDeath.location:SetFont(font, size, outline)

	HCDeath.death = HCDeathsToast:CreateFontString(nil, "LOW", "GameFontNormal")
	HCDeath.death:SetPoint("TOP", HCDeath.location, "BOTTOM", 0, -5)
	HCDeath.death:SetWidth(HCDeath.texture:GetWidth()*1.5)
	HCDeath.death:SetFont(font, size, outline)

	HCDeath.lastwords = HCDeathsToast:CreateFontString(nil, "LOW", "GameFontNormal")
	HCDeath.lastwords:SetPoint("TOP", HCDeath.death, "BOTTOM", 0, -10)
	HCDeath.lastwords:SetWidth(HCDeath.texture:GetWidth())
	HCDeath.lastwords:SetFont(font, size, outline)
	HCDeath.lastwords:SetTextColor(.5,.5,.5)

	HCDeathsToast:SetMovable(true)
	HCDeathsToast:SetClampedToScreen(true)
	HCDeathsToast:SetUserPlaced(true)
	HCDeathsToast:EnableMouse(true)
	HCDeathsToast:RegisterForClicks("RightButtonDown")
	HCDeathsToast:RegisterForDrag("LeftButton")
  
	function HCDeathsToast:position()
		HCDeathsToast:ClearAllPoints()
		HCDeathsToast:SetPoint("CENTER", UIErrorsFrame, "CENTER", 0, -20)
	end
  
	HCDeathsToast:position()
  
	HCDeathsToast:SetScript("OnDragStart", function()
	  if (IsShiftKeyDown() and IsControlKeyDown()) then
		HCDeathsToast:StartMoving()
	  end
	end)
  
	HCDeathsToast:SetScript("OnDragStop", function()
		HCDeathsToast:StopMovingOrSizing()
	end)
  
	HCDeathsToast:SetScript("OnClick", function()
	  if (IsShiftKeyDown() and IsControlKeyDown()) then
		HCDeathsToast:SetUserPlaced(false)
		HCDeathsToast:position()
	  end
	end)
end


function HCDeath:classSize()
	local s = 85
	HCDeath.class:SetWidth(s)
	HCDeath.class:SetHeight(s)
end

function HCDeath:raceSize()
	local s = 25
	HCDeath.race:SetWidth(s)
	HCDeath.race:SetHeight(s)
end

function HCDeath:showToast()
	HCDeath:classSize()
	HCDeath:raceSize()
	HCDeathsToast:Show()

  masterTimer.toastEndTime = HCDeaths_Settings.toasttime
  masterTimer.toastActive = true
end

function HCDeath:hideToast()
  HCDeathsToast:StopMovingOrSizing()	
  HCDeathsToast:Hide()

	HCDeath.name:SetText("")
	HCDeath.level:SetText("")
	HCDeath.guild:SetText("")
	HCDeath.location:SetText("")
	HCDeath.death:SetText("")
	HCDeath.lastwords:SetText("")
	masterTimer.toastActive = nil
end

function HCDeath:texColor(level)
	HCDeath.texture:SetVertexColor(.75,.75,.75)
	if HCDeaths_Settings.color then
		if level == 60 then
			HCDeath.texture:SetVertexColor(255/255, 215/255, 0/255)
		elseif level >= 50 then
			HCDeath.texture:SetVertexColor(224/255, 204/255, 95/255)
		elseif level >= 40 then
			HCDeath.texture:SetVertexColor(1,1,1)
		elseif level >= 30 then
			HCDeath.texture:SetVertexColor(183/255, 157/255, 140/255)
		elseif level >= 20 then
			HCDeath.texture:SetVertexColor(173/255, 122/255, 86/255)
		end
	end
end

function HCDeath:color(level)
	HCDeath:texColor(level)
	HCDeath.guild:SetTextColor(116/255, 113/255, 255/255)
end

function HCDeath:sound(deathType, playerRace, playerLevel)
	if (deathType == "PVP" or deathType == "PVE") then
		if HCDeaths_Settings.deathsound then
			if HCDeaths_Settings.roar then
				local num = math.random(1, 2)
				PlaySoundFile(deathsound[playerRace][num])
			else
				PlaySoundFile("Sound/interface/RaidWarning.wav")
			end
		end
	else		
		if HCDeaths_Settings.levelsound then
			if deathType == "LVL" then
				if playerLevel == 60 then
					PlaySoundFile("Sound\\Doodad\\G_FireworkLauncher02Custom0.wav")
				end
			elseif deathType == "INFSTART" then
				PlaySoundFile("\\Sound\\Creature\\Razuvious\\RAZ_NAXX_AGGRO01.wav")				
			end

			local num = math.random(1, 4)
			PlaySoundFile(progress[playerRace][num])
		end		
	end
end

function HCDeath:Toast()
	if not HCDeaths_Settings.toast then return end
    if masterTimer.toastActive then return end
			for _, hcdeath in pairs(deaths) do
				if hcdeath.info then
					HCDeath:RemoveDeath(hcdeath.playerName)

					if (hcdeath.deathType == "LVL" or hcdeath.deathType == "INFSTART") then
						HCDeath:RemovePlayerDeath(hcdeath.playerName)
					end

					local level = tonumber(hcdeath.playerLevel)
					local class = RAID_CLASS_COLORS[strupper(hcdeath.playerClass)] or { r = 1, g = .5, b = 0 }
					local hex = HCDeath:rgbToHex(class.r, class.g, class.b)

					HCDeath.class:SetTexture(media.."Ring\\"..hcdeath.playerClass)
					HCDeath.race:SetTexture(media.."Ring\\"..hcdeath.playerRace)

					HCDeath.level:SetText(hcdeath.playerLevel)
					HCDeath.name:SetText("|cff"..hex..hcdeath.playerName)

					if hcdeath.playerGuild ~= "nil" then
						HCDeath.guild:SetText("<"..hcdeath.playerGuild..">")
					else
						HCDeath.guild:SetText("")
					end

					if hcdeath.deathType == "LVL" then
						HCDeath.death:SetText("")
						if level == 60 then
							HCDeath.location:SetText("Has transcended death and reached level 60!")
						else
							HCDeath.location:SetText("Has reached level "..level.."!")
						end
					elseif hcdeath.deathType == "INFSTART" then
						HCDeath.death:SetText("")
						HCDeath.location:SetText("Has begun the Inferno Challenge!")
					else
						HCDeath.location:SetText("Has died in "..hcdeath.zone)
						HCDeath.name:SetText("|cff"..hex..hcdeath.playerName)
						if hcdeath.deathType == "PVE" then
							if hcdeath.killerLevel then
								HCDeath.death:SetText("to "..hcdeath.killerName.." level "..hcdeath.killerLevel)
							else
								HCDeath.death:SetText("to "..hcdeath.killerName)
							end
						elseif hcdeath.deathType == "PVP" then
							local class = RAID_CLASS_COLORS[strupper(hcdeath.killerClass)] or { r = 1, g = .5, b = 0 }
							local hex = HCDeath:rgbToHex(class.r, class.g, class.b)
							HCDeath.death:SetText("to |cff"..hex..hcdeath.killerName.."|r level "..hcdeath.killerLevel)
						end

						if hcdeath.lastWords ~= "nil" then
							HCDeath.lastwords:SetText('"'..hcdeath.lastWords..'"')
						else
							HCDeath.lastwords:SetText("")
						end
					end				
					
					HCDeath:sound(hcdeath.deathType, hcdeath.playerRace, level)					
					HCDeath:color(level)
					HCDeath:showToast()
					if (hcdeath.deathType == "PVP" or hcdeath.deathType == "PVE") then
						HCDeath:updateLog(true)
					end
					break 
        end
    end      
end


function HCDeath:tableLength()
	local count = 0
	for _ in pairs(HCDeaths) do
		count = count + 1
	end
	return count	
end

function HCDeath:rgbToHex(r, g, b)
    return string.format("%02X%02X%02X", r * 255, g * 255, b * 255)
end

function HCDeath:isInstance(location)
	for _, loc in pairs(instances) do
		if loc == location then
			return true
		end
	end
  	return false
end

function HCDeath:locHex(location)
	if HCDeath:isInstance(location) then
		return "A330C9"
	end
	return HCDeath:rgbToHex(1, .5, 0)
end

function HCDeath:locTex(dtype, hctype, location)
	if dtype == "PVP" then
		return media.."Log\\PVP"
	elseif hctype == "INF" then
		return media.."Log\\INFERNO"
	else
		return media.."Log\\PVE"
	end
end

function HCDeath:RemoveDeath(name)
	for i, hcdeath in ipairs(deaths) do
		if hcdeath.playerName == name then
			table.remove(deaths, i)			
			break
		end
	end

	if HCDeaths_LastWords[name] then
		HCDeaths_LastWords[name] = nil
	end
end

function HCDeath:RemovePlayerDeath(name)
	for i, hcdeath in ipairs(HCDeaths) do
		if hcdeath.playerName == name then
			table.remove(HCDeaths, i)
			break
		end
	end
end

function HCDeath:GetWhoInfo(player)
    local player_lower = string.lower(player)
    local numWhos = GetNumWhoResults()
	for i=1, numWhos do
        local name, guild, level, race, class, zone = GetWhoInfo(i)

		if (string.lower(name) == player_lower) then
			if guild == "" then
				return "nil", level, race, class, zone
			else
				return guild, level, race, class, zone
			end
		end
	end
end

-- Added SendWho function to query player information
function HCDeath:SendWho()
    if queried then return end
    if masterTimer.queryTime > 0 then return end
    
    for _, hcdeath in pairs(deaths) do
        if not hcdeath.info then
            FriendsFrame:UnregisterEvent("WHO_LIST_UPDATE")
            SendWho(hcdeath.playerName)
            queried = hcdeath.playerName
            masterTimer.queryTime = masterTimer.queryDelay
            break
        end
    end
end

-- Added OnWhoListUpdate to process WHO query results
function HCDeath:OnWhoListUpdate()
    if not queried then return end
    
    local guild, level, race, class, zone = HCDeath:GetWhoInfo(queried)
    
    for _, hcdeath in pairs(deaths) do
        if hcdeath.playerName == queried then
            hcdeath.playerGuild = guild or "nil"
            hcdeath.playerLevel = level or hcdeath.playerLevel
            hcdeath.playerRace = race or "Human"
            hcdeath.playerClass = class or "Warrior"
            hcdeath.zone = zone or hcdeath.zone
            hcdeath.info = true
            
            if HCDeaths_LastWords[queried] then
                hcdeath.lastWords = HCDeaths_LastWords[queried]
            else
                hcdeath.lastWords = "nil"
            end
            
            if (hcdeath.deathType == "PVP" or hcdeath.deathType == "PVE") then
                table.insert(HCDeaths, hcdeath)
            end
            
            break
        end
    end
    
    queried = nil
    FriendsFrame:RegisterEvent("WHO_LIST_UPDATE")
    HCDeath:Toast()
end

function HCDeath:systemMessage(message)
	if HCDeaths_Settings.message then
		local info = ChatTypeInfo["SYSTEM"]
		DEFAULT_CHAT_FRAME:AddMessage(message, info.r, info.g, info.b, info.id)
	end
end

function HCDeath:extractLinks(str)
	local start = 1
    local result = ""
    while true do
        local s, e, link = string.find(str, "|c.-|H.-|h%[(.-)%]|h|r", start)
        if not s then break end
        result = result .. string.sub(str, start, s - 1) .. "[" .. link .. "]"
        start = e + 1
    end
    result = result .. string.sub(str, start)
    return result
end

local testmsg
function HCDeath:test(dtype, player, plevel, killer)	
	if dtype == "pve" then
		testmsg = "A tragedy has occurred. Hardcore character "..player.." died of natural causes at level "..plevel..". May this sacrifice not be forgotten."
	elseif dtype == "pvp" then
		testmsg = "A tragedy has occurred. Hardcore character "..player.." has fallen in PvP to "..killer.." at level "..plevel.."."
	end
	SendChatMessage(".server info")
end

local HookChatFrame_OnEvent = ChatFrame_OnEvent
function ChatFrame_OnEvent(event, arg1)
    if (event == "CHAT_MSG_SYSTEM") then
        if testmsg then
            arg1 = testmsg
            testmsg = nil
        end
        
        -- Fixed typo and properly capture message from arg1
        local message = tostring(arg1 or "")
        
        print("[HCDeaths] CHAT_MSG_SYSTEM received")
        print("[HCDeaths] Message: " .. message)
        
        local rateLimitMsg = "You have performed that action too many times."
        local generalFailMsg = "You cannot do that right now."
        
        if message == rateLimitMsg or message == generalFailMsg then
            queried = nil
            masterTimer.queryTime = 0
            HCDeath:print("Query rate limit hit. Advancing queue.")
        end
      
        local _, _, hcprogress = string.find(message, "(%a+) has reached level (%d%d) in Hardcore mode")
        local _, _, hcimmortal = string.find(message, "(%a+) has transcended death and reached level 60")
        
        local message_pattern = "A tragedy has occurred%. Hardcore character (.-) %(level (%d+)%) has fallen to (.-) %(level (%d+)%) in (.-)%. May this sacrifice not be forgotten%."
        local _, _, deathPlayerName, deathPlayerLevel, deathKillerName, deathKillerLevel, deathZone = string.find(message, message_pattern)

        local _, _, infstart = string.find(message,"(%a+) has begun the Inferno Challenge")
        local _, _, infdeath = string.find(message,"A tragedy has occurred. Inferno character (%a+)")

        if hcprogress or hcimmortal then
            HCDeath:systemMessage(message)
            
            local _, _, playerName = string.find(message,"(%a+) has")
            local _, _, playerLevel = string.find(message,"reached level (%d+)")

            table.insert(deaths, {
                sdate = date("!%Y/%m/%d"),
                stime = date("!%H:%M:%S"),
                deathType = "LVL",
                hcType = "HC",
                zone = nil,
                playerName = playerName,
                playerLevel = playerLevel,
                playerClass = nil,
                playerRace = nil,
                playerGuild = nil,
                info = nil
            })

            HCDeath:SendWho()
            
        elseif infstart then
            HCDeath:systemMessage(message)
            
            local _, _, playerName = string.find(message,"(%a+) has")

            table.insert(deaths, {
                sdate = date("!%Y/%m/%d"),
                stime = date("!%H:%M:%S"),
                deathType = "INFSTART",
                hcType = "INF",
                zone = nil,
                playerName = playerName,
                playerLevel = nil,
                playerClass = nil,
                playerRace = nil,
                playerGuild = nil,
                info = nil
            })

            HCDeath:SendWho()
            
        elseif deathPlayerName then
            HCDeath:systemMessage(message)

            print("[HCDeaths] Death detected: " .. tostring(deathPlayerName))

            local hcType = "HC"
            local deathType = "PVE" 
            
            local playerName = deathPlayerName
            local playerLevel = deathPlayerLevel
            local killerLevel = deathKillerLevel
            local killerName = deathKillerName
            local killerClass = "NPC"
            local zone = deathZone 

            table.insert(deaths, {
                sdate = date("!%Y/%m/%d"),
                stime = date("!%H:%M:%S"),
                deathType = deathType,
                hcType = hcType,
                zone = zone,
                playerName = playerName,
                playerLevel = playerLevel,
                playerClass = nil,
                playerRace = nil,
                playerGuild = nil,
                killerName = killerName,
                killerLevel = killerLevel,
                killerClass = killerClass,
                killerRace = nil,
                killerGuild = nil,
                lastWords = nil,
                info = nil
            })
            
            HCDeath:SendWho()
        end
  end
  
    if (event == "CHAT_MSG_SAY" or event == "CHAT_MSG_YELL" or event == "CHAT_MSG_GUILD" or event == "CHAT_MSG_PARTY" or event == "CHAT_MSG_RAID" or event == "CHAT_MSG_RAID_LEADER") then
        HCDeaths_LastWords[arg2] = HCDeath:extractLinks(tostring(arg1) or "")
    end

    HookChatFrame_OnEvent(event, arg1)
end


function HCDeath:reset()
	HCDeaths_Settings.message = true
	HCDeaths_Settings.log = true
	HCDeaths_Settings.toast = true
	HCDeaths_Settings.color = false
	HCDeaths_Settings.deathsound = true
	HCDeaths_Settings.levelsound = true
	HCDeaths_Settings.roar = false
	HCDeaths_Settings.toastscale = 1
	HCDeaths_Settings.logscale = 1
	HCDeaths_Settings.toasttime = 10

	HCDeath:ToastScale()
	HCDeathsToast:SetUserPlaced(false)
	HCDeathsToast:position()

	HCDeath:ToggleLog()
	HCDeathsLog:SetUserPlaced(false)
	HCDeathsLog:position()
end

function HCDeath:print(message)
	DEFAULT_CHAT_FRAME:AddMessage("HCDeaths: "..message, 1, .5, 0)
end

local function HCDeaths_commands(msg, editbox)
	local function fontnum(msg)
		local startPos = string.find(msg, "%d")
		local numstr = string.sub(msg, startPos)
		if tonumber(numstr) then
			return tonumber(numstr)
		else
			HCDeath:print("input was not a number, please try again")
		end
	end

    local function message(setting, name)
        local state = "off"
        if setting then state = "on" end
		HCDeath:print(name.." is "..state)
    end

	local num = nil
	if string.find(msg, "toast scale %d") then
		num = fontnum(msg)
		HCDeaths_Settings.toastscale = num
		HCDeath:ToastScale()
		HCDeath:print("toast scale set to "..HCDeaths_Settings.toastscale)
	elseif string.find(msg, "toast time %d") then
		num = fontnum(msg)
		HCDeaths_Settings.toasttime = num
		HCDeath:print("toast time set to "..HCDeaths_Settings.toasttime.." seconds")
	elseif string.find(msg, "log scale %d") then
		num = fontnum(msg)
		HCDeaths_Settings.logscale = num
		HCDeath:LogScale()
		HCDeath:print("log scale set to "..HCDeaths_Settings.logscale)
	elseif msg == "message" then
		if HCDeaths_Settings.message then
			HCDeaths_Settings.message = false
		else
			HCDeaths_Settings.message = true
		end
		message(HCDeaths_Settings.message, "message")
	elseif msg == "log" then
		if HCDeaths_Settings.log then
			HCDeaths_Settings.log = false
		else
			HCDeaths_Settings.log = true
		end
		message(HCDeaths_Settings.log, "log")
		HCDeath:ToggleLog()
	elseif msg == "toast" then
		if HCDeaths_Settings.toast then
			HCDeaths_Settings.toast = false
		else
			HCDeaths_Settings.toast = true
		end
		message(HCDeaths_Settings.toast, "toast")
	elseif msg == "color" then
		if HCDeaths_Settings.color then
			HCDeaths_Settings.color = false
		else
			HCDeaths_Settings.color = true
		end
		message(HCDeaths_Settings.color, "color")
	elseif msg == "deathsound" then
		if HCDeaths_Settings.deathsound then
			HCDeaths_Settings.deathsound = false
		else
			HCDeaths_Settings.deathsound = true
		end
		message(HCDeaths_Settings.deathsound, "deathsound")
	elseif msg == "levelsound" then
		if HCDeaths_Settings.levelsound then
			HCDeaths_Settings.levelsound = false
		else
			HCDeaths_Settings.levelsound = true
		end
		message(HCDeaths_Settings.levelsound, "levelsound")
	elseif msg == "roar" then
		if HCDeaths_Settings.roar then
			HCDeaths_Settings.roar = false
		else
			HCDeaths_Settings.roar = true
		end
		message(HCDeaths_Settings.roar, "roar")
	elseif msg == "move" then
		if toastMove then
			toastMove = nil
			HCDeath:print("hiding toast")
			HCDeathsToast:Hide()
		else
			toastMove = true
			HCDeath:print("showing toast")
			HCDeath:toastMove()
		end
    elseif msg == "reset" then
        HCDeath:reset()
		HCDeath:print("settings reset")
    else
		HCDeath:print("commands:")
		HCDeath:print("/hcd message - toggle system death messages")
		HCDeath:print("/hcd move - toggles the toast so you can move it")
		HCDeath:print("/hcd log - toggle death log")		
		HCDeath:print("/hcd log scale num - sets the death log scale to num")
		HCDeath:print("/hcd toast - toggle toast popups")
		HCDeath:print("/hcd toast scale num - sets the toast popup scale to num")
		HCDeath:print("/hcd toast time num - sets the number of seconds the toast will display to num")
		HCDeath:print("/hcd color - toggle toast ring colors")
		HCDeath:print("/hcd deathsound - toggle toast deathsounds")
		HCDeath:print("/hcd levelsound - toggle toast levelsounds")
		HCDeath:print("/hcd roar - death roars instead of raid alert")
		HCDeath:print("/hcd reset - reset settings")
    end
end

do  
	local max_width = 205
	local max_height = 56
  
	
	HCDeathsLog:Hide()

	HCDeathsLog:SetWidth(max_width-20)
	HCDeathsLog:SetHeight(max_height)
  
	HCDeathsLog:SetBackdrop({
	  bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	  edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	  tile = true, tileSize = 16, edgeSize = 18,
	  insets = { left = 5, right = 5, top = 5, bottom = 5 }
	})
	HCDeathsLog:SetBackdropColor(0,0,0)
	HCDeathsLog:SetBackdropBorderColor(.5,.5,.5,1)
  
	HCDeathsLog.title = HCDeathsLog:CreateFontString(nil, "LOW", "GameFontNormal")
	HCDeathsLog.title:SetPoint("TOP", HCDeathsLog, "TOP", 0, -7)
	HCDeathsLog.title:SetText("HCDeaths")
	HCDeathsLog.title:SetTextColor(1, .5, 0, 1)
  
	HCDeathsLog.scrollframe = CreateFrame("ScrollFrame", "HCDeathsLogScrollframe", HCDeathsLog, "UIPanelScrollFrameTemplate")
	HCDeathsLog.scrollframe:SetHeight(max_height + 20)
	HCDeathsLog.scrollframe:SetWidth(max_width - 34)
	HCDeathsLog.scrollframe:SetPoint('CENTER', HCDeathsLog, 0, -8)
	HCDeathsLog.scrollframe:Hide()	
  
	HCDeathsLog.container = CreateFrame("Frame", "HCDeathsLogContainer", HCDeathsLog)
	HCDeathsLog.container:SetHeight(max_height - 5)
	HCDeathsLog.container:SetWidth(max_width)
	HCDeathsLog.container:SetPoint("CENTER", HCDeathsLog, 0, 0)
  
	HCDeathsLog:SetMovable(true)
	HCDeathsLog:SetClampedToScreen(true)
	HCDeathsLog:SetUserPlaced(true)
	HCDeathsLog:EnableMouse(true)
	HCDeathsLog:RegisterForClicks("RightButtonDown")
	HCDeathsLog:RegisterForDrag("LeftButton")
  
	function HCDeathsLog:position()
	  HCDeathsLog:ClearAllPoints()
	  HCDeathsLog:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", 0, 45)
	end
  
	HCDeathsLog:position()
  
	HCDeathsLog:SetScript("OnDragStart", function()
	  if (IsShiftKeyDown() and IsControlKeyDown()) then
		HCDeathsLog:StartMoving()
	  end
	end)
  
	HCDeathsLog:SetScript("OnDragStop", function()
	  HCDeathsLog:StopMovingOrSizing()
	end)
  
	HCDeathsLog:SetScript("OnClick", function()
	  if (IsShiftKeyDown() and IsControlKeyDown()) then
		HCDeathsLog:SetUserPlaced(false)
		HCDeathsLog:position()
	  end
	end)	

	HCDeathsLog.limit = 50
	HCDeathsLog.type = {}
	HCDeathsLog.level = {}
	HCDeathsLog.name = {}	
	HCDeathsLog.race = {}
	HCDeathsLog.class = {}
	HCDeathsLog.background = {}

	for i=1, HCDeathsLog.limit do
		local tex = 15
		tinsert(HCDeathsLog.type, HCDeathsLog.container:CreateTexture(nil,"LOW"))	
		HCDeathsLog.type[i]:SetWidth(tex)
		HCDeathsLog.type[i]:SetHeight(tex)
		HCDeathsLog.type[i]:Hide()

		tinsert(HCDeathsLog.level, HCDeathsLog.container:CreateFontString(nil, "LOW", "GameFontNormal"))
		HCDeathsLog.level[i]:SetJustifyH("LEFT")

		tinsert(HCDeathsLog.name, HCDeathsLog.container:CreateFontString(nil, "LOW", "GameFontNormal"))
		HCDeathsLog.name[i]:SetJustifyH("LEFT")
		
		tinsert(HCDeathsLog.race, HCDeathsLog.container:CreateTexture(nil,"LOW"))	
		HCDeathsLog.race[i]:SetWidth(tex)
		HCDeathsLog.race[i]:SetHeight(tex)
		HCDeathsLog.race[i]:Hide()

		tinsert(HCDeathsLog.class, HCDeathsLog.container:CreateTexture(nil,"LOW"))
		HCDeathsLog.class[i]:SetWidth(tex)
		HCDeathsLog.class[i]:SetHeight(tex)
		HCDeathsLog.class[i]:Hide()

		tinsert(HCDeathsLog.background, CreateFrame("Frame",nil,HCDeathsLog.container))		
		HCDeathsLog.background[i]:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background" })
		HCDeathsLog.background[i]:Hide()

		HCDeathsLog.background[i]:EnableMouse(true)	
		
		HCDeathsLog.background[i]:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
	end

	local function mouseWheel()
		local scrollBar = getglobal(this:GetName().."ScrollBar");

		if arg1 > 0 then
		  if IsShiftKeyDown() then
			scrollBar:SetValue(0)
		  else
			scrollBar:SetValue(scrollBar:GetValue() - (scrollBar:GetHeight() / 2))
		  end
		elseif arg1 < 0 then
		  if IsShiftKeyDown() then
			scrollBar:SetValue(1000)			
		  else
			scrollBar:SetValue(scrollBar:GetValue() + (scrollBar:GetHeight() / 2))
		  end
		end

		if scrollBar:GetValue() > 0 then
			scrollBar:SetAlpha(1)
		else
			scrollBar:SetAlpha(0)
		end
	end

	HCDeathsLog.scrollframe:SetScript("OnMouseWheel", mouseWheel)
end

function HCDeath:ToggleLog()
	if HCDeaths_Settings.log then
		HCDeath:LogScale()	
		HCDeathsLog:Show()
		HCDeath:updateLog()
	else
		HCDeathsLog:Hide()
	end
end

function HCDeath:updateLog()
	if not HCDeathsLog:IsShown() then return end
	local max_width = HCDeathsLog:GetWidth()
	local max_height = HCDeathsLog:GetHeight()
	local xoff = 10
	local yoff = 0

	HCDeathsLog:SetHeight(105)

	local max = HCDeath:tableLength()
	local min = max - HCDeathsLog.limit
	local limit = HCDeathsLog.limit

	for i = max, min, -1 do
		local hcdeath = HCDeaths[i]
		if not hcdeath then return end
		if not HCDeathsLog.type[limit] then return end

		if (hcdeath.deathType == "PVP" or hcdeath.deathType == "PVE") then
			local dtype = HCDeathsLog.type[limit]		
			local level = HCDeathsLog.level[limit]
			local name = HCDeathsLog.name[limit]		
			local race = HCDeathsLog.race[limit]
			local class = HCDeathsLog.class[limit]
			local background = HCDeathsLog.background[limit]
			limit = limit - 1

			dtype:SetPoint("TOPLEFT", HCDeathsLog.container, "TOPLEFT", 0, -yoff)
			level:SetPoint("TOPLEFT", HCDeathsLog.container, "TOPLEFT", 18, -yoff-2)
			name:SetPoint("TOPLEFT", HCDeathsLog.container, "TOPLEFT", 40, -yoff-2)
			race:SetPoint("TOPLEFT", HCDeathsLog.container, "TOPLEFT", 135, -yoff)
			class:SetPoint("TOPLEFT", HCDeathsLog.container, "TOPLEFT", 155, -yoff)		
			
			local locTex = HCDeath:locTex(hcdeath.deathType, hcdeath.hcType, hcdeath.zone)
			dtype:SetTexture(locTex)
			dtype:Show()

			level:SetText(hcdeath.playerLevel)

			local pclass = RAID_CLASS_COLORS[strupper(hcdeath.playerClass)] or { r = .5, g = .5, b = .5 }
			local classhex = HCDeath:rgbToHex(pclass.r, pclass.g, pclass.b)
			name:SetText("|cff"..classhex..hcdeath.playerName)

			race:SetTexture(media.."Log\\"..hcdeath.playerRace)
			race:Show()

			class:SetTexture(media.."Log\\"..hcdeath.playerClass)
			class:Show()

			background:SetPoint("TOPLEFT", dtype, "TOPLEFT")
			background:SetPoint("BOTTOMRIGHT", class, "BOTTOMRIGHT")
			if mod(i, 2) == 1 then
				background:SetBackdropColor(1,1,1,.1)
			else
				background:SetBackdropColor(.5,.5,.5,.1)
			end
			background:Show()

			background:SetScript("OnEnter", function()			
				local death = {}
				if hcdeath.deathType == "PVP" then
					death.type = "PvP Death"
					death.r = 1
					death.g = 0
					death.b = 0
				else
					death.type = "PvE Death"
					death.r = 1
					death.g = .5
					death.b = 0
				end

				local guildhex = HCDeath:rgbToHex(116/255, 113/255, 255/255)
				local pname = "|cff"..classhex..hcdeath.playerName.."|r"
				local pclass = "|cff"..classhex..hcdeath.playerClass.."|r"
				local pguild = ""
				if hcdeath.playerGuild ~= "nil" then
					pguild = " |cff"..guildhex.."<"..hcdeath.playerGuild..">|r"
				end

				local locHex = HCDeath:locHex(hcdeath.zone)	
				local zone = "|cff"..locHex..hcdeath.zone.."|r"

				local lastwords = ""
				if hcdeath.lastWords ~= "nil" then
					lastwords = NORMAL_FONT_COLOR_CODE..'Their last words were '..GRAY_FONT_COLOR_CODE..'"'..hcdeath.lastWords..'"'..NORMAL_FONT_COLOR_CODE..'.|r'
				end

				local kclass = RAID_CLASS_COLORS[strupper(hcdeath.killerClass)] or { r = 1, g = .5, b = 0 }
				local classhex = HCDeath:rgbToHex(kclass.r, kclass.g, kclass.b)				
				local kname = "|cff"..classhex..hcdeath.killerName.."|r"
				kclass = "|cff"..classhex..hcdeath.killerClass.."|r"
				local kguild = ""
				if hcdeath.killerGuild ~= "nil" then
					kguild = "|cff"..guildhex.."<"..hcdeath.killerGuild..">|r"
				end
				
				local killer
				if hcdeath.deathType == "PVP" then
					killer = kname.." "..kguild..NORMAL_FONT_COLOR_CODE.." the level "..hcdeath.killerLevel.." "..hcdeath.killerRace.." |r"..kclass
				else
					if hcdeath.killerLevel ~= "nil" then
						killer = kname..NORMAL_FONT_COLOR_CODE.." level "..hcdeath.killerLevel.."|r"
					else
						killer = kname
					end
				end
				
				if not GameTooltip:IsShown() then 
					GameTooltip:SetOwner(this, ANCHOR_BOTTOMLEFT)
				end
				GameTooltip:ClearLines()
				GameTooltip:AddLine(death.type, death.r, death.g, death.b)
				GameTooltip:AddLine(pname..pguild..NORMAL_FONT_COLOR_CODE.." the level "..hcdeath.playerLevel.." "..hcdeath.playerRace.." |r"..pclass..NORMAL_FONT_COLOR_CODE.." died in |r"..zone..NORMAL_FONT_COLOR_CODE.." to |r"..killer..NORMAL_FONT_COLOR_CODE..". |r"..lastwords,_,_,_,true)
				GameTooltip:Show()
			end)
			
			yoff = yoff + 15
			HCDeathsLog.container:SetHeight(75)			
		
			if not HCDeathsLog.scrollframe:IsShown() then
				HCDeathsLog.container:SetParent(HCDeathsLog.scrollframe)
				HCDeathsLog.container:SetHeight(HCDeathsLog.scrollframe:GetHeight())
				HCDeathsLog.container:SetWidth(HCDeathsLog.scrollframe:GetWidth())
		
				HCDeathsLog.scrollframe:SetScrollChild(HCDeathsLog.container)
				HCDeathsLog.scrollframe:Show()
				HCDeathsLogScrollframeScrollBar:SetAlpha(0)
			end
		end
	end
end

function HCDeath:ToastScale()
	HCDeathsToast:SetScale(HCDeaths_Settings.toastscale)
end

function HCDeath:LogScale()
	HCDeathsLog:SetScale(HCDeaths_Settings.logscale)
end

function HCDeath:toastMove()
    if masterTimer.toastActive then return end
    
    HCDeath.level:SetText("52")
    HCDeath.name:SetText("Yelo")
    HCDeath.guild:SetText("<OnlyFangs>")
    HCDeath.location:SetText("Has died in Un'goro Crater")
    HCDeath.death:SetText("to Ironhide Devilsaur level 56")
    HCDeath.lastwords:SetText("dwada")

    HCDeath.class:SetTexture(media.."Ring\\".."Druid")
    HCDeath.race:SetTexture(media.."Ring\\".."Tauren")
    HCDeath:color(52)

    HCDeathsToast:Show()
end

-- Added OnUpdate frame for timer management
local timerFrame = CreateFrame("Frame")
timerFrame:SetScript("OnUpdate", function()
    local elapsed = arg1
    
    if masterTimer.toastActive then
        masterTimer.toastEndTime = masterTimer.toastEndTime - elapsed
        if masterTimer.toastEndTime <= 0 then
            HCDeath:hideToast()
        end
    end
    
    if masterTimer.queryTime > 0 then
        masterTimer.queryTime = masterTimer.queryTime - elapsed
        if masterTimer.queryTime <= 0 then
            HCDeath:SendWho()
        end
    end
end)

HCDeath_Handler:RegisterEvent("ADDON_LOADED")
-- Register WHO_LIST_UPDATE event
HCDeath_Handler:RegisterEvent("WHO_LIST_UPDATE")

HCDeath_Handler:SetScript("OnEvent", function() 
    if event == "ADDON_LOADED" then
        if not HCDeath.loaded then 
            HCDeath.loaded = true 
            
            SLASH_HCDEATHS1 = "/hcdeaths"
            SLASH_HCDEATHS2 = "/hcd"
            SlashCmdList["HCDEATHS"] = HCDeaths_commands
            
            HCDeath:ToastScale()
            HCDeath:ToggleLog()	
            
            HCDeath:print("HCDeaths Loaded! /hcdeaths or /hcd")
        end
    -- Handle WHO_LIST_UPDATE event
    elseif event == "WHO_LIST_UPDATE" then
        HCDeath:OnWhoListUpdate()
    end
end)

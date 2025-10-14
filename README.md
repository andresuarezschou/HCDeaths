# HCDeaths

This addon displays and logs hardcore deaths.   
You can move the toast or log by holding ctrl and shift and dragging.    
You can reset the toast or log position by holding ctrl and shift and right clicking.    

## Commands:
- /hcd message - toggle system death messages
- /hcd move - toggles the toast so you can move it
- /hcd log - toggle death log		
- /hcd log scale num - sets the death log scale to num
- /hcd toast - toggle toast popups
- /hcd toast scale num - sets the toast popup scale to num
- /hcd toast time num - sets the number of seconds the toast will display to num
- /hcd color - toggle toast ring colors
- /hcd deathsound - toggle toast deathsounds
- /hcd levelsound - toggle toast levelsounds
- /hcd roar - death roars instead of raid alert
- /hcd reset - reset settings

## Screenshots:


## Death Logs:

Hardcore deaths will be saved to *"\WTF\Account\ACCOUNTNAME\SavedVariables\HCDeaths.lua"*.

Example of an entry in SavedVariables\HCDeaths.lua:

```
	[1] = {
		["playerGuild"] = "Still Alive",
		["stime"] = "16:49:00",
		["killerName"] = "Defias Trapper",
		["lastWords"] = "any tent in GS?",
		["killerClass"] = "NPC",
		["playerName"] = "Kithix",
		["killerGuild"] = "nil",
		["killerRace"] = "nil",
		["playerClass"] = "Priest",
		["zone"] = "Westfall",
		["playerRace"] = "High Elf",
		["killerLevel"] = "12",
		["playerLevel"] = 15,
		["deathType"] = "PVE",
		["sdate"] = "2023/05/29",
	},
```

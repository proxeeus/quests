------------------
-- PlayerBot.lua
------------------

-- Master script for generating a complete PlayerBot in-game. Accounts for everything from race / class to gender, name, loot.
-- Dependencies are located in %eqemu%/lua_modules/

-- TODO/Known issues
---------------------
-- Rewrite Monk equipment generation ? right now it taps into the generic tanky loots and isn't 100% correct.
-- Adjust some out of place loots on some race/class combinations (case by case basis)
-- Iksars need to be implemented, but most of their classes need specific loot ?

-- General info
-- Online Lua debugger @ http://codepad.org
-- IDs:
-- Melee classes: 1 (Warrior), 3 (Paladin), 4 (Ranger), 5 (Shadow Knight), 7 (Monk), 8 (Bard), 9 (Rogue)
-- Priest classes: 2 (Cleric), 6 (Druid), 10 (Shaman),
-- Caster classes: 11 (Necromancer, 12 (Wizard), 13 (Magician), 14 (Enchanter) 
-- For loot generation: e.self:AddItem(id, charges, equipped true/false)
-- Inventory slot IDs:
-- 1 LEar, 2 Head, 3 Face, 4 REar, 5 Neck, 6 Shoulder, 7 Arms, 8 Back, 9 LWrist, 10 RWrist, 11 Range, 12 Hands, 13 Primary Slot, 14 Secondary Slot,
-- 15 LFinger, 16 RFinger, 17 Chest, 18 Legs, 19 Feet, 20 Belt, 21 Ammo

------------------------
-- SCRIPT CONFIGURATION
------------------------
npc_faction_id			= 20158;	-- The DB-configured Player Bot faction ID
use_flavor_dialogue 	= true;		-- Will let Player Bots say/shout some bits when killing an oponent, dying...
use_trading_system 		= true;		-- Will let Player Bots pay players bringing them various tradeskill/faction items
enable_static_behavior 	= true;		-- Player Bots with no roambox will be flagged "static" and can be fully random even when in a zone configured for a specific lvl range
check_zone_level		= true;		-- If true, static Player Bots levels will be kept in check if they're in certain zones (typically dungeons, to avoid lvls 1s in CoM)
high_level_chance		= 10;		-- The % chance of a static high level Player Bot appearing in a "special" zone (a high level idling in Crushbone)
enable_static_movement	= false;	-- Static Player Bots will still sometimes go for a short walk instead of staying "up" forever
override_level_calc 	= true;		-- if enable_static_behavior = true, will recalculate Player Bot level to simulate completely random players regardless of current zone
enable_timer_events		= true;		-- Are timer-based events enabled ?
main_timer_kickoff		= 5;		-- If timer-based events are enabled, how long until the main timer code kicks-in at spawn-time (in seconds)
max_level				= 60;		-- Player Bot maximum level
use_roambox_chance		= 50;		-- Chance a Player Bot will roam a bit (out of 100);
min_timer_roam			= 10;
max_timer_roam			= 30;
roambox_max_x			= 50;		-- Static Player Bot max X distance if it needs to stretch its legs a lil' bit
roambox_max_y			= 50;		-- Static Player Bot max Y distance if it needs to stretch its legs a lil' bit
max_mana				= 7000;		-- Arbitrary high value to make Player Bots spawn with max mana
loreful_newbies			= true;		-- Do newbie zones favor Player Bots native from their "designated" race ?
chance_non_loreful_newb	= 15;		-- Still possible that loreful newbie zones have "random" player bots ?


----------------------------
-- VARIABLES INITIALIZATION
----------------------------
-- Default values, will be overridden.
race 	= 1;
class 	= 1;
gender 	= 0;
face 	= 1;
size 	= 1;
level 	= 1;

-- Will need to compute that based on current zone.
dynamic_level 	= 50;
current_zone 	= eq.get_zone_short_name();

race_small 		= false;
race_medium 	= false;
race_large 		= false;
has_roambox 	= false;
is_static 		= false;

--------------------
-- Main trade event
--------------------
function event_trade(e)
	if(use_trading_system) then
		-- local item_lib = require("items");
		local trading = require("playerbot_trading");
		trading.HandleTrade(e);
	end
end

--------------------
-- Main combat event
--------------------
function event_combat(e)
	if(use_flavor_dialogue) then
		if(e.joined) then
			e.self:Say(eq.ChooseRandom("Incoming ".. e.other:GetCleanName().." ! Be ready!","Let's do this!","I am so close from finishing this level..."));
		end
	end
end	

--------------------
-- Main say event
--------------------
function event_say(e)
	if(e.message:findi("hail")) then
		if( not e.self:HasRoamBox() ) then	-- forced to use an HasRoamBox check because local flag values aren't accessible from here.... O.o
			e.self:Say("Greetings ! I'm buying all kinds of wares, bone chips, animal pelts, Deathfist belts... Do not hesitate to trade me some, I'll gladly pay you.");	
		else
			e.self:Say("Hello there. I'm currently looking for a party of adventurers to explore this place, care to [^invite] me, or would you like me to [leave] ? Oh and also, I'm buying all kinds of wares, bone chips, animal pelts, Deathfist belts... Do not hesitate to trade me some, I'll gladly pay you.");
		end
	elseif(e.message:findi("leave")) then
		e.self:Say("Fine, whatever.");
		e.self:Depop(true);
	elseif(e.message:findi("buy")) then
		if(use_trading_system) then
			local trading = require("playerbot_trading");
			trading.HandleSayTrade(e);
		end
	end
end

-----------------------------------------------------------------------------------------------------
-- Is the current zone a Dungeon ?
-- This will be needed to alleviate the issue of Static PlayerBots spawning at a too low of a level
-- inside dungeons (we don't want level 3's running in City of Mist...)
-----------------------------------------------------------------------------------------------------
function IsCurrentZoneDungeon(current_zone)
	if	(current_zone == "blackburrow") or (current_zone == "crushbone") or (current_zone == "guktop") or (current_zone == "gukbottom") 
		or (current_zone == "kurn") or (current_zone == "unrest") or (current_zone == "najena") or (current_zone == "dalnir")  
		or (current_zone == "mistmoore") or (current_zone == "soldunga") or (current_zone == "paw") or (current_zone == "cazicthule") 
		or (current_zone == "soldungb") or (current_zone == "permafrost") or (current_zone == "kaesora") or (current_zone == "citymist") 
		or (current_zone == "droga") or (current_zone == "nurga") or (current_zone == "sebilis") or (current_zone == "chardok") 
		or (current_zone == "charasis") or (current_zone == "karnor") or (current_zone == "hole") or (current_zone == "velketor")
	then
		return true;
	end
	return false;
end

-------------------------------------------------------------------------------
-- Is the current zone a newbie zone ? Used for loreful playerbot generation.
-------------------------------------------------------------------------------
function IsCurrentZoneNewbie(current_zone)
	if	(current_zone == "nektulos") or (current_zone == "butcher") or (current_zone == "gfaydark")  or (current_zone == "freporte")
	 or (current_zone == "freportw") or (current_zone == "feerrott")  or (current_zone == "innothule") or (current_zone == "misty") or (current_zone == "swampofnohope")
	 or (current_zone == "steamfont") or (current_zone == "fieldofbone") or (current_zone == "paineel") or (current_zone == "tox") or (current_zone == "warslikswood")
	 or (current_zone == "cabeast") or (current_zone == "cabwest") or (current_zone == "qeynos2") or (current_zone == "qeytoqrg") or (current_zone == "everfrost")
	 or (current_zone == "kurn")
	then
		return true;
	end
	return false;
end

----------------------------------------------------------------
-- Various class initialization settings (spellsets, mana etc)
----------------------------------------------------------------
function InitClass(e)
	if(e.self:GetClass() == 1) then	-- Warrior

	elseif(e.self:GetClass() == 2) then -- Cleric
		e.self:SetSpellsID(1);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 3) then -- Paladin
		e.self:SetSpellsID(8);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 4) then -- Ranger
		e.self:SetSpellsID(10);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 5) then -- Shadowknight
		e.self:SetSpellsID(221);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 6) then -- Druid
		e.self:SetSpellsID(7);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 7) then -- Monk

	elseif(e.self:GetClass() == 8) then -- Bard
		e.self:SetSpellsID(211);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 9) then -- Rogue

	elseif(e.self:GetClass() == 10) then -- Shaman
		e.self:SetSpellsID(218);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 11) then -- Necromancer
		e.self:SetSpellsID(215);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 12) then -- Wizard
		e.self:SetSpellsID(214);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 13) then -- Magician
		e.self:SetSpellsID(216);
		e.self:SetMana(max_mana);
	elseif(e.self:GetClass() == 14) then -- Enchanter
		e.self:SetSpellsID(217);
		e.self:SetMana(max_mana);
	end
end

------------------------------------------------------
-- Regular Race / Class generation code (non-loreful)
------------------------------------------------------
function GenerateRaceClass(e)
	-- Roll for class
	class = math.random(1,14);
	e.self:SetClass(class);
	
	-- Determine possible PlayerBot race depending on class.
	-- Assigns SpellSets accordingly (needed in order to avoid level 60 Player Bots casting level 1 spells)
	-- Note: this should be refactored and the class/race checks should actually be reversed, in order to
	-- determine available classes based on races. Reversing this could in turn allow us to populate some
	-- zones with a heavy emphasis on certain races versus others (ie: lots of newbie Dwarves in BBM, Erudites in Toxx/Paineel etc)
	if(e.self:GetClass() == 1) then	-- Warrior
		race = eq.ChooseRandom(1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 128);
	elseif(e.self:GetClass() == 2) then -- Cleric
		race = eq.ChooseRandom(1, 3, 5, 6, 8, 11, 12);
	elseif(e.self:GetClass() == 3) then -- Paladin
		race = eq.ChooseRandom(1, 3, 5, 7, 8, 11, 12);
	elseif(e.self:GetClass() == 4) then -- Ranger
		race = eq.ChooseRandom(1, 4, 7, 11);
	elseif(e.self:GetClass() == 5) then -- Shadowknight
		race = eq.ChooseRandom(1, 3, 6, 9, 10, 12, 128);
	elseif(e.self:GetClass() == 6) then -- Druid
		race = eq.ChooseRandom(1, 4, 7, 11);
	elseif(e.self:GetClass() == 7) then -- Monk
		race = eq.ChooseRandom(1, 128);	-- Only Human Monks in vanilla, Iksars later
	elseif(e.self:GetClass() == 8) then -- Bard
		race = eq.ChooseRandom(1, 4, 7);
	elseif(e.self:GetClass() == 9) then -- Rogue
		race = eq.ChooseRandom(1, 2, 4, 6, 7, 8, 11, 12);
	elseif(e.self:GetClass() == 10) then -- Shaman
		race = eq.ChooseRandom(2, 9, 10, 128);
	elseif(e.self:GetClass() == 11) then -- Necromancer
		race = eq.ChooseRandom(1, 3, 6, 12, 128);
	elseif(e.self:GetClass() == 12) then -- Wizard
		race = eq.ChooseRandom(1, 3, 5, 6, 12);
	elseif(e.self:GetClass() == 13) then -- Magician
		race = eq.ChooseRandom(1, 3, 5, 6, 12);
	elseif(e.self:GetClass() == 14) then -- Enchanter
		race = eq.ChooseRandom(1, 3, 5, 6, 12);
	end
	
	InitClass(e);
end

---------------------------------------
-- Loreful Race/Class generation code
---------------------------------------
function GenerateRaceClassLoreful(e)
	if(IsCurrentZoneNewbie(current_zone)) then
		if(current_zone == "butcher") then
			race = 8;	-- Dwarves
			class = eq.ChooseRandom(2,3,1,9);
		elseif(current_zone == "nektulos") then
			race = 6;	-- Dark Elves
			class = eq.ChooseRandom(1, 2, 5, 9, 11, 12, 13, 14);
		elseif(current_zone == "gfaydark") then
			race = eq.ChooseRandom(4, 5, 7); -- Elves
			if(race == 4) then
				class = eq.ChooseRandom(1, 4, 6, 8, 9);
			elseif(race == 5) then
				class = eq.ChooseRandom(2, 3, 12, 13, 14);
			elseif(race == 7) then
				class = eq.ChooseRandom(1, 4, 6, 8, 9);	-- 3 is out: no Half-Elf paladins in Gfaydark
			end
		elseif(current_zone == "steamfont") then
			race = 12;	-- Gnomes
			class = eq.ChooseRandom(1, 2, 3, 5, 9, 11, 12, 13, 14);
		elseif(current_zone == "freporte") or (current_zone == "freportw") or (current_zone == "qeynos2") then
			race = eq.ChooseRandom(1, 1, 1, 7)	-- Mostly Humans and some Half-Elves
			if(race == 1) then
				class = eq.ChooseRandom(1, 2, 3, 5, 7, 8, 9, 11, 12, 13, 14);
			elseif(race == 7) then
				class = eq.ChooseRandom(1, 3, 8, 9);
			end
		elseif(current_zone == "qeytoqrg") then
			race = eq.ChooseRandom(1, 1, 7, 7)	-- Mostly Humans and some Half-Elves
			if(race == 1) then
				class = eq.ChooseRandom(1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14);
			elseif(race == 7) then
				class = eq.ChooseRandom(1, 3, 4, 6, 8, 9);
			end
		elseif(current_zone == "misty") then
			race = 11;	-- Halflings
			class = eq.ChooseRandom(1, 2, 3, 4, 6, 9);
		elseif(current_zone == "innothule") then
			race = 9;	-- Trolls
			class = eq.ChooseRandom(1, 5, 10);
		elseif(current_zone == "feerrott") then
			race = 10;	-- Ogres
			class = eq.ChooseRandom(1, 5, 10);
		elseif(current_zone == "tox") then
			race = 3;	-- Erudites
			class = eq.ChooseRandom(2, 3, 5, 11, 12, 13, 14);	-- Tox can hold both evil & good Erudites eey.
		elseif(current_zone == "paineel") then
			race = 3;	-- Erudites (evil)
			class = eq.ChooseRandom(2, 5, 11, 12, 13, 14);		-- Paineel is evil tho.
		elseif(current_zone == "everfrost") then
			race = 2;	-- Barbarians
			class = eq.ChooseRandom(1, 9, 10);
		-- TODO : IKSARS (FOB / Cabilis)
		elseif(current_zone == "cabeast") or (current_zone == "cabwest") or (current_zone == "fieldofbone") or (current_zone == "warslikswood") 
		or (current_zone == "swampofnohope") or (current_zone == "kurn") then
			race = 128;
			class = eq.ChooseRandom(1, 5, 10, 7);
		end
		e.self:SetClass(class);
		InitClass(e);
	else
		GenerateRaceClass(e);
	end
end

------------------------------------------------------------------
-- Correctly assign model size depending on the chosen Race
-- Sets size flags accordingly (needed for equipment generation)
------------------------------------------------------------------
function InitSize(e)
	if(race == 1) then 			-- Humans
		size = 6;
		race_small = false;
		race_medium = true;
		race_large = false;
	elseif(race == 2) then		-- Barbarians
		size = 7;
		race_small = false;
		race_medium = false;
		race_large = true;
	elseif(race == 3) then 		-- Erudites
		size = 6;
		race_small = false;
		race_medium = true;
		race_large = false;
	elseif(race == 4) then 		-- Wood Elves
		size = 5;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 5) then 		-- High Elves
		size = 6;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 6) then 		-- Dark Elves
		size = 5;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 7) then 		-- Half Elves
		size = 5.5;
		race_small = false;
		race_medium = true;
		race_large = false;
	elseif(race == 8) then 		-- Dwarves
		size = 4;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 9) then		-- Trolls
		size = 8;
		race_small = false;
		race_medium = false;
		race_large = true;
	elseif(race == 10) then		-- Ogres
		size = 9;
		race_small = false;
		race_medium = false;
		race_large = true;
	elseif(race == 11) then		-- Halflings
		size = 3.5;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 12) then		-- Gnomes
		size = 3;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 128) then	-- Iksars
		size = 6;
		race_small = false;
		race_medium = true;
		race_large = false;
	end
end

------------------------------------
-- Main Player Bot generation event
------------------------------------
function event_spawn(e)
	local luascale = require("lua_scale");
	local npcext = require("npc_ext");
	local levelcalc = require("playerbot_calclevel");
	local equip = require("playerbot_equipment");
	
	-- Level calculation based on the current zone the Player Bot has spawned in.
	dynamic_level = levelcalc.calc(current_zone, false);
	
	-- Is the Player Bot a roaming adventurer, or a static fellow ? Static Player Bots typically hangs in cities, or at the tunnel in EC.
	has_roambox = e.self:HasRoamBox();
	
	if(has_roambox) then
		e.self:SetRunning(true);
		is_static = false;
	else
		is_static = true;
		local sitting = eq.ChooseRandom(true,false);
		if(sitting == true) then
			e.self:SetAppearance(1); -- sitting, for idle player bots
		end
	end
	
	-- If the Player Bot is static, see if we have to configure static-like behavior.
	-- Recompute Player Bot's level if explicitely configured, depending on a variety
	-- of factors (special zone checks, high level chance spawn check, override level calc etc)
	if(is_static) then
		if(enable_static_behavior) then
			if(override_level_calc) then
				-- First 'hard' recomputation of player bot's level in order to have a true random playerbot irrelevant of current zone
				dynamic_level = math.random(1, max_level);	
				-- If checks for special zones have been enabled, we stay in the intended level range, with the added
				-- probability of a higher level Player Bot being thrown in the mix
				if(check_zone_level) then
					if(IsCurrentZoneDungeon(current_zone)) then
						dynamic_level = levelcalc.calc(current_zone, false);
						local highLevelChance = math.random(1, 100);
						if(highLevelChance <= high_level_chance) then
							dynamic_level = levelcalc.calc(current_zone, true);
						end
					end
				end
			end
		end
	end
	
	-- Scaling call (stats, level etc)
	luascale.scaleme(e.self, dynamic_level, 100);
	
	-- Generate the actual physical appearance of the Player Bot depending on the configured preference: 
	-- "Loreful" (newbie zones have mostly Player Bots from their respective home race) or "Regular" (anything goes).
	if(loreful_newbies) and is_static == false then		
		if(chance_non_loreful_newb > 0) then
			local chanceNonLorefulNewb = math.random(1, 100);
			if(chanceNonLorefulNewb <= chance_non_loreful_newb) then
				GenerateRaceClass(e);
			else
				GenerateRaceClassLoreful(e);
			end
		else
			GenerateRaceClassLoreful(e);
		end
	-- Special edge case to generate mostly Iksars in Cabilis & Kurn's Tower.
	elseif(loreful_newbies and current_zone == "cabeast" ) or (loreful_newbies and current_zone == "cabwest") or (loreful_newbies and current_zone == "kurn") then	
		if(chance_non_loreful_newb > 0) then
			local chanceNonLorefulNewb = math.random(1, 100);
			if(chanceNonLorefulNewb <= chance_non_loreful_newb) then
				GenerateRaceClass(e);
			else
				GenerateRaceClassLoreful(e);
			end
		else
			GenerateRaceClassLoreful(e);
		end	
	else
		GenerateRaceClass(e);
	end
	
	-- Set the NPCFactionID to the DB PlayerBot faction
	e.self:SetNPCFactionID(npc_faction_id);

	-- Assign the chosen Class to the script variable for reference
	class = e.self:GetClass();
	
	-- Determine Gender
	gender = eq.ChooseRandom(0,1);
	
	-- Choose a classic face
	face = eq.ChooseRandom(0,1,2,3,4,5,6,7);
	
	-- Default size is 6, but will be recomputed when Race has been rolled for
	size = 6;
	
	-- Assign level to the script variable for reference
	level = e.self:GetLevel();
	
	-- Generate a name
	-- Rework the method to include normal characters only ? Right now names like Ce'Vanar are totally possible, but won't crash the client
	e.self:TempName(GenerateName(race, gender));
	
	-- Correctly assign model size depending on the chosen Race
	-- Sets size flags accordingly (needed for equipment generation)
	InitSize(e);
	
	-- Sends an Illusion Packet to clients.
	-- This is important as it allows Player Bot features to persist for everybody even when clients zone in/out.
	e.self:SendPlayerBotIllusion(race, gender,face,size);
	
	-- Generate Player Bot equipment depending on Race / Class / Level
	equip.GenerateLoot(e, eq, class, race, race_small, race_medium, race_large, level);

	-- Lastly, enable timer-based stuff if configured
	if(enable_timer_events) then
		eq.set_timer("main_timer", CalculateTimer(main_timer_kickoff));
	end
end

-------------------------------------------------------------------
-- Calculates a timer millisecond value based on a "seconds" value
-------------------------------------------------------------------
function CalculateTimer(seconds)
	return seconds * 1000;
end

-----------------------------------
-- Dynamic roambox (if configured)
-----------------------------------
function PlayerBotRoam(e)
	eq.stop_timer("player_bot_roam");	
	local roamChance = eq.ChooseRandom(1, 100);
	if( roamChance <= use_roambox_chance ) then
		if(enable_static_behavior and not e.self:HasRoamBox()) then
			e.self:SetRunning(true);
			e.self:RandomRoam(roambox_max_x,roambox_max_y);
		end
	end
	eq.set_timer("player_bot_roam", eq.ChooseRandom(CalculateTimer(min_timer_roam), CalculateTimer(max_timer_roam)));
end

--------------------
-- Main timer event
--------------------
function event_timer(e)
	if(e.timer == "main_timer") then
		if(enable_static_movement) then
			PlayerBotRoam(e);
		end
		eq.stop_timer("main_timer");
	elseif(e.timer == "player_bot_roam") then
		PlayerBotRoam(e);
	end
end

-------------------
-- Main slay event
-------------------
function event_slay(e)
	if(use_flavor_dialogue) then
		e.self:DoAnim(36);
		local shout = eq.ChooseRandom(true,false);
		if(shout) then
			e.self:Shout(eq.ChooseRandom("Die you beast!", "I'm unstoppable!", "Another victory!", "I hope this was worth it..."));
		else
			e.self:Say(eq.ChooseRandom("Die you beast!", "I'm unstoppable!", "Another victory!", "I hope this was worth it..."));
		end
	end
end

-----------------------------
-- Main death_complete event
-----------------------------
function event_death_complete(e)
	if(use_flavor_dialogue) then
		local shout = eq.ChooseRandom(true,false);
		if(shout) then
			e.self:Shout(eq.ChooseRandom("Has anybody seen my corpse?", "Somebody heal me!", "Help!", "I hope I'm not bound too far away..."));
		else
			e.self:Say(eq.ChooseRandom("Has anybody seen my corpse?", "Somebody heal me!", "Help!", "I hope I'm not bound too far away..."));
		end
	end
end

-----------------------------------------------------------------------------------------
-- Generate a name based on race & gender.
-- Uses the opensource library "Namegen" (see the full code in /lua_modules/namegen.lua)
-----------------------------------------------------------------------------------------
function GenerateName(race, gender)
	local namegen = require("namegen")
	local name;
	
	if(race == 1 or race == 2 or race == 3) then
		if(gender ==0) then
			name = namegen.generate("human male");
		else
			name = namegen.generate("human female");
		end
	end
	if(race == 4 or race == 5) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("elf male", "elf male 2");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("elf female", "elf female 2");
			name = namegen.generate(pattern);
		end
	end
	if(race == 6) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("elf male", "elf male 2", "drow male");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("elf female", "elf female 2", "drow female");
			name = namegen.generate(pattern);
		end
	end
	if(race == 7) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("elf male", "elf male 2","human male");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("elf female", "elf female 2","human female");
			name = namegen.generate(pattern);
		end
	end
	if(race == 8) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("dwarf male", "dwarf male 2");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("dwarf female", "dwarf female 2");
			name = namegen.generate(pattern);
		end
	end
	if(race == 9 or race == 10) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("ogre male");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("ogre female");
			name = namegen.generate(pattern);
		end
	end
	if(race == 11) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("halfling male", "halfling male 2");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("halfling female", "halfling female 2");
			name = namegen.generate(pattern);
		end
	end
	if(race == 12) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("gnome male");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("gnome female");
			name = namegen.generate(pattern);
		end
	end
	
	if(race == 128) then
		if(gender == 0) then
			local pattern = eq.ChooseRandom("infernal 1", "infernal 2", "infernal 3", "dragon male");
			name = namegen.generate(pattern);
		else
			local pattern = eq.ChooseRandom("infernal 1", "infernal 2", "infernal 3", "dragon female");
			name = namegen.generate(pattern);
		end
	end
	return name
end

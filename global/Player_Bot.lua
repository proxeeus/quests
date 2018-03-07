-- General info
-- Melee classes: 1 (Warrior), 3 (Paladin), 4 (Ranger), 5 (Shadow Knight), 7 (Monk), 8 (Bard), 9 (Rogue)
-- Priest classes: 2 (Cleric), 6 (Druid), 10 (Shaman),
-- Caster classes: 11 (Necromancer, 12 (Wizard), 13 (Magician), 14 (Enchanter) 

-- Inventory slot IDs:
-- 1 LEar, 2 Head, 3 Face, 4 REar, 5 Neck, 6 Shoulder, 7 Arms, 8 Back, 9 LWrist, 10 RWrist, 11 Range, 12 Hands, 13 Primary Slot, 14 Secondary Slot,
-- 15 LFinger, 16 RFinger, 17 Chest, 18 Legs, 19 Feet, 20 Belt, 21 Ammo

-- Default values, will be overridden.
race = 1;
class = 1;
gender = 0;
face = 1;
size = 1;
level = 1;

-- Will need to compute that based on current zone.
dynamic_level = 50;
current_zone = eq.get_zone_short_name();

race_small = false;
race_medium = false;
race_large = false;

function CalcLevel(e,eq)
	-- levels 1 to 5
	if	(current_zone == "freporte") or 
		(current_zone == "freportw") or 
		(current_zone == "freportn"	) or
		(current_zone == "butcher") or -- Big zone, need to take multiple zone ranges into account
		(current_zone == "misty") or 
		(current_zone == "gfaydark") or 
		(current_zone == "innothule") or 
		(current_zone == "feerrott") or 
		(current_zone == "tox") or 
		(current_zone == "paineel") or 
		(current_zone == "qeynos") or 
		(current_zone == "qeynos2") or 
		(current_zone == "qcat") or 
		(current_zone == "steamfont") or
		(current_zone == "nektulos") or
		(current_zone == "everfrost") -- Big zone, need to take multiple zone ranges into account
	then
		dynamic_level = math.random(1,5);
	-- levels 5 to 15
	elseif	(current_zone == "ecommons") or 
			(current_zone == "commons") or 
			(current_zone == "nro") or 
			(current_zone == "sro") or
			(current_zone == "butcher") or 
			(current_zone == "qeytoqrg") or 
			(current_zone == "blackburrow") or
			(current_zone == "qey2hh1") or
			(current_zone == "erudsxing") or
			(current_zone == "lavastorm") 
	then
			dynamic_level = math.random(5,15);
	-- levels 10 to 20
	elseif	(current_zone == "crushbone")
	then
			dynamic_level = math.random(10,20);
	-- levels 15 to 21
	elseif	(current_zone == "oasis") or
			(current_zone == "highpass") or
			(current_zone == "beholder")
	then
			dynamic_level = math.random(15,21);
	-- karanas are 10 to 30ish
	elseif 	(current_zone == "northkarana") or
			(current_zone == "eastkarana") or
			(current_zone == "southkarana") or
			(current_zone == "oot") or
			(current_zone == "lakerathe") or
			(current_zone == "lfaydark") or
			(current_zone == "unrest")
	then
			dynamic_level = math.random(10,31);
	-- 25-35 range
	elseif (current_zone == "highkeep")
	then
			dynamic_level = math.random(25,35);
	elseif (current_zone == "kithicor")
	then
			dynamic_level = math.random(15,50);	
	-- 35+ zones (and dungeons)
	elseif (current_zone == "mistmoore") or
		   (current_zone == "soldunga")
	then
			dynamic_level = math.random(20,45);
	elseif (current_zone == "soldungb")
	then
			dynamic_level = math.random(35,50);
	else
		dynamic_level = math.random(10,50);	-- a default dynamic level for an uncovered zone
	end
	
	return dynamic_level;
end

function event_combat(e)

end	

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yo.");
	elseif(e.message:findi("leave")) then
		e.self:Depop(true);
	end
end

function event_spawn(e)
	--math.randomseed( os.time() )
	local luascale = require("lua_scale");
	local npcext = require("npc_ext");
	
	-- Rework the method to include normal characters only.
	e.self:TempName(GenerateName(race, gender));
	e.self:SetNPCFactionID(20158);
	e.self:SetAppearance(1); -- sitting, for idle player bots
	e.self:SetRunning(true);
	
	dynamic_level = CalcLevel(e,eq);

	luascale.scaleme(e.self, dynamic_level, 100);

	
	-- For loot generation: e.self:AddItem(id, charges, equipped true/false)
	-- As long as e.self:ClearItemList() is called on death, Player Bots won't be lootable.
	
	-- Determine possible PlayerBot race depending on class.
	-- Assigns SpellSets accordingly (needed in order to avoid level 60 Player Bots casting level 1 spells)
	-- Will need to add Iksars later
	if(e.self:GetClass() == 1) then	-- Warrior
		race = eq.ChooseRandom(1, 2, 4, 6, 7, 8, 9, 10, 11, 12);
	elseif(e.self:GetClass() == 2) then -- Cleric
		race = eq.ChooseRandom(1, 3, 5, 6, 8, 11, 12);
		e.self:SetSpellsID(1);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 3) then -- Paladin
		race = eq.ChooseRandom(1, 3, 5, 7, 8, 11, 12);
		e.self:SetSpellsID(8);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 4) then -- Ranger
		race = eq.ChooseRandom(1, 4, 7, 11);
		e.self:SetSpellsID(10);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 5) then -- Shadowknight
		race = eq.ChooseRandom(1, 3, 6, 9, 10, 12);
		e.self:SetSpellsID(221);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 6) then -- Druid
		race = eq.ChooseRandom(1, 4, 7, 11);
		e.self:SetSpellsID(7);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 7) then -- Monk
		race = 1;	-- Only Human Monks in vanilla, Iksars later
	elseif(e.self:GetClass() == 8) then -- Bard
		race = eq.ChooseRandom(1, 4, 7);
		e.self:SetSpellsID(211);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 9) then -- Rogue
		race = eq.ChooseRandom(1, 2, 4, 6, 7, 8, 11, 12);
	elseif(e.self:GetClass() == 10) then -- Shaman
		race = eq.ChooseRandom(2, 9, 10);
		e.self:SetSpellsID(218);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 11) then -- Necromancer
		race = eq.ChooseRandom(1, 3, 6, 12);
		e.self:SetSpellsID(215);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 12) then -- Wizard
		race = eq.ChooseRandom(1, 3, 5, 6, 12);
		e.self:SetSpellsID(214);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 13) then -- Magician
		race = eq.ChooseRandom(1, 3, 5, 6, 12);
		e.self:SetSpellsID(216);
		e.self:SetMana(e.self:GetMaxMana());
	elseif(e.self:GetClass() == 14) then -- Enchanter
		race = eq.ChooseRandom(1, 3, 5, 6, 12);
		e.self:SetSpellsID(217);
		e.self:SetMana(e.self:GetMaxMana());
	end

	class = e.self:GetClass();
	gender = eq.ChooseRandom(0,1);
	face = eq.ChooseRandom(0,1,2,3,4,5,6,7);
	size = 6;
	level = e.self:GetLevel();
	
	if(race == 1) then -- Humans
		size = 6;
		race_small = false;
		race_medium = true;
		race_large = false;
	elseif(race == 2) then	-- Barbarians
		size = 7;
		race_small = false;
		race_medium = false;
		race_large = true;
	elseif(race == 3) then -- Erudites
		size = 6;
		race_small = false;
		race_medium = true;
		race_large = false;
	elseif(race == 4) then -- Wood Elves
		size = 5;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 6) then -- Dark Elves
		size = 5;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 7) then -- Half Elves
		size = 5.5;
		race_small = false;
		race_medium = true;
		race_large = false;
	elseif(race == 8) then -- Dwarves
		size = 4;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 9) then	-- Trolls
		size = 8;
		race_small = false;
		race_medium = false;
		race_large = true;
	elseif(race == 10) then	-- Ogres
		size = 9;
		race_small = false;
		race_medium = false;
		race_large = true;
	elseif(race == 11) then	-- Halflings
		size = 3.5;
		race_small = true;
		race_medium = false;
		race_large = false;
	elseif(race == 12) then	-- Gnomes
		size = 3;
		race_small = true;
		race_medium = false;
		race_large = false;
	end
	
	e.self:SendPlayerBotIllusion(race, gender,face,size);
	
	GenerateLoot(e, eq);

	--e.self:RandomRoam(250,250);
	--e.self:Say("RandomRoam started.");
	--eq.set_timer("RandomRoam",120);
	
	
end

function event_slay(e)
	--e.self:MoveTo(e.other:GetX(),e.other:GetY(),e.other:GetZ(), e.other:GetHeading(), false);
	e.self:DoAnim(36);
	e.self:Shout(eq.ChooseRandom("Comment je te pwn!", "LMFAO", "DIE NEEB", "LOOOOL"));
end

-- TODO: this will need to be determined on a race/gender basis
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
	
	return name
end

-- General loot generation process depending on playerbot class
-- AddItem(Integer item_id, Integer charges, Boolean equip);
-- 1 LEar, 2 Head, 3 Face, 4 REar, 5 Neck, 6 Shoulder, 7 Arms, 8 Back, 9 LWrist, 10 RWrist, 11 Range, 12 Hands, 13 Primary Slot, 14 Secondary Slot,
-- 15 LFinger, 16 RFinger, 17 Chest, 18 Legs, 19 Feet, 20 Belt, 21 Ammo
function GenerateTierOneMeleeLoot(e,eq)
	local has_head = eq.ChooseRandom(false,true);
	local has_face = eq.ChooseRandom(false,true);
	local has_neck = eq.ChooseRandom(false,true);
	local has_shoulders = eq.ChooseRandom(false,true);
	local has_arms = eq.ChooseRandom(false,true);
	local has_back = eq.ChooseRandom(false,true);
	local has_lwrist = eq.ChooseRandom(false,true);
	local has_rwrist = eq.ChooseRandom(false,true);
	local has_hands = eq.ChooseRandom(false,true);
	local has_chest = eq.ChooseRandom(false,true);
	local has_legs = eq.ChooseRandom(false,true);
	local has_feet = eq.ChooseRandom(false,true);
	local has_belt = eq.ChooseRandom(false,true);
	
	if(has_head == true) then
		if(race_medium == true) then
			e.self:AddItem(1001, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1013, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1025, 1, true);
		end
	end
	if(has_face == true) then
		if(race_medium == true) then
			e.self:AddItem(1002, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1014, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1026, 1, true);
		end
	end
	if(has_neck == true) then
		if(race_medium == true) then
			e.self:AddItem(1003, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1015, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1027, 1, true);
		end
	end
	if(has_shoulders == true) then
		if(race_medium == true) then
			e.self:AddItem(1005, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1017, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1029, 1, true);
		end
	end
	if(has_arms == true) then
		if(race_medium == true) then
			e.self:AddItem(1008, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1020, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1032, 1, true);
		end
	end
	if(has_back == true) then
		if(race_medium == true) then
			e.self:AddItem(1006, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1018, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1030, 1, true);
		end
	end
	if(has_lwrist == true) then
		if(race_medium == true) then
			e.self:AddItem(1009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1021, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1033, 1, true);
		end
	end
	if(has_rwrist == true) then
		if(race_medium == true) then
			e.self:AddItem(1009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1021, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1033, 1, true);
		end
	end
	if(has_hands == true) then
		if(race_medium == true) then
			e.self:AddItem(1010, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1022, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1034, 1, true);
		end
	end
	if(has_chest == true) then
		if(race_medium == true) then
			e.self:AddItem(1004, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1016, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1028, 1, true);
		end
	end
	if(has_legs == true) then
		if(race_medium == true) then
			e.self:AddItem(1011, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1023, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1035, 1, true);
		end
	end
	if(has_feet == true) then
		if(race_medium == true) then
			e.self:AddItem(1012, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1024, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1036, 1, true);
		end
	end
	if(has_belt == true) then
		if(race_medium == true) then
			e.self:AddItem(1007, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1019, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1031, 1, true);
		end
	end
	
	-- Generate Primary / secondary
	-- Wars / Pals / SKs / Rangers 
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(5023, 5025, 6013), 1, true);
		end
	end

	if(class == 8 or class == 9) then
		e.self:AddItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
	end
end

function GenerateTierTwoMeleeLoot(e,eq)

-- Helm
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1001,2001), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1013,2013), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1025,2025), 1, true);
	end

-- Face
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1002,2002), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1014, 2014), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1026,2026), 1, true);
	end

-- Neck
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1003,2003), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1015,2015), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1027,2027), 1, true);
	end

-- Shoulders
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1005,2005), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1017,2017), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1029,2029), 1, true);
	end

-- Arms
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1008,2008), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1020,2020), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1032,2032), 1, true);
	end

-- Back
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1006,2006), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1018,2018), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1030,2030), 1, true);
	end

-- Left Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021,2021), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1033,2033), 1, true);
	end

-- Right Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021,2021), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1033,2033), 1, true);
	end

-- Hands
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1010,2010), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1022,2022), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1034,2034), 1, true);
	end

-- Chest
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1004,2004), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1016,2016), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1028,2028), 1, true);
	end

-- Legs
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1011,2011), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1023,2023), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1035,2035), 1, true);
	end

-- Feet
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1012,2012), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1024,2024), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1036,2036), 1, true);
	end

-- Belt

	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1007,2007), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1019,2019), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1031,2031), 1, true);
	end

	local dual_wield_level = 0;
	if(class == 1 or class == 9) then
		dual_wield_level = 13;
	elseif(class == 4 or class == 8) then
		dual_wield_level = 17;
	end
	
	local dual_wield = false;
	
	if(level >= dual_wield_level) then
		dual_wield = eq.ChooseRandom(true,false);
	end
	
	-- Generate Primary / secondary
	-- Wars / Pals / SKs / Rangers 
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017), 1, true);
				end
			elseif(dual_wield == true) then
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(5023, 5025, 6013), 1, true);
		end
	end

	if(class == 8 or class == 9) then
		e.self:AddItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
		if(level >= dual_wield_level) then
			e.self:AddItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
		end
	end
end

-- Levels 21 - 30
function GenerateTierThreeMeleeLoot(e,eq)

-- 3K range: Banded
-- 2K range: Leather

-- Helm
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3053,2001), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3065,2013), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3077,2025), 1, true);
	end

-- Face
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3054,2002), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3066, 2014), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3078,2026), 1, true);
	end

-- Neck
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3055,2003), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3067,2015), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3079,2027), 1, true);
	end

-- Shoulders
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3057,2005), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3069,2017), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3081,2029), 1, true);
	end

-- Arms
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3060,2008), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1020,2020), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1032,2032), 1, true);
	end

-- Back
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3058,2006), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3072,2018), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3082,2030), 1, true);
	end

-- Left Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3061,2009), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3073,2021), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3085,2033), 1, true);
	end

-- Right Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3061,2009), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3073,2021), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3085,2033), 1, true);
	end

-- Hands
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3062,2010), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3074,2022), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3089,2034), 1, true);
	end

-- Chest
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3056,2004), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3068,2016), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3080,2028), 1, true);
	end

-- Legs
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3063,2011), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1023,2023), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1035,2035), 1, true);
	end

-- Feet
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3064,2012), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3075,2024), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3087,2036), 1, true);
	end

-- Belt
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(3059,2007), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(3071,2019), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(3087,2031), 1, true);
	end
	
	local dual_wield = false;
	dual_wield = eq.ChooseRandom(true,false);

	
	-- Generate Primary / secondary
	-- Wars / Pals / SKs / Rangers 
	-- Mix of bronze & fine steel
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017), 1, true);
				end
			elseif(dual_wield == true) then
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(5030, 5031, 5037,5351,6352), 1, true);
		end
	end

	if(class == 8) then
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
	end

	if(class == 9) then
		e.self:AddItem(eq.ChooseRandom(7012,7013,7350,7352), 1, true);
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
	end
end

-- Levels 31 - 40
function GenerateTierFourMeleeLoot(e,eq)

	-- Plate Classes 1 3 5 8
	-- Banded / Fineplate / Bronze / Class
	if(class == 1) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013, 4181, 4213), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4182), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217,4183), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4184), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4186), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4187), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4188), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4173), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4174), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205,4175), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4176), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4178), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4179), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4180), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,4181), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229,4183), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,4184), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,4186), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,4187), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,4188), 1, true); 	-- Boots
		end
	end
	if(class == 3 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3150), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3151), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3152), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3154), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3155), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3156), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3150), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3151), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3152), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3154), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3155), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3156), 1, true); 	-- Boots
		end
	end
	if(class == 5 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3140), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3141), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3142), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3144), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3145), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3146), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3140), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3141), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3142), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3144), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3145), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3146), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,3140), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228,3141), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,3142), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,3144), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,3145), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,3146), 1, true); 	-- Boots
		end
	end
	if(class == 8 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,4153), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4154), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4155), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4157), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4158), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4159), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4153), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4154), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4155), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4157), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4158), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4159), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
	end
	-- Chain Classes 4 9
	-- ranger
	if(class == 4) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3181), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3182), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3183), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3187), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3184), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3185), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3186), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3188), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3190), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3191), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3192), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053, 3181), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3181), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3183), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3187), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3184), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3185), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3186), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3188), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3190), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3191), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3192), 1, true); 	-- Boots
		end
	end
	
	-- rogue
	if(class == 9) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3161), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3162), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3163), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3167), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3164), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3165), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3166), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3168), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3170), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3171), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3172), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053, 3161), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3162), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3163), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3167), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3164), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3165), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3166), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3168), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3168), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3170), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3171), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3172), 1, true); 	-- Boots
		end
		if(race_large == true)then
			e.self:AddItem(eq.ChooseRandom(3077, 3161), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,3162), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,3163), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,3167), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,3164), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,3165), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,3166), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,3168), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,3168), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3089,3170), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,3171), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,3172), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(7012,7013,7350,7352), 1, true);
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
	end

	-- Monk
	if(class == 7) then
		e.self:AddItem(eq.ChooseRandom(1160, 1180), 1, true);	-- Helm
		e.self:AddItem(eq.ChooseRandom(1161,1181), 1, true); 			-- Visor
		e.self:AddItem(eq.ChooseRandom(1162,1182), 1, true); 			-- Collar
		e.self:AddItem(eq.ChooseRandom(1166,1186), 1, true); 			-- Belt
		e.self:AddItem(eq.ChooseRandom(1163,1183), 1, true); 	-- Breastplate
		e.self:AddItem(eq.ChooseRandom(1164,1184), 1, true); 	-- Pauldron
		e.self:AddItem(eq.ChooseRandom(1165,1185), 1, true); 				-- Cloak
		e.self:AddItem(eq.ChooseRandom(1167,1187), 1, true); 	-- Vambrace
		e.self:AddItem(eq.ChooseRandom(1168,1188), 1, true); 	-- Bracer
		e.self:AddItem(eq.ChooseRandom(1168,1188), 1, true); 	-- Bracer
		e.self:AddItem(eq.ChooseRandom(1169,1189), 1, true); 	-- Gauntlets
		e.self:AddItem(eq.ChooseRandom(1170,1190), 1, true); 	-- Greaves
		e.self:AddItem(eq.ChooseRandom(1171,1191), 1, true); 	-- Boots
	end
	
	local dual_wield = false;
	dual_wield = eq.ChooseRandom(true,false);

	
	-- Generate Primary / secondary
	-- Wars / Pals / SKs / Rangers 
	-- Mix of bronze & fine steel
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017), 1, true);
				end
			elseif(dual_wield == true) then
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(5030, 5031, 5037,5351,6352), 1, true);
		end
	end
end

function GenerateTierFiveMeleeLoot(e,eq)
	-- Plate Classes 1 3 5 8
	-- Banded / Fineplate / Bronze / Class
	if(class == 1) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013, 4181, 4213), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4182), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217,4183), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4184), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4186), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4187), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4188), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4173), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4174), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205,4175), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4176), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4178), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4179), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4180), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,4181), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229,4183), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,4184), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,4186), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,4187), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,4188), 1, true); 	-- Boots
		end
	end
	if(class == 3 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3150), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3151), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3152), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3154), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3155), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3156), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3150), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3151), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3152), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3154), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3155), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3156), 1, true); 	-- Boots
		end
	end
	if(class == 5 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3140), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3141), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3142), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3144), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3145), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3146), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3140), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3141), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3142), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3144), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3145), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3146), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,3140), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228,3141), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,3142), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,3144), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,3145), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,3146), 1, true); 	-- Boots
		end
	end
	if(class == 8 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,4153), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4154), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4155), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4157), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4158), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4159), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4153), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4154), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4155), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4157), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4158), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4159), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
	end
	-- Chain Classes 4 9
	-- ranger
	if(class == 4) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3181), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3182), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3183), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3187), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3184), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3185), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3186), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3188), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3190), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3191), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3192), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053, 3181), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3181), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3183), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3187), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3184), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3185), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3186), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3188), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3189), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3190), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3191), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3192), 1, true); 	-- Boots
		end
	end
	
	-- rogue
	if(class == 9) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3161), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3162), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3163), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3167), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3164), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3165), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3166), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3168), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3170), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3171), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3172), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053, 3161), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3162), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3163), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3167), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3164), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3165), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3166), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3168), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3168), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3170), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3171), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3172), 1, true); 	-- Boots
		end
		if(race_large == true)then
			e.self:AddItem(eq.ChooseRandom(3077, 3161), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,3162), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,3163), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,3167), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,3164), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,3165), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,3166), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,3168), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,3168), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,3169), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3089,3170), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,3171), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,3172), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(7012,7013,7350,7352), 1, true);
		e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
	end

	-- Monk
	if(class == 7) then
		e.self:AddItem(eq.ChooseRandom(1160, 1180), 1, true);	-- Helm
		e.self:AddItem(eq.ChooseRandom(1161,1181), 1, true); 			-- Visor
		e.self:AddItem(eq.ChooseRandom(1162,1182), 1, true); 			-- Collar
		e.self:AddItem(eq.ChooseRandom(1166,1186), 1, true); 			-- Belt
		e.self:AddItem(eq.ChooseRandom(1163,1183), 1, true); 	-- Breastplate
		e.self:AddItem(eq.ChooseRandom(1164,1184), 1, true); 	-- Pauldron
		e.self:AddItem(eq.ChooseRandom(1165,1185), 1, true); 				-- Cloak
		e.self:AddItem(eq.ChooseRandom(1167,1187), 1, true); 	-- Vambrace
		e.self:AddItem(eq.ChooseRandom(1168,1188), 1, true); 	-- Bracer
		e.self:AddItem(eq.ChooseRandom(1168,1188), 1, true); 	-- Bracer
		e.self:AddItem(eq.ChooseRandom(1169,1189), 1, true); 	-- Gauntlets
		e.self:AddItem(eq.ChooseRandom(1170,1190), 1, true); 	-- Greaves
		e.self:AddItem(eq.ChooseRandom(1171,1191), 1, true); 	-- Boots
	end
	
	local dual_wield = false;
	dual_wield = eq.ChooseRandom(true,false);

	
	-- Generate Primary / secondary
	-- Wars / Pals / SKs / Rangers 
	-- Mix of bronze & fine steel
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017), 1, true);
				end
			elseif(dual_wield == true) then
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(5026,5027,5015,5028,5029,5032,5033,5034,5035,6019,6022,6023,6024,7012, 7013,7014,7015, 5350, 5352,5353,6350,6351,7350,7351,7352), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(5030, 5031, 5037,5351,6352), 1, true);
		end
	end
end

function GenerateLoot(e, eq)
	if(class == 1 or class == 3 or class == 4 or class == 5 or class == 7 or class == 8 or class == 9) then
		GenerateMeleeLoot(e, eq);
	elseif (class == 2 or class == 6 or class == 10) then
		GeneratePriestLoot(e, eq);
	elseif (class == 11 or class == 12 or class == 13 or class == 14) then
		GenerateCasterLoot(e, eq);
	end
end

function GenerateMeleeLoot(e,eq)
	
	if(level >= 1 and level <= 10) then
		GenerateTierOneMeleeLoot(e,eq);
	elseif(level >= 11 and level <= 20) then
		GenerateTierTwoMeleeLoot(e,eq);
	elseif(level >= 21 and level <= 30) then
		GenerateTierThreeMeleeLoot(e,eq);
	elseif(level >= 31 and level <= 40) then
		GenerateTierFourMeleeLoot(e,eq);
	elseif(level >= 41 and level <= 50) then
		GenerateTierFiveMeleeLoot(e,eq);
	end
end


function GeneratePriestLoot(e,eq)

	if(level >= 1 and level <= 10) then
		GenerateTierOnePriestLoot(e,eq);
	elseif(level >= 11 and level <= 20) then
		GenerateTierTwoPriestLoot(e,eq);
	elseif(level >= 21 and level <= 30) then
		GenerateTierThreePriestLoot(e,eq);
	elseif(level >= 31 and level <= 40) then
		GenerateTierFourPriestLoot(e,eq);
	elseif(level >= 41 and level <= 50) then
		GenerateTierFivePriestLoot(e,eq);
	end
end


function GenerateTierOnePriestLoot(e,eq)
	local has_head = eq.ChooseRandom(false,true);
	local has_face = eq.ChooseRandom(false,true);
	local has_neck = eq.ChooseRandom(false,true);
	local has_shoulders = eq.ChooseRandom(false,true);
	local has_arms = eq.ChooseRandom(false,true);
	local has_back = eq.ChooseRandom(false,true);
	local has_lwrist = eq.ChooseRandom(false,true);
	local has_rwrist = eq.ChooseRandom(false,true);
	local has_hands = eq.ChooseRandom(false,true);
	local has_chest = eq.ChooseRandom(false,true);
	local has_legs = eq.ChooseRandom(false,true);
	local has_feet = eq.ChooseRandom(false,true);
	local has_belt = eq.ChooseRandom(false,true);
	
	if(has_head == true) then
		if(race_medium == true) then
			e.self:AddItem(1001, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1013, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1025, 1, true);
		end
	end
	if(has_face == true) then
		if(race_medium == true) then
			e.self:AddItem(1002, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1014, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1026, 1, true);
		end
	end
	if(has_neck == true) then
		if(race_medium == true) then
			e.self:AddItem(1003, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1015, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1027, 1, true);
		end
	end
	if(has_shoulders == true) then
		if(race_medium == true) then
			e.self:AddItem(1005, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1017, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1029, 1, true);
		end
	end
	if(has_arms == true) then
		if(race_medium == true) then
			e.self:AddItem(1008, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1020, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1032, 1, true);
		end
	end
	if(has_back == true) then
		if(race_medium == true) then
			e.self:AddItem(1006, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1018, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1030, 1, true);
		end
	end
	if(has_lwrist == true) then
		if(race_medium == true) then
			e.self:AddItem(1009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1021, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1033, 1, true);
		end
	end
	if(has_rwrist == true) then
		if(race_medium == true) then
			e.self:AddItem(1009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1021, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1033, 1, true);
		end
	end
	if(has_hands == true) then
		if(race_medium == true) then
			e.self:AddItem(1010, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1022, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1034, 1, true);
		end
	end
	if(has_chest == true) then
		if(race_medium == true) then
			e.self:AddItem(1004, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1016, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1028, 1, true);
		end
	end
	if(has_legs == true) then
		if(race_medium == true) then
			e.self:AddItem(1011, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1023, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1035, 1, true);
		end
	end
	if(has_feet == true) then
		if(race_medium == true) then
			e.self:AddItem(1012, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1024, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1036, 1, true);
		end
	end
	if(has_belt == true) then
		if(race_medium == true) then
			e.self:AddItem(1007, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1019, 1, true);
		elseif(race_large == true) then
			e.self:AddItem(1031, 1, true);
		end
	end
	
	-- Weapons
	if(class == 2) then
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016), 1, true);
	elseif(class == 6) then
	-- 6 Druid
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021), 1, true);
	elseif(class == 10) then
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,7009), 1, true);
	end
	-- 10 Shaman
	e.self:AddItem(9002, 1, true);
end

function GenerateTierTwoPriestLoot(e,eq)
-- Helm
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1001,2001), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1013,2013), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1025,2025), 1, true);
	end

-- Face
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1002,2002), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1014, 2014), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1026,2026), 1, true);
	end

-- Neck
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1003,2003), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1015,2015), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1027,2027), 1, true);
	end

-- Shoulders
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1005,2005), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1017,2017), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1029,2029), 1, true);
	end

-- Arms
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1008,2008), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1020,2020), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1032,2032), 1, true);
	end

-- Back
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1006,2006), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1018,2018), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1030,2030), 1, true);
	end

-- Left Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021,2021), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1033,2033), 1, true);
	end

-- Right Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021,2021), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1033,2033), 1, true);
	end

-- Hands
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1010,2010), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1022,2022), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1034,2034), 1, true);
	end

-- Chest
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1004,2004), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1016,2016), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1028,2028), 1, true);
	end

-- Legs
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1011,2011), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1023,2023), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1035,2035), 1, true);
	end

-- Feet
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1012,2012), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1024,2024), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1036,2036), 1, true);
	end

-- Belt

	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1007,2007), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1019,2019), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1031,2031), 1, true);
	end
	
		-- Weapons
	if(class == 2) then
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,6024), 1, true);
	elseif(class == 6) then
	-- 6 Druid
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034), 1, true);
	elseif(class == 10) then
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,7009,7014), 1, true);
	end
	-- 10 Shaman
	e.self:AddItem(9002, 1, true);
end

function GenerateTierThreePriestLoot(e,eq)

	if(class == 6) then
			-- Helm
		if(race_medium == true) then
			e.self:AddItem(2001, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2013, 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(2002, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2014, 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(2003, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2015, 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(2005, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2017, 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(2008, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2020, 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(2006, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2018, 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(2009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2021, 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(2009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2021, 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(2010, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2022, 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(2004, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2016, 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(2011, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2023, 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(2012, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2024, 1, true);
		end

	-- Belt

		if(race_medium == true) then
			e.self:AddItem(2007, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2019, 1, true);
		end
		
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034), 1, true);
	elseif (class == 10) then
		-- 3K range: Banded
		-- 2K range: Leather
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3072,2018), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3075,2024), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3087,2036), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3087,2031), 1, true);
		end
	
		e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350,7014,7351), 1, true);

	elseif(class == 2) then
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4201), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4213), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002,4202), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014,4214), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003,4203), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015,4215), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005,4205), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017,4217), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4208), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4220), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3072,2018), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4210), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4222), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4204), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4216), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4211), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4223), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4212), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3075,2024,4224), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007,4207), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019,4219), 1, true);
		end
	
		e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350), 1, true);
	end
	
	e.self:AddItem(9002, 1, true);
end

function GenerateTierFourPriestLoot(e,eq)

		if(class == 6) then
			-- Helm
		if(race_medium == true) then
			e.self:AddItem(2001, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2013, 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(2002, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2014, 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(2003, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2015, 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(2005, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2017, 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(2008, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2020, 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(2006, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2018, 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(2009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2021, 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(2009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2021, 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(2010, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2022, 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(2004, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2016, 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(2011, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2023, 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(2012, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2024, 1, true);
		end

	-- Belt

		if(race_medium == true) then
			e.self:AddItem(2007, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2019, 1, true);
		end
		
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034), 1, true);
	elseif (class == 10) then
		-- 3K range: Banded
		-- 2K range: Leather
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4947), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4947), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025,4947), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4943), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4943), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032,4943), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006,4948), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3072,2018,4948), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030,4948), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4942), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4942), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034,4942), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4946), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4946), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028,4946), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4944), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4944), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035,4944), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4941), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3075,2024,4941), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3087,2036,4941), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3087,2031), 1, true);
		end
	
		e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350,7014,7351), 1, true);

	elseif(class == 2) then
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4201,21001), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4213,21013), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002,4202,21002), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014,4214,21014), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003,4203,21003), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015,4215,21015), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005,4205,21005), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017,4217,21017), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4208,21008,4923), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4220,21020,4923), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3072,2018), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4210,21010,4922), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4222,21022,4922), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4204,21004,4926), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4216,21004,4926), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4211,21011,4924), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4223,21023,4924), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4212,21012,4921), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3075,2024,4224,21024,4921), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007,4207,21007), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019,4219,21019), 1, true);
		end
	
		e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350), 1, true);
	end
	
	e.self:AddItem(9002, 1, true);

end

function GenerateTierFivePriestLoot(e,eq)
		if(class == 6) then
			-- Helm
		if(race_medium == true) then
			e.self:AddItem(2001, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2013, 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(2002, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2014, 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(2003, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2015, 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(2005, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2017, 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(2008, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2020, 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(2006, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2018, 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(2009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2021, 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(2009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2021, 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(2010, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2022, 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(2004, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2016, 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(2011, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2023, 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(2012, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2024, 1, true);
		end

	-- Belt

		if(race_medium == true) then
			e.self:AddItem(2007, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(2019, 1, true);
		end
		
		e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034), 1, true);
	elseif (class == 10) then
		-- 3K range: Banded
		-- 2K range: Leather
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4947), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4947), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025,4947), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4943), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4943), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032,4943), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006,4948), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3072,2018,4948), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030,4948), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4942), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4942), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034,4942), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4946), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4946), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028,4946), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4944), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4944), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035,4944), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4941), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3075,2024,4941), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3087,2036,4941), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3087,2031), 1, true);
		end
	
		e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350,7014,7351), 1, true);

	elseif(class == 2) then
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4201,21001), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4213,21013), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002,4202,21002), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014,4214,21014), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003,4203,21003), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015,4215,21015), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005,4205,21005), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017,4217,21017), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4208,21008,4923), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4220,21020,4923), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3072,2018), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4210,21010,4922), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4222,21022,4922), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4204,21004,4926), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4216,21004,4926), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4211,21011,4924), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4223,21023,4924), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4212,21012,4921), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3075,2024,4224,21024,4921), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007,4207,21007), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019,4219,21019), 1, true);
		end
	
		e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350), 1, true);
	end
	
	e.self:AddItem(9002, 1, true);
end

function GenerateCasterLoot(e,eq)

		if(level >= 1 and level <= 10) then
		GenerateTierOneCasterLoot(e,eq);
	elseif(level >= 11 and level <= 20) then
		GenerateTierTwoCasterLoot(e,eq);
	elseif(level >= 21 and level <= 30) then
		GenerateTierThreeCasterLoot(e,eq);
	elseif(level >= 31 and level <= 40) then
		GenerateTierFourCasterLoot(e,eq);
	elseif(level >= 41 and level <= 50) then
		GenerateTierFiveCasterLoot(e,eq);
	end
end

function GenerateTierOneCasterLoot(e,eq)
	local has_head = eq.ChooseRandom(false,true);
	local has_face = eq.ChooseRandom(false,true);
	local has_neck = eq.ChooseRandom(false,true);
	local has_shoulders = eq.ChooseRandom(false,true);
	local has_arms = eq.ChooseRandom(false,true);
	local has_back = eq.ChooseRandom(false,true);
	local has_lwrist = eq.ChooseRandom(false,true);
	local has_rwrist = eq.ChooseRandom(false,true);
	local has_hands = eq.ChooseRandom(false,true);
	local has_chest = eq.ChooseRandom(false,true);
	local has_legs = eq.ChooseRandom(false,true);
	local has_feet = eq.ChooseRandom(false,true);
	local has_belt = eq.ChooseRandom(false,true);
	
	if(has_head == true) then
		if(race_medium == true) then
			e.self:AddItem(1001, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1013, 1, true);
		end
	end
	if(has_face == true) then
		if(race_medium == true) then
			e.self:AddItem(1002, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1014, 1, true);
		end
	end
	if(has_neck == true) then
		if(race_medium == true) then
			e.self:AddItem(1003, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1015, 1, true);
		end
	end
	if(has_shoulders == true) then
		if(race_medium == true) then
			e.self:AddItem(1005, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1017, 1, true);
		end
	end
	if(has_arms == true) then
		if(race_medium == true) then
			e.self:AddItem(1008, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1020, 1, true);
		end
	end
	if(has_back == true) then
		if(race_medium == true) then
			e.self:AddItem(1006, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1018, 1, true);
		end
	end
	if(has_lwrist == true) then
		if(race_medium == true) then
			e.self:AddItem(1009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1021, 1, true);
		end
	end
	if(has_rwrist == true) then
		if(race_medium == true) then
			e.self:AddItem(1009, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1021, 1, true);
		end
	end
	if(has_hands == true) then
		if(race_medium == true) then
			e.self:AddItem(1010, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1022, 1, true);
		end
	end

	if(class == 11) then
		e.self:AddItem(119468, 1, true);
	elseif(class == 12) then
		e.self:AddItem(119467, 1, true);
	elseif(class == 13) then
		e.self:AddItem(119469, 1, true);
	elseif(class == 13) then
		e.self:AddItem(119466, 1, true);
	end

	if(has_legs == true) then
		if(race_medium == true) then
			e.self:AddItem(1011, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1023, 1, true);
		end
	end
	if(has_feet == true) then
		if(race_medium == true) then
			e.self:AddItem(1012, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1024, 1, true);
		end
	end
	if(has_belt == true) then
		if(race_medium == true) then
			e.self:AddItem(1007, 1, true);
		elseif(race_small == true) then
			e.self:AddItem(1019, 1, true);
		end
	end
	
	e.self:AddItem(eq.ChooseRandom(7007, 6018), 1, true);
end

function GenericCasterLoot(e,eq)
	if(race_medium == true) then
		e.self:AddItem(1001, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1013, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1002, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1014, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1003, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1015, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1005, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1017, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1008, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1020, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1006, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1018, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1009, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1021, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1009, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1021, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1010, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1022, 1, true);
	end


	if(class == 11) then
		e.self:AddItem(119468, 1, true);
	elseif(class == 12) then
		e.self:AddItem(119467, 1, true);
	elseif(class == 13) then
		e.self:AddItem(119469, 1, true);
	elseif(class == 13) then
		e.self:AddItem(119466, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1011, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1023, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1012, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1024, 1, true);
	end


	if(race_medium == true) then
		e.self:AddItem(1007, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1019, 1, true);
	end
end

function GenerateTierTwoCasterLoot(e,eq)
	GenericCasterLoot(e,eq);
	e.self:AddItem(eq.ChooseRandom(7012, 6018), 1, true);
end
function GenerateTierThreeCasterLoot(e,eq)
	GenericCasterLoot(e,eq);
	e.self:AddItem(eq.ChooseRandom(7350, 6018), 1, true);
end
function GenerateTierFourCasterLoot(e,eq)
	GenericCasterLoot(e,eq);
	e.self:AddItem(eq.ChooseRandom(7350, 6018), 1, true);
end
function GenerateTierFiveCasterLoot(e,eq)
	GenericCasterLoot(e,eq);
	e.self:AddItem(eq.ChooseRandom(7350, 6018), 1, true);
end

function event_death(e)
	e.self:ClearItemList();
end

--function event_timer(e)
--	if(e.timer == "RandomRoam") then
--		e.self:RandomRoam(250,250);
--		--e.self:Say("RandomRoam started.");
--	end
--end

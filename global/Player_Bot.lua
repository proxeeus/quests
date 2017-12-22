-- General info
-- Melee classes: 1 (Warrior), 3 (Paladin), 4 (Ranger), 5 (Shadow Knight), 7 (Monk), 8 (Bard), 9 (Rogue)
-- Priest classes: 2 (Cleric), 6 (Druid), 10 (Shaman),
-- Caster classes: 11 (Necromancer, 12 (Wizard), 13 (Magician), 14 (Enchanter) 

-- Inventory slot IDs:
-- 

-- Default values, will be overridden.
race = 1;
class = 1;
gender = 0;
face = 1;
size = 1;
level = 1;

race_small = false;
race_medium = false;
race_large = false;

function event_combat(e)

end	

function event_spawn(e)
	local luascale = require("lua_scale");
	local npcext = require("npc_ext");
	e.self:Say("Spawned. Initializing....");

	e.self:Say("Player Bot init sequence...");
		
	-- Uncomment to scale the NPC to a desired level.
	-- This will probably need to be dynamic depending on the PlayerBot current zone at some point.
	luascale.scaleme(e.self, 5, 100);

	
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
	
	e.self:Say("Initing with race "..race..", gender "..gender..", face "..face.." and size "..size..".");
	e.self:Say("I am level "..level..".");
	e.self:SendPlayerBotIllusion(race, gender,face,size);
	
	GenerateLoot(e, eq);
	
	e.self:Say("Init sequence completed.");
	--e.self:RandomRoam(250,250);
	--e.self:Say("RandomRoam started.");
	--eq.set_timer("RandomRoam",120);
	
	-- Rework the method to include normal characters only.
	--e.self:TempName(RandomString(8));
	
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
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(has_shield == true) then
				if(race_small == true) then
					--e.self:AddItem(eq.ChooseRandom(9014, 9010), 1, true);
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
end

function GenerateTierTwoMeleeLoot(e,eq)
end

function GenerateTierThreeMeleeLoot(e,eq)
end

function GenerateTierFourMeleeLoot(e,eq)
end

function GenerateTierFiveMeleeLoot(e,eq)
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
	e.self:Say("Generate melee loot.");
	
	if(level >= 1 and level <= 10) then
		GenerateTierOneMeleeLoot(e,eq);
	elseif(level >= 11 and level <= 20) then
		GenerateTierTwoMeleeLoot(e);
	elseif(level >= 21 and level <= 30) then
		GenerateTierThreeMeleeLoot(e,eq);
	elseif(level >= 31 and level <= 40) then
		GenerateTierFourMeleeLoot(e,eq);
	elseif(level > 41 and level <= 50) then
		GenerateTierFiveMeleeLoot(e,eq);
	end
end


function GeneratePriestLoot(e,eq)
	e.self:Say("Generate priest loot.");
end

function GenerateCasterLoot(e,eq)
	e.self:Say("Generate caster loot.");
end

function RandomString(length)
	length = length or 1
	if length < 1 then return nil end
		local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	
	return table.concat(array)
end

function event_death(e)
	e.self:ClearItemList();
end

function event_timer(e)
	if(e.timer == "RandomRoam") then
		e.self:RandomRoam(250,250);
		--e.self:Say("RandomRoam started.");
	end
end
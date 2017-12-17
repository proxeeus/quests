function event_combat(e)
	
end

function event_spawn(e)
	local luascale = require("lua_scale");
	local npcext = require("npc_ext");
	e.self:Say("Spawned. Initializing....");

	e.self:Say("Player Bot init sequence...");
		
	-- Uncomment to scale the NPC to a desired level.
	-- This will probably need to be dynamic depending on the PlayerBot current zone at some point.
	luascale.scaleme(e.self, 50, 100);
	-- Default value, will be overridden.
	local race = 1;
	
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
		e.self:AddItem(5504, 1, true);
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
	

	local gender = eq.ChooseRandom(0,1);
	local face = eq.ChooseRandom(0,1,2,3,4,5,6,7);
	local size = 6;
	
	if(race == 2) then	-- Barbarians
		size = 7;
	elseif(race == 4) then -- Wood Elves
		size = 5;
	elseif(race == 6) then -- Dark Elves
		size = 5;
	elseif(race == 7) then -- Half Elves
		size = 5.5;
	elseif(race == 8) then -- Dwarves
		size = 4;
	elseif(race == 9) then	-- Trolls
		size = 8;
	elseif(race == 10) then	-- Ogres
		size = 9;
	elseif(race == 11) then	-- Halflings
		size = 3.5;
	elseif(race == 12) then	-- Gnomes
		size = 3;
	end
	
	e.self:Say("Initing with race "..race..", gender "..gender..", face "..face.." and size "..size..".");
	e.self:SendPlayerBotIllusion(race, gender,face,size);
	
	e.self:Say("Init sequence completed.");
	--e.self:RandomRoam(250,250);
	--e.self:Say("RandomRoam started.");
	--eq.set_timer("RandomRoam",120);
	
end

function event_death(e)
	e.self:ClearItemList();
	--e.self:Depop();
end

function event_timer(e)
	if(e.timer == "RandomRoam") then
		e.self:RandomRoam(250,250);
		--e.self:Say("RandomRoam started.");
	end
end
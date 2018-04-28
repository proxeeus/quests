------------------
-- PlayerBot.lua
------------------

-- Master script for generating a complete PlayerBot in-game. Accounts for everything from race / class to gender, name, loot.

-- TODO/Known issues
---------------------
-- Finish implementing generic Loot Generation methods globally (priests & casters remaining)
-- Maybe implement a specific subset of Loot Generation methods dedicated to Tanks, which would incorporate generic Melee methods
-- Rewrite Monk equipment generation, right now it taps into the generic tanky loots and isn't correct.
-- is there a pathto coords method?
-- ADD banded leggings (+ other items??) to Priest Loot Generation

-- General info
-- Online Lua debugger @ http://codepad.org
-- IDs:
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


function event_combat(e)

end	

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. I'm currently looking for a party of adventurers to explore this place, care to [^invite] me, or would you like me to [leave] ?");
	elseif(e.message:findi("leave")) then
		e.self:Say("Fine, whatever.");
		e.self:Depop(true);
	end
end

function event_spawn(e)
	--math.randomseed( os.time() )
	local luascale = require("lua_scale");
	local npcext = require("npc_ext");
	local levelcalc = require("playerbot_calclevel");
	class = math.random(1,14);
	
	e.self:SetClass(class);
	-- Rework the method to include normal characters only.
	e.self:TempName(GenerateName(race, gender));
	e.self:SetNPCFactionID(20158);
	e.self:SetAppearance(1); -- sitting, for idle player bots
	e.self:SetRunning(true);
	
	
	
	dynamic_level = levelcalc.calc(current_zone);

	luascale.scaleme(e.self, dynamic_level, 100);

	
	-- For loot generation: e.self:AddItem(id, charges, equipped true/false)
	-- As long as e.self:ClearItemList() is called on death, Player Bots won't be lootable.
	
	-- Determine possible PlayerBot race depending on class.
	-- Assigns SpellSets accordingly (needed in order to avoid level 60 Player Bots casting level 1 spells)
	-- Will need to add Iksars later
	-- Note: this should be refactored and the class/race checks should actually be reversed, in order to
	-- determine available classes based on races. Reversing this could in turn allow us to populate some
	-- zones with a heavy emphasis on certain races versus others (ie: lots of newbie Dwarves in BBM, Erudites in Toxx/Paineel etc)
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
	elseif(race == 5) then -- High Elves
		size = 6;
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

	-- TODO: timers for randomly shouting shit?
	
	
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

-- Weapons
-- These rogue methods are specific for piercing weapons (dungeon loot/quested)
function GenerateLowerTierRoguePrimary(e,eq)
	return eq.ChooseRandom(2635,7308,7300,7315,13942,12373,7314,7312,1574,7018,7306,7404,13353,7322,13110,13371,7027,5216,7403);
end

function GenerateHighTierRoguePrimary(e,eq)
	return eq.ChooseRandom(7041,7323,7502,7501,7318,7317,1676);
end

-- 2Handed weapons
function GenerateLowTierTwoHandedWeapons(e,eq)
	return eq.ChooseRandom(6912,5312, 3616,13314,6322,6302,6300,5304,5361,5308,5356);
end

function GenerateLowTierPriestTwoHandedWeapon(e,eq)
	return eq.ChooseRandom(6310,6914);
end

function GenerateHighTierPriestTwoHandedWeapon(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierCasterTwoHandedWeapon(e,eq)
	return eq.ChooseRandom(6310,6914);
end

function GenerateHighTierCasterTwoHandedWeapon(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierTwoHandedWeapons(e,eq)
	return eq.ChooseRandom(5401,5407,5424,5359);
end

-- 1Handed weapons
function GenerateLowTierMeleeWeapon(e,eq)
	return eq.ChooseRandom(6952,7404,6354,6918,3617,5363,21579,5364,5050,5051,21569,2639,21568,5017,2640,5310,5402,13371,7027,6315,12375,6319,13390,6305,5058,5416,5355,21577,21572,2404,5360,5357);
end

function GenerateHighTierMeleeWeapon(e,eq)
	return eq.ChooseRandom(11610,6950,5214,6963,5425,5500,6401,6355,5315,5408,5425,5500,5503);
end

function GenerateLowTierPriestWeapon(e,eq)
	return eq.ChooseRandom(1756,6354);
end

function GenerateHighTierPriestWeapon(e,eq)
	return eq.ChooseRandom();
end

-- Pal/SK 1handeds
function GenerateLowTierKnightOneHandedWeapons(e,eq)
	return eq.ChooseRandom(1842);
end

-- Caster Weapons
function GenerateLowTierCasterWeapon(e,eq)
	return eq.ChooseRandom(13237,6336,10404,7323,7405);
end


function GenerateHighTierCasterWeapon(e,eq)
	return eq.ChooseRandom(6335,13400,6404);
end

-- Shields/Off-hands
function GenerateLowTierPriestOffHand(e,eq)
	return eq.ChooseRandom(9311,9025,13743,10333,1754,9307,10328,10332,13300,1843,13168,9306,10330,9308,9352,9350,10332);
end

function GenerateHighTierPriestOffHand(e,eq)
	return eq.ChooseRandom(10334);
end

function GenerateLowTierCasterOffHand(e,eq)
	return eq.ChooseRandom(13168,2569,13300,1843);
end

function GenerateHighTierCasterOffHand(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierMeleeShield(e,eq)
	return eq.ChooseRandom(9309,9306,9308,9350);
end

function GenerateHighTierMeleeShield(e,eq)
	return eq.ChooseRandom();
end

-- Jewelry
function GenerateLowTierMeleeRing(e,eq)
	return eq.ChooseRandom(1903,10318,10365,10357,13301,10350,13734,10337);
end

function GenerateHighTierMeleeRing(e,eq)
	return eq.ChooseRandom(10151);
end

function GenerateLowTierMeleeEarRing(e,eq)
	return eq.ChooseRandom(10313,10354,10339);
end

function GenerateHighTierMeleeEarRing(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierMeleeNeck(e,eq)
	return eq.ChooseRandom(10214,13737,10356,10102,10055,2304,3601);
end

function GenerateHighTierMeleeNeck(e,eq)
	return eq.ChooseRandom(10147);
end

function GenerateLowTierCasterRing(e,eq)
	return eq.ChooseRandom(10215,10365,12268,13301,10318,10312,10337);
end

function GenerateHighTierCasterRing(e,eq)
	return eq.ChooseRandom(10151,10150);
end

function GenerateLowTierCasterEarRing(e,eq)
	return eq.ChooseRandom(10362,10107,10350,10321,10339);
end

function GenerateHighTierCasterEarRing(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierCasterNeck(e,eq)
	return eq.ChooseRandom(10356,10102,10055,10311,10353,1333,3615);
end

function GenerateHighTierCasterNeck(e,eq)
	return eq.ChooseRandom(10146,10147,10216,4501);
end

function GenerateLowTierPriestRing(e,eq)
	return eq.ChooseRandom(10318,10312,10337,10215,10365,13301,10350);
end

function GenerateHighTierPriestRing(e,eq)
	return eq.ChooseRandom(10151,10150);
end

function GenerateLowTierPriestEarRing(e,eq)
	return eq.ChooseRandom(10321,10339,10362,10107);
end

function GenerateHighTierPriestEarRing(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierPriestNeck(e,eq)
	return eq.ChooseRandom(10214,3615,13737,10356,10102,10055,10353);
end

function GenerateHighTierPriestNeck(e,eq)
	return eq.ChooseRandom(10146,10147,10216,4501);
end

----------------
-- End Jewelry
----------------

----------------
-- Armor
----------------
-- Melee
-- Low Tier
function GenerateLowTierMeleeChest(e,eq)
	return eq.ChooseRandom(3602,2341,2325);
end

function GenerateLowTierMeleeLegs(e,eq)
	return eq.ChooseRandom(3303,3609,2343);
end

function GenerateLowTierMeleeWrist(e,eq)
	return eq.ChooseRandom(3607);
end

function GenerateLowTierMeleeHands(e,eq)
	return eq.ChooseRandom(3608,1841,1318);
end

function GenerateLowTierMeleeWaist(e,eq)
	return eq.ChooseRandom(3611,2338);
end

function GenerateLowTierMeleeBack(e,eq)
	return eq.ChooseRandom(3045);
end

function GenerateLowTierMeleeHead(e,eq)
	return eq.ChooseRandom(3600,1519);
end

function GenerateLowTierMeleeShoulders(e,eq)
	return eq.ChooseRandom(3603);
end

function GenerateLowTierMeleeFace(e,eq)
	return eq.ChooseRandom(3618,3041);
end

function GenerateLowTierMeleeArms(e,eq)
	return eq.ChooseRandom(3302,3606,2342,10336);
end

function GenerateLowTierMeleeFeet(e,eq)
	return eq.ChooseRandom(3610,2337);
end
-------------
-- High Tier
-------------
function GenerateHighTierMeleeChest(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierMeleeLegs(e,eq)
	return eq.ChooseRandom(2571);
end

function GenerateHighTierMeleeWrist(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierMeleeHands(e,eq)
	return eq.ChooseRandom(6956);
end

function GenerateHighTierMeleeWaist(e,eq)
	return eq.ChooseRandom(6953,1365);
end

function GenerateHighTierMeleeBack(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierMeleeHead(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierMeleeShoulders(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierMeleeFace(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierMeleeArms(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierMeleeFeet(e,eq)
	return eq.ChooseRandom();
end
-- END MELEE ARMOR
----------------

----------------
-- Armor
----------------
-- Tank
-- Low Tier
function GenerateLowTierTankChest(e,eq)
	return eq.ChooseRandom(4305,GenerateLowTierMeleeChest(e,eq));
end

function GenerateLowTierTankLegs(e,eq)
	return eq.ChooseRandom(GenerateLowTierMeleeLegs(e,eq));
end

function GenerateLowTierTankWrist(e,eq)
	return eq.ChooseRandom(2301,1515,GenerateLowTierMeleeWrist(e,eq));
end

function GenerateLowTierTankHands(e,eq)
	return eq.ChooseRandom(1516,4306,GenerateLowTierMeleeHands(e,eq));
end

function GenerateLowTierTankWaist(e,eq)
	return eq.ChooseRandom(1513,GenerateLowTierMeleeWaist(e,eq));
end

function GenerateLowTierTankBack(e,eq)
	return eq.ChooseRandom(GenerateLowTierMeleeBack(e,eq));
end

function GenerateLowTierTankHead(e,eq)
	return eq.ChooseRandom(1508,GenerateLowTierMeleeHead(e,eq));
end

function GenerateLowTierTankShoulders(e,eq)
	return eq.ChooseRandom(GenerateLowTierMeleeShoulders(e,eq));
end

function GenerateLowTierTankFace(e,eq)
	return eq.ChooseRandom(1509,GenerateLowTierMeleeFace(e,eq));
end

function GenerateLowTierTankArms(e,eq)
	return eq.ChooseRandom(1514,4113,GenerateLowTierMeleeArms(e,eq));
end

function GenerateLowTierTankFeet(e,eq)
	return eq.ChooseRandom(4307,GenerateLowTierMeleeFeet(e,eq));
end
-------------
-- High Tier
-------------
function GenerateHighTierTankChest(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeChest(e,eq));
end

function GenerateHighTierTankLegs(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeLegs(e,eq));
end

function GenerateHighTierTankWrist(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeWrist(e,eq));
end

function GenerateHighTierTankHands(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeHands(e,eq));
end

function GenerateHighTierTankWaist(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeWaist(e,eq));
end

function GenerateHighTierTankBack(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeBack(e,eq));
end

function GenerateHighTierTankHead(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeHead(e,eq));
end

function GenerateHighTierTankShoulders(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeShoulders(e,eq));
end

function GenerateHighTierTankFace(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeFace(e,eq));
end

function GenerateHighTierTankArms(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeArms(e,eq));
end

function GenerateHighTierTankFeet(e,eq)
	return eq.ChooseRandom(GenerateHighTierMeleeFeet(e,eq));
end
-- END TANK ARMOR
----------------


----------------
-- Armor
----------------
-- Priest
-- Low Tier
function GenerateLowTierPriestChest(e,eq)
	return eq.ChooseRandom(2341,2325);
end

function GenerateLowTierPriestLegs(e,eq)
	return eq.ChooseRandom(2343);
end

function GenerateLowTierPriestWrist(e,eq)
	return eq.ChooseRandom(10314,2301);
end

function GenerateLowTierPriestHands(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierPriestWaist(e,eq)
	return eq.ChooseRandom(2338);
end

function GenerateLowTierPriestBack(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierPriestHead(e,eq)
	return eq.ChooseRandom(6955);
end

function GenerateLowTierPriestShoulders(e,eq)
	return eq.ChooseRandom(1767);
end

function GenerateLowTierPriestFace(e,eq)
	return eq.ChooseRandom();
end

function GenerateLowTierPriestArms(e,eq)
	return eq.ChooseRandom(2342,10336);
end

function GenerateLowTierPriestFeet(e,eq)
	return eq.ChooseRandom(2337);
end
-------------
-- High Tier
-------------
function GenerateHighTierPriestChest(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierPriestLegs(e,eq)
	return eq.ChooseRandom(2571);
end

function GenerateHighTierPriestWrist(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierPriestHands(e,eq)
	return eq.ChooseRandom(6956);
end

function GenerateHighTierPriestWaist(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierPriestBack(e,eq)
	return eq.ChooseRandom(2340);
end

function GenerateHighTierPriestHead(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierPriestShoulders(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierPriestFace(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierPriestArms(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierPriestFeet(e,eq)
	return eq.ChooseRandom();
end
-- END PRIEST ARMOR
----------------

----------------
-- Armor
----------------
-- Caster
-- Low Tier
function GenerateLowTierCasterChest(e,eq)
	return eq.ChooseRandom(1334,1322);
end

function GenerateLowTierCasterLegs(e,eq)
	return eq.ChooseRandom(1341,2343);
end

function GenerateLowTierCasterWrist(e,eq)
	return eq.ChooseRandom(1339);
end

function GenerateLowTierCasterHands(e,eq)
	return eq.ChooseRandom(1340,2336);
end

function GenerateLowTierCasterWaist(e,eq)
	return eq.ChooseRandom(1337,2338);
end

function GenerateLowTierCasterBack(e,eq)
	return eq.ChooseRandom(1336,1526);
end

function GenerateLowTierCasterHead(e,eq)
	return eq.ChooseRandom(6955,1331);
end

function GenerateLowTierCasterShoulders(e,eq)
	return eq.ChooseRandom(1335);
end

function GenerateLowTierCasterFace(e,eq)
	return eq.ChooseRandom(1332,1411);
end

function GenerateLowTierCasterArms(e,eq)
	return eq.ChooseRandom(1338,2342);
end

function GenerateLowTierCasterFeet(e,eq)
	return eq.ChooseRandom(2337);
end
-------------
-- High Tier
-------------
function GenerateHighTierCasterChest(e,eq)
	return eq.ChooseRandom(2572,1357,1354);
end

function GenerateHighTierCasterLegs(e,eq)
	return eq.ChooseRandom(2571);
end

function GenerateHighTierCasterWrist(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierCasterHands(e,eq)
	return eq.ChooseRandom(6956);
end

function GenerateHighTierCasterWaist(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierCasterBack(e,eq)
	return eq.ChooseRandom(2340);
end

function GenerateHighTierCasterHead(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierCasterShoulders(e,eq)
	return eq.ChooseRandom(2570);
end

function GenerateHighTierCasterFace(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierCasterArms(e,eq)
	return eq.ChooseRandom();
end

function GenerateHighTierCasterFeet(e,eq)
	return eq.ChooseRandom();
end
-- END CASTER ARMOR
----------------


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
			e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
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
		e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010), 1, true);
	end
end

-- TODO: SEPARATE LOOT GENERATION FOR MONKS -- GENERIC LOOT METHODS MAY BREAK THEM
function GenerateTierTwoMeleeLoot(e,eq)

	if(class == 1 or class == 3 or class == 5 or class == 8) then	-- War Pal SK Brd
	-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1001,2001, GenerateLowTierTankHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1013,2013, GenerateLowTierTankHead(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1025,2025, GenerateLowTierTankHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1002,2002, GenerateLowTierTankFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1014, 2014, GenerateLowTierTankFace(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1026,2026, GenerateLowTierTankFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1003,2003, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1015,2015, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1027,2027, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1005,2005, GenerateLowTierTankShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1017,2017, GenerateLowTierTankShoulders(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1029,2029, GenerateLowTierTankShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1008,2008, GenerateLowTierTankArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020, GenerateLowTierTankArms(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032, GenerateLowTierTankArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1006,2006, GenerateLowTierTankBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1018,2018, GenerateLowTierTankBack(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1030,2030, GenerateLowTierTankBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1009,2009, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1021,2021, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1033,2033, GenerateLowTierTankWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1009,2009, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1021,2021, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1033,2033, GenerateLowTierTankWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1010,2010, GenerateLowTierTankHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1022,2022, GenerateLowTierTankHands(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1034,2034, GenerateLowTierTankHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1004,2004, GenerateLowTierTankChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1016,2016, GenerateLowTierTankChest(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1028,2028, GenerateLowTierTankChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1011,2011, GenerateLowTierTankLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023, GenerateLowTierTankLegs(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035, GenerateLowTierTankLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1012,2012, GenerateLowTierTankFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1024,2024, GenerateLowTierTankFeet(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1036,2036, GenerateLowTierTankFeet(e,eq)), 1, true);
		end

	-- Belt

		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1007,2007, GenerateLowTierTankWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1019,2019, GenerateLowTierTankWaist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1031,2031, GenerateLowTierTankWaist(e,eq)), 1, true);
		end
	end	
	
	if(class == 4 or class == 9) then	-- Ranger / Rogue
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1001,2001, GenerateLowTierMeleeHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1013,2013, GenerateLowTierMeleeHead(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1025,2025, GenerateLowTierMeleeHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1002,2002, GenerateLowTierMeleeFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1014, 2014, GenerateLowTierMeleeFace(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1026,2026, GenerateLowTierMeleeFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1003,2003, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1015,2015, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1027,2027, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1005,2005, GenerateLowTierMeleeShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1017,2017, GenerateLowTierMeleeShoulders(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1029,2029, GenerateLowTierMeleeShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1008,2008, GenerateLowTierMeleeArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020, GenerateLowTierMeleeArms(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032, GenerateLowTierMeleeArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1006,2006, GenerateLowTierMeleeBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1018,2018, GenerateLowTierMeleeBack(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1030,2030, GenerateLowTierMeleeBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1009,2009, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1021,2021, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1033,2033, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1009,2009, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1021,2021, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1033,2033, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1010,2010, GenerateLowTierMeleeHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1022,2022, GenerateLowTierMeleeHands(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1034,2034, GenerateLowTierMeleeHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1004,2004, GenerateLowTierMeleeChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1016,2016, GenerateLowTierMeleeChest(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1028,2028, GenerateLowTierMeleeChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1011,2011, GenerateLowTierMeleeLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023, GenerateLowTierMeleeLegs(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035, GenerateLowTierMeleeLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1012,2012, GenerateLowTierMeleeFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1024,2024, GenerateLowTierMeleeFeet(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1036,2036, GenerateLowTierMeleeFeet(e,eq)), 1, true);
		end
		
	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(1007,2007, GenerateLowTierMeleeWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1019,2019, GenerateLowTierMeleeWaist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1031,2031, GenerateLowTierMeleeWaist(e,eq)), 1, true);
		end
	end
	if(class == 7) then -- Monk: TODO: REWORK ITEMIZATION
	-- Helm
		e.self:AddItem(eq.ChooseRandom(1001,2001), 1, true);
	-- Face
		e.self:AddItem(eq.ChooseRandom(1002,2002, GenerateLowTierMeleeFace(e,eq)), 1, true);
	-- Neck
		e.self:AddItem(eq.ChooseRandom(1003,2003, GenerateLowTierMeleeNeck(e,eq)), 1, true);
	-- Shoulders
		e.self:AddItem(eq.ChooseRandom(1005,2005), 1, true);
	-- Arms
		e.self:AddItem(eq.ChooseRandom(1008,2008), 1, true);
	-- Back
		e.self:AddItem(eq.ChooseRandom(1006,2006, GenerateLowTierMeleeBack(e,eq)), 1, true);
	-- Left Wrist
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	-- Right Wrist
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	-- Hands
		e.self:AddItem(eq.ChooseRandom(1010,2010), 1, true);
	-- Chest
		e.self:AddItem(eq.ChooseRandom(1004,2004), 1, true);
	-- Legs
		e.self:AddItem(eq.ChooseRandom(1011,2011), 1, true);
	-- Feet
		e.self:AddItem(eq.ChooseRandom(1012,2012), 1, true);
	-- Belt
		e.self:AddItem(eq.ChooseRandom(1007,2007, GenerateLowTierMeleeWaist(e,eq)), 1, true);
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
			e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010,GenerateLowTierMeleeWeapon(e,eq)), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(class == 3 or class == 5 or has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010, GenerateLowTierMeleeShield(e,eq)), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002, GenerateLowTierMeleeShield(e,eq)), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017, GenerateLowTierMeleeShield(e,eq)), 1, true);
				end
			else
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6015,6016,7007, 7008,7009,7010), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(5023, 5025, 6013, GenerateLowTierTwoHandedWeapons(e,eq)), 1, true);
		end
	end

	if(class == 8) then
		e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010,GenerateLowTierMeleeWeapon(e,eq)), 1, true);
		if(level >= dual_wield_level) then
			e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010,GenerateLowTierMeleeWeapon(e,eq)), 1, true);
		end
	end
	
	if(class==9) then
		e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6014,6015,6016,7007, 7008,7009,7010,GenerateLowerTierRoguePrimary(e,eq)),1,true);
		if(level >= dual_wield_level) then
			e.self:AddItem(eq.ChooseRandom(5013,5014,5016,5019,5020,5021,5022,5040,6011,6015,6016,7007, 7008,7009,7010), 1, true);
		end
	end
	
	-- Jewelry
	e.self:AddItem(GenerateLowTierMeleeRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierMeleeRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierMeleeEarRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierMeleeEarRing(e,eq), 1, true);
end

-- Levels 21 - 30
-- TODO: SEPARATE MONK ITEMIZATION: THEY CAN HAVE BANDED RIGHT NOW
function GenerateTierThreeMeleeLoot(e,eq)

-- 3K range: Banded
-- 2K range: Leather
	if(class == 1 or class == 3 or class == 5 or class == 8) then -- War Pal SK Brd
	-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001, GenerateLowTierTankHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013, GenerateLowTierTankHead(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025, GenerateLowTierTankHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002, GenerateLowTierTankFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014, GenerateLowTierTankFace(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026, GenerateLowTierTankFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005, GenerateLowTierTankShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017, GenerateLowTierTankShoulders(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029, GenerateLowTierTankShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008, GenerateLowTierTankArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020, GenerateLowTierTankArms(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032, GenerateLowTierTankArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006, GenerateLowTierTankBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030, GenerateLowTierTankBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033, GenerateLowTierTankWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021, GenerateLowTierTankWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033, GenerateLowTierTankWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010, GenerateLowTierTankHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022, GenerateLowTierTankHands(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034, GenerateLowTierTankHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004, GenerateLowTierTankChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016, GenerateLowTierTankChest(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028, GenerateLowTierTankChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011, GenerateLowTierTankLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023, GenerateLowTierTankLegs(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035, GenerateLowTierTankLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012, GenerateLowTierTankFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024, GenerateLowTierTankFeet(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3088,2036, GenerateLowTierTankFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007, GenerateLowTierTankWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019, GenerateLowTierTankWaist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3083,2031, GenerateLowTierTankWaist(e,eq)), 1, true);
		end
	end
	
	if(class == 4 or class == 9) then -- Ranger / Rogue
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001, GenerateLowTierMeleeHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013, GenerateLowTierMeleeHead(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025, GenerateLowTierMeleeHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002, GenerateLowTierMeleeFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014, GenerateLowTierMeleeFace(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026, GenerateLowTierMeleeFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027, GenerateLowTierMeleeNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005, GenerateLowTierMeleeShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017, GenerateLowTierMeleeShoulders(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029, GenerateLowTierMeleeShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008, GenerateLowTierMeleeArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020, GenerateLowTierMeleeArms(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032, GenerateLowTierMeleeArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006, GenerateLowTierMeleeBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierMeleeBack(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030, GenerateLowTierMeleeBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033, GenerateLowTierMeleeWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010, GenerateLowTierMeleeHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022, GenerateLowTierMeleeHands(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034, GenerateLowTierMeleeHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004, GenerateLowTierMeleeChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016, GenerateLowTierMeleeChest(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028, GenerateLowTierMeleeChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011, GenerateLowTierMeleeLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023, GenerateLowTierMeleeLegs(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035, GenerateLowTierMeleeLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012, GenerateLowTierMeleeFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024, GenerateLowTierMeleeFeet(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3088,2036, GenerateLowTierMeleeFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007, GenerateLowTierMeleeWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019, GenerateLowTierMeleeWaist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3083,2031, GenerateLowTierMeleeWaist(e,eq)), 1, true);
		end
	end
	
	if(class == 7) then -- Monk: TODO: REWORK ITEMIZATION
	-- Helm
		e.self:AddItem(eq.ChooseRandom(1001,2001), 1, true);
	-- Face
		e.self:AddItem(eq.ChooseRandom(1002,2002, GenerateLowTierMeleeFace(e,eq)), 1, true);
	-- Neck
		e.self:AddItem(eq.ChooseRandom(1003,2003, GenerateLowTierMeleeNeck(e,eq)), 1, true);
	-- Shoulders
		e.self:AddItem(eq.ChooseRandom(1005,2005), 1, true);
	-- Arms
		e.self:AddItem(eq.ChooseRandom(1008,2008), 1, true);
	-- Back
		e.self:AddItem(eq.ChooseRandom(1006,2006, GenerateLowTierMeleeBack(e,eq)), 1, true);
	-- Left Wrist
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	-- Right Wrist
		e.self:AddItem(eq.ChooseRandom(1009,2009), 1, true);
	-- Hands
		e.self:AddItem(eq.ChooseRandom(1010,2010), 1, true);
	-- Chest
		e.self:AddItem(eq.ChooseRandom(1004,2004), 1, true);
	-- Legs
		e.self:AddItem(eq.ChooseRandom(1011,2011), 1, true);
	-- Feet
		e.self:AddItem(eq.ChooseRandom(1012,2012), 1, true);
	-- Belt
		e.self:AddItem(eq.ChooseRandom(1007,2007, GenerateLowTierMeleeWaist(e,eq)), 1, true);
	end
	local dual_wield = false;
	dual_wield = eq.ChooseRandom(true,false);

	
	-- Generate Primary / secondary
	-- Wars / Pals / SKs / Rangers 
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(class == 3 or class == 5 or has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010, GenerateLowTierMeleeShield(e,eq)), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002, GenerateLowTierMeleeShield(e,eq)), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017, GenerateLowTierMeleeShield(e,eq)), 1, true);
				end
			else
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierTwoHandedWeapons(e,eq)), 1, true);
		end
	end

	if(class == 8) then
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
	end

	if(class == 9) then
		e.self:AddItem(eq.ChooseRandom(GenerateLowerTierRoguePrimary(e,eq)), 1, true);
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
	end
	
	-- Jewelry
	e.self:AddItem(GenerateLowTierMeleeRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierMeleeRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierMeleeEarRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierMeleeEarRing(e,eq), 1, true);
end

-- Levels 31 - 40
function GenerateTierFourMeleeLoot(e,eq)

	-- Plate Classes 1 3 5 8
	-- Banded / Fineplate / Bronze / Class
	if(class == 1) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013, 4181, 4213, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4182, GenerateLowTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217,4183, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4184, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4186, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4187, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4188, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4173, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4174, GenerateLowTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205,4175, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4176, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4178, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4179, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4180, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,4181, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228, GenerateLowTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229,4183, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,4184, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,4186, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,4187, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,4188, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	if(class == 3) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3150, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3151, GenerateLowTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3152, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3154, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3155, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3156, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3150, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3151, GenerateLowTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3152, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3154, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3155, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3156, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	if(class == 5) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3140, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3141, GenerateLowTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3142, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3144, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3145, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3146, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3140, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3141, GenerateLowTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3142, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3144, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3145, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3146, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,3140, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228,3141, GenerateLowTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,3142, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,3144, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,3145, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,3146, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	if(class == 8 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,4153, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4154, GenerateLowTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4155, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4157, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4158, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4159, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4153, GenerateLowTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4154, GenerateLowTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205, GenerateLowTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4155, GenerateLowTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156, GenerateLowTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4157, GenerateLowTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4158, GenerateLowTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4159, GenerateLowTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
	end
	-- Chain Classes 4 9
	-- ranger
	if(class == 4) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3181, GenerateLowTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3182, GenerateLowTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3183, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3187, GenerateLowTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3184, GenerateLowTierMeleeChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3185, GenerateLowTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3186, GenerateLowTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3188, GenerateLowTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3189, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3189, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3190, GenerateLowTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3191, GenerateLowTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3192, GenerateLowTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053, 3181, GenerateLowTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3181, GenerateLowTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3183, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3187, GenerateLowTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3184, GenerateLowTierMeleeChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3185, GenerateLowTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3186, GenerateLowTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3188, GenerateLowTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3189, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3189, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3190, GenerateLowTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3191, GenerateLowTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3192, GenerateLowTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	
	-- rogue
	if(class == 9) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3161, GenerateLowTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3162, GenerateLowTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3163, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3167, GenerateLowTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3164, GenerateLowTierMeleeChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3165, GenerateLowTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3166, GenerateLowTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3168, GenerateLowTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3169, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3169, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3170, GenerateLowTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3171, GenerateLowTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3172, GenerateLowTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,3161, GenerateLowTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3162, GenerateLowTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3163, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3167, GenerateLowTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3164, GenerateLowTierMeleeChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3165, GenerateLowTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3166, GenerateLowTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3168, GenerateLowTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3169, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3169, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3170, GenerateLowTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3171, GenerateLowTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3172, GenerateLowTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_large == true)then
			e.self:AddItem(eq.ChooseRandom(3077,3161, GenerateLowTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,3162, GenerateLowTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,3163, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,3167, GenerateLowTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,3164, GenerateLowTierMeleeChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,3165, GenerateLowTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,3166, GenerateLowTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,3168, GenerateLowTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,3169, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,3169, GenerateLowTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3089,3170, GenerateLowTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,3171, GenerateLowTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,3172, GenerateLowTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(GenerateLowerTierRoguePrimary(e,eq)), 1, true);
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
	end

	-- Monk
	-- TODO: REFINE
	if(class == 7) then
		e.self:AddItem(eq.ChooseRandom(1160, 1180), 1, true);	-- Helm
		e.self:AddItem(eq.ChooseRandom(1161,1181, GenerateLowTierMeleeFace(e,eq)), 1, true); 			-- Visor
		e.self:AddItem(eq.ChooseRandom(1162,1182, GenerateLowTierMeleeNeck(e,eq)), 1, true); 			-- Collar
		e.self:AddItem(eq.ChooseRandom(1166,1186, GenerateLowTierMeleeWaist(e,eq)), 1, true); 			-- Belt
		e.self:AddItem(eq.ChooseRandom(1163,1183), 1, true); 	-- Breastplate
		e.self:AddItem(eq.ChooseRandom(1164,1184), 1, true); 	-- Pauldron
		e.self:AddItem(eq.ChooseRandom(1165,1185, GenerateLowTierMeleeBack(e,eq)), 1, true); 				-- Cloak
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
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(class == 3 or class == 5 or has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010, GenerateLowTierMeleeShield(e,eq)), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002, GenerateLowTierMeleeShield(e,eq)), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017, GenerateLowTierMeleeShield(e,eq)), 1, true);
				end
			else
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq)), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierTwoHandedWeapons(e,eq)), 1, true);
		end
	end
	
	-- Jewelry
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeEarRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeEarRing(e,eq)), 1, true);
end

function GenerateTierFiveMeleeLoot(e,eq)
	-- Plate Classes 1 3 5 8
	-- Banded / Fineplate / Bronze / Class
	if(class == 1) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013, 4181, 4213, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4182, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217,4183, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4184, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4185, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4186, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4187, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4188, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4173, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4174, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205,4175, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq), GenerateHighTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4176, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4177, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4178, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4179, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4180, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,4181, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229,4183, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,4184, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,4185, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,4186, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,4187, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,4188, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	if(class == 3 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3150, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3151, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217, GenerateHighTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3152, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3153, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3154, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3155, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3156, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3150, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3151, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3152, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3153, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3154, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3155, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3156, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	if(class == 5 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,3140, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,3141, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,3142, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,3143, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,3144, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,3145, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,3146, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 3140, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,3141, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,3142, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,3143, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,3144, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,3145, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,3146, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,21025,4225,3140, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,21026,4226, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,21027,4227, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,21031,4219, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,21004,4228,3141, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,21029,4229, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,2030, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,21032,4232,3142, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,21033,4233,3143, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3086,21034,4234,3144, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,21035,4235,3145, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,21036,4236,3146, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	if(class == 8 ) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,21013,4213,4153, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,21014,4214, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,21015,4215, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,21019,4219, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,4216,4154, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,21005,4217, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,21020,4220,4155, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,21021,4221,4156, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,21022,4222,4157, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,21023,4223,4158, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,21024,4224,4159, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053,21001, 4201, 4153, GenerateLowTierTankHead(e,eq), GenerateHighTierTankHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,21002,4202, GenerateLowTierTankFace(e,eq), GenerateHighTierTankFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,21003,4203, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,21007,4207, GenerateLowTierTankWaist(e,eq), GenerateHighTierTankWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,21004,4204,4154, GenerateLowTierTankChest(e,eq), GenerateHighTierTankChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,21005,4205, GenerateLowTierTankShoulders(e,eq), GenerateHighTierTankShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,4206, GenerateLowTierTankBack(e,eq), GenerateHighTierTankBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,21008,4208,4155, GenerateLowTierTankArms(e,eq), GenerateHighTierTankArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,21009,4209,4156, GenerateLowTierTankWrist(e,eq), GenerateHighTierTankWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,21010,4210,4157, GenerateLowTierTankHands(e,eq), GenerateHighTierTankHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,21011,4211,4158, GenerateLowTierTankLegs(e,eq), GenerateHighTierTankLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,21012,4212,4159, GenerateLowTierTankFeet(e,eq), GenerateHighTierTankFeet(e,eq)), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq),GenerateHighTierMeleeWeapon(e,eq)), 1, true);
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq),GenerateHighTierMeleeWeapon(e,eq)), 1, true);
	end
	-- Chain Classes 4 9
	-- ranger
	if(class == 4) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3181, GenerateLowTierMeleeHead(e,eq), GenerateHighTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3182, GenerateLowTierMeleeFace(e,eq), GenerateHighTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3183, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3187, GenerateLowTierMeleeWaist(e,eq), GenerateHighTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3184, GenerateLowTierMeleeChest(e,eq), GenerateHighTierMeleeChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3185, GenerateLowTierMeleeShoulders(e,eq), GenerateHighTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3186, GenerateLowTierMeleeBack(e,eq), GenerateHighTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3188, GenerateLowTierMeleeArms(e,eq), GenerateHighTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3189, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3189, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3190, GenerateLowTierMeleeHands(e,eq), GenerateHighTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3191, GenerateLowTierMeleeLegs(e,eq), GenerateHighTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3192, GenerateLowTierMeleeFeet(e,eq), GenerateHighTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053, 3181, GenerateLowTierMeleeHead(e,eq), GenerateHighTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3181, GenerateLowTierMeleeFace(e,eq), GenerateHighTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3183, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3187, GenerateLowTierMeleeWaist(e,eq), GenerateHighTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3184, GenerateLowTierMeleeChest(e,eq), GenerateHighTierMeleeChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3185, GenerateLowTierMeleeShoulders(e,eq), GenerateHighTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3186, GenerateLowTierMeleeBack(e,eq), GenerateHighTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3188, GenerateLowTierMeleeArms(e,eq), GenerateHighTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3189, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3189, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3190, GenerateLowTierMeleeHands(e,eq), GenerateHighTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3191, GenerateLowTierMeleeLegs(e,eq), GenerateHighTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3192, GenerateLowTierMeleeFeet(e,eq), GenerateHighTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
	end
	
	-- rogue
	if(class == 9) then
		if(race_small == true)then
			e.self:AddItem(eq.ChooseRandom(3065,3161, GenerateLowTierMeleeHead(e,eq), GenerateHighTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3066,3162, GenerateLowTierMeleeFace(e,eq), GenerateHighTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3067,3163, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3071,3167, GenerateLowTierMeleeWaist(e,eq), GenerateHighTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3068,3164, GenerateLowTierMeleeChest(e,eq), GenerateHighTierMeleeChest(e,eq)), 1, true); 			-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3069,3165, GenerateLowTierMeleeShoulders(e,eq), GenerateHighTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3070,3166, GenerateLowTierMeleeBack(e,eq), GenerateHighTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3072,3168, GenerateLowTierMeleeArms(e,eq), GenerateHighTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3073,3169, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3073,3169, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3074,3170, GenerateLowTierMeleeHands(e,eq), GenerateHighTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3075,3171, GenerateLowTierMeleeLegs(e,eq), GenerateHighTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3076,3172, GenerateLowTierMeleeFeet(e,eq), GenerateHighTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_medium == true)then
			e.self:AddItem(eq.ChooseRandom(3053, 3161, GenerateLowTierMeleeHead(e,eq), GenerateHighTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3054,3162, GenerateLowTierMeleeFace(e,eq), GenerateHighTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3055,3163, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3059,3167, GenerateLowTierMeleeWaist(e,eq), GenerateHighTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3056,3164, GenerateLowTierMeleeChest(e,eq), GenerateHighTierMeleeChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3057,3165, GenerateLowTierMeleeShoulders(e,eq), GenerateHighTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3058,3166, GenerateLowTierMeleeBack(e,eq), GenerateHighTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3060,3168, GenerateLowTierMeleeArms(e,eq), GenerateHighTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3061,3168, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3061,3169, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3062,3170, GenerateLowTierMeleeHands(e,eq), GenerateHighTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3063,3171, GenerateLowTierMeleeLegs(e,eq), GenerateHighTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3064,3172, GenerateLowTierMeleeFeet(e,eq), GenerateHighTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		if(race_large == true)then
			e.self:AddItem(eq.ChooseRandom(3077, 3161, GenerateLowTierMeleeHead(e,eq), GenerateHighTierMeleeHead(e,eq)), 1, true);	-- Helm
			e.self:AddItem(eq.ChooseRandom(3078,3162, GenerateLowTierMeleeFace(e,eq), GenerateHighTierMeleeFace(e,eq)), 1, true); 			-- Visor
			e.self:AddItem(eq.ChooseRandom(3079,3163, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
			e.self:AddItem(eq.ChooseRandom(3083,3167, GenerateLowTierMeleeWaist(e,eq), GenerateHighTierMeleeWaist(e,eq)), 1, true); 			-- Belt
			e.self:AddItem(eq.ChooseRandom(3080,3164, GenerateLowTierMeleeChest(e,eq), GenerateHighTierMeleeChest(e,eq)), 1, true); 	-- Breastplate
			e.self:AddItem(eq.ChooseRandom(3081,3165, GenerateLowTierMeleeShoulders(e,eq), GenerateHighTierMeleeShoulders(e,eq)), 1, true); 	-- Pauldron
			e.self:AddItem(eq.ChooseRandom(3082,3166, GenerateLowTierMeleeBack(e,eq), GenerateHighTierMeleeBack(e,eq)), 1, true); 				-- Cloak
			e.self:AddItem(eq.ChooseRandom(3084,3168, GenerateLowTierMeleeArms(e,eq), GenerateHighTierMeleeArms(e,eq)), 1, true); 	-- Vambrace
			e.self:AddItem(eq.ChooseRandom(3085,3168, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3085,3169, GenerateLowTierMeleeWrist(e,eq), GenerateHighTierMeleeWrist(e,eq)), 1, true); 	-- Bracer
			e.self:AddItem(eq.ChooseRandom(3089,3170, GenerateLowTierMeleeHands(e,eq), GenerateHighTierMeleeHands(e,eq)), 1, true); 	-- Gauntlets
			e.self:AddItem(eq.ChooseRandom(3087,3171, GenerateLowTierMeleeLegs(e,eq), GenerateHighTierMeleeLegs(e,eq)), 1, true); 	-- Greaves
			e.self:AddItem(eq.ChooseRandom(3088,3172, GenerateLowTierMeleeFeet(e,eq), GenerateHighTierMeleeFeet(e,eq)), 1, true); 	-- Boots
		end
		
		e.self:AddItem(eq.ChooseRandom(GenerateHighTierRoguePrimary(e,eq), GenerateLowerTierRoguePrimary(e,eq)), 1, true);
		e.self:AddItem(eq.ChooseRandom(GenerateHighTierRoguePrimary(e,eq), GenerateLowerTierRoguePrimary(e,eq)), 1, true);
	end

	-- Monk
	if(class == 7) then
		e.self:AddItem(eq.ChooseRandom(1160, 1180), 1, true);	-- Helm
		e.self:AddItem(eq.ChooseRandom(1161,1181, GenerateLowTierMeleeFace(e,eq), GenerateHighTierMeleeFace(e,eq)), 1, true); 			-- Visor
		e.self:AddItem(eq.ChooseRandom(1162,1182, GenerateLowTierMeleeNeck(e,eq), GenerateHighTierMeleeNeck(e,eq)), 1, true); 			-- Collar
		e.self:AddItem(eq.ChooseRandom(1166,1186, GenerateLowTierMeleeWaist(e,eq), GenerateHighTierMeleeWaist(e,eq)), 1, true); 			-- Belt
		e.self:AddItem(eq.ChooseRandom(1163,1183), 1, true); 	-- Breastplate
		e.self:AddItem(eq.ChooseRandom(1164,1184), 1, true); 	-- Pauldron
		e.self:AddItem(eq.ChooseRandom(1165,1185, GenerateLowTierMeleeBack(e,eq), GenerateHighTierMeleeBack(e,eq)), 1, true); 				-- Cloak
		e.self:AddItem(eq.ChooseRandom(1167,1187), 1, true); 	-- Vambrace
		e.self:AddItem(eq.ChooseRandom(1168,1188), 1, true); 	-- Bracer
		e.self:AddItem(eq.ChooseRandom(1168,1188), 1, true); 	-- Bracer
		e.self:AddItem(eq.ChooseRandom(1169,1189), 1, true); 	-- Gauntlets
		e.self:AddItem(eq.ChooseRandom(1170,1190), 1, true); 	-- Greaves
		e.self:AddItem(eq.ChooseRandom(1171,1191), 1, true); 	-- Boots
	end
	
	--local dual_wield = false;
	--dual_wield = eq.ChooseRandom(true,false);

	
	-- Generate Primary / secondary
	-- Wars / Pals / SKs / Rangers 
	-- Mix of bronze & fine steel
	if(class == 1 or class == 3 or class == 4 or class == 5) then
		local one_handed = eq.ChooseRandom(false, false, false, true,true, true);
		
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeWeapon(e,eq),GenerateHighTierMeleeWeapon(e,eq)), 1, true);
			local has_shield = eq.ChooseRandom(false,true);
			if(class == 3 or class == 5 or has_shield == true) then
				if(race_small == true) then
					e.self:AddItem(eq.ChooseRandom(9014, 9010, GenerateLowTierMeleeShield(e,eq), GenerateHighTierMeleeShield(e,eq)), 1, true);
				elseif(race_medium == true) then
					e.self:AddItem(eq.ChooseRandom(9006, 9002, GenerateLowTierMeleeShield(e,eq), GenerateHighTierMeleeShield(e,eq)), 1, true);
				elseif(race_large == true) then
					e.self:AddItem(eq.ChooseRandom(9021, 9017, GenerateLowTierMeleeShield(e,eq), GenerateHighTierMeleeShield(e,eq)), 1, true);
				end
			else
				if(class == 1 or class == 4) then
					e.self:AddItem(eq.ChooseRandom(GenerateHighTierRoguePrimary(e,eq), GenerateLowerTierRoguePrimary(e,eq)), 1, true);
				end
			end
		elseif(one_handed == false) then
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierTwoHandedWeapons(e,eq),GenerateHighTierTwoHandedWeapons(e,eq)), 1, true);
		end
	end
	
	-- Jewelry
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeRing(e,eq), GenerateHighTierMeleeRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeRing(e,eq), GenerateHighTierMeleeRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeEarRing(e,eq), GenerateHighTierMeleeEarRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierMeleeEarRing(e,eq), GenerateHighTierMeleeEarRing(e,eq)), 1, true);
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
		e.self:AddItem(eq.ChooseRandom(1001,2001, GenerateLowTierPriestHead(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1013,2013, GenerateLowTierPriestHead(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1025,2025, GenerateLowTierPriestHead(e,eq)), 1, true);
	end

-- Face
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1002,2002, GenerateLowTierPriestFace(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1014, 2014, GenerateLowTierPriestFace(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1026,2026, GenerateLowTierPriestFace(e,eq)), 1, true);
	end

-- Neck
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1003,2003, GenerateLowTierPriestNeck(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1015,2015, GenerateLowTierPriestNeck(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1027,2027, GenerateLowTierPriestNeck(e,eq)), 1, true);
	end

-- Shoulders
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1005,2005, GenerateLowTierPriestShoulders(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1017,2017, GenerateLowTierPriestShoulders(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1029,2029, GenerateLowTierPriestShoulders(e,eq)), 1, true);
	end

-- Arms
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1008,2008, GenerateLowTierPriestArms(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1020,2020, GenerateLowTierPriestArms(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1032,2032, GenerateLowTierPriestArms(e,eq)), 1, true);
	end

-- Back
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1006,2006, GenerateLowTierPriestBack(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1018,2018, GenerateLowTierPriestBack(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1030,2030, GenerateLowTierPriestBack(e,eq)), 1, true);
	end

-- Left Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009,2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021,2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1033,2033, GenerateLowTierPriestWrist(e,eq)), 1, true);
	end

-- Right Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009,2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021,2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1033,2033, GenerateLowTierPriestWrist(e,eq)), 1, true);
	end

-- Hands
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1010,2010, GenerateLowTierPriestHands(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1022,2022, GenerateLowTierPriestHands(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1034,2034, GenerateLowTierPriestHands(e,eq)), 1, true);
	end

-- Chest
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1004,2004, GenerateLowTierPriestChest(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1016,2016, GenerateLowTierPriestChest(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1028,2028, GenerateLowTierPriestChest(e,eq)), 1, true);
	end

-- Legs
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1011,2011, GenerateLowTierPriestLegs(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1023,2023, GenerateLowTierPriestLegs(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1035,2035, GenerateLowTierPriestLegs(e,eq)), 1, true);
	end

-- Feet
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1012,2012, GenerateLowTierPriestFeet(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1024,2024, GenerateLowTierPriestFeet(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1036,2036, GenerateLowTierPriestFeet(e,eq)), 1, true);
	end

-- Belt

	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1007,2007, GenerateLowTierPriestWaist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1019,2019, GenerateLowTierPriestWaist(e,eq)), 1, true);
	elseif(race_large == true) then
		e.self:AddItem(eq.ChooseRandom(1031,2031, GenerateLowTierPriestWaist(e,eq)), 1, true);
	end
	
		-- Weapons
		one_handed = eq.ChooseRandom(true,false)
	if(one_handed == true) then
		if(class == 2) then
			e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,6024, GenerateLowTierPriestWeapon(e,eq)), 1, true);
		elseif(class == 6) then
		-- 6 Druid
			e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034, GenerateLowTierPriestWeapon(e,eq)), 1, true);
		elseif(class == 10) then
			e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,7009,7014, GenerateLowTierPriestWeapon(e,eq)), 1, true);
		end
		-- 10 Shaman
		e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq)), 1, true);
	else
		e.self:AddItem(GenerateLowTierPriestTwoHandedWeapon(e,eq), 1, true);
	end
	
	-- Jewelry
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestEarRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestEarRing(e,eq)), 1, true);
end

function GenerateTierThreePriestLoot(e,eq)

	if(class == 6) then
			-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2001, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2013, GenerateLowTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2002, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2014, GenerateLowTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2003, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2015, GenerateLowTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2005, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2017, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2008, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2020, GenerateLowTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2006, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2018, GenerateLowTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2010, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2022, GenerateLowTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2004, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2016, GenerateLowTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2011, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2023, GenerateLowTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2012, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2024, GenerateLowTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt

		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2007, GenerateLowTierPriestWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2019, GenerateLowTierPriestWaist(e,eq)), 1, true);
		end
		
		one_handed = eq.ChooseRandom(true,false)
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034, GenerateLowTierPriestWeapon(e,eq)), 1, true);
			
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(GenerateLowTierPriestTwoHandedWeapon(e,eq), 1, true);
		end
	elseif (class == 10) then
		-- 3K range: Banded
		-- 2K range: Leather
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025, GenerateLowTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026, GenerateLowTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027, GenerateLowTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032, GenerateLowTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030, GenerateLowTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034, GenerateLowTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028, GenerateLowTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035, GenerateLowTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3088,2036, GenerateLowTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007, GenerateLowTierPriestBelt(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019, GenerateLowTierPriestBelt(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3083,2031, GenerateLowTierPriestBelt(e,eq)), 1, true);
		end
	
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350,7014,7351, GenerateLowTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestTwoHandedWeapon(e,eq)), 1, true);
		end

	elseif(class == 2) then
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4201, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4213, GenerateLowTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002,4202, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014,4214, GenerateLowTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003,4203, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015,4215, GenerateLowTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005,4205, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017,4217, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4208, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3072,2020,4220, GenerateLowTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4210, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4222, GenerateLowTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4204, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4216, GenerateLowTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4211, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3075,2023,4223, GenerateLowTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4212, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024,4224, GenerateLowTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007,4207, GenerateLowTierPriestWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019,4219, GenerateLowTierPriestWaist(e,eq)), 1, true);
		end
	
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350, GenerateLowTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestTwoHandedWeapon(e,eq)), 1, true);
		end
	end
	
	-- Jewelry
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestEarRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestEarRing(e,eq)), 1, true);
end

function GenerateTierFourPriestLoot(e,eq)

	if(class == 6) then
			-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2001, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2013, GenerateLowTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2002, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2014, GenerateLowTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2003, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2015, GenerateLowTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2005, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2017, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2008, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2020, GenerateLowTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2006, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2018, GenerateLowTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2009, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2021, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2010, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2022, GenerateLowTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2004, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2016, GenerateLowTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2011, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2023, GenerateLowTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2012, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2024, GenerateLowTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt

		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2007), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2019), 1, true);
		end
		
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034, GenerateLowTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(GenerateLowTierPriestTwoHandedWeapon(e,eq), 1, true);
		end
	elseif (class == 10) then
		-- 3K range: Banded
		-- 2K range: Leather
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4947, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4947, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025,4947, GenerateLowTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026, GenerateLowTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027, GenerateLowTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4943, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4943, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032,4943, GenerateLowTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006,4948, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018,4948, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030,4948, GenerateLowTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4942, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4942, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034,4942, GenerateLowTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4946, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4946, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028,4946, GenerateLowTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4944, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4944, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035,4944, GenerateLowTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4941, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024,4941, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3088,2036,4941, GenerateLowTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007, GenerateLowTierPriestWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019, GenerateLowTierPriestWaist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3083,2031, GenerateLowTierPriestWaist(e,eq)), 1, true);
		end
	
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350,7014,7351, GenerateLowTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(GenerateLowTierPriestTwoHandedWeapon(e,eq), 1, true);
		end

	elseif(class == 2) then
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4201,21001, GenerateLowTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4213,21013, GenerateLowTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002,4202,21002, GenerateLowTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014,4214,21014, GenerateLowTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003,4203,21003, GenerateLowTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015,4215,21015, GenerateLowTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005,4205,21005, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017,4217,21017, GenerateLowTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4208,21008,4923, GenerateLowTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4220,21020,4923, GenerateLowTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006, GenerateLowTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925, GenerateLowTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925, GenerateLowTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4210,21010,4922, GenerateLowTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4222,21022,4922, GenerateLowTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4204,21004,4926, GenerateLowTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4216,21004,4926, GenerateLowTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4211,21011,4924, GenerateLowTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4223,21023,4924, GenerateLowTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4212,21012,4921, GenerateLowTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024,4224,21024,4921, GenerateLowTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007,4207,21007, GenerateLowTierPriestWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019,4219,21019, GenerateLowTierPriestWaist(e,eq)), 1, true);
		end
		
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350, GenerateLowTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(GenerateLowTierPriestTwoHandedWeapon(e,eq), 1, true);
		end
	end
	
	-- Jewelry
	e.self:AddItem(GenerateLowTierPriestRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierPriestRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierPriestEarRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierPriestEarRing(e,eq), 1, true);
end

function GenerateTierFivePriestLoot(e,eq)
	if(class == 6) then
			-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2001, GenerateLowTierPriestHead(e,eq), GenerateHighTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2013, GenerateLowTierPriestHead(e,eq), GenerateHighTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2002, GenerateLowTierPriestFace(e,eq), GenerateHighTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2014, GenerateLowTierPriestFace(e,eq), GenerateHighTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2003, GenerateLowTierPriestNeck(e,eq), GenerateHighTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2015, GenerateLowTierPriestNeck(e,eq), GenerateHighTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2005, GenerateLowTierPriestShoulders(e,eq), GenerateHighTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2017, GenerateLowTierPriestShoulders(e,eq), GenerateHighTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2008, GenerateLowTierPriestArms(e,eq), GenerateHighTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2020, GenerateLowTierPriestArms(e,eq), GenerateHighTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2006, GenerateLowTierPriestBack(e,eq), GenerateHighTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2018, GenerateLowTierPriestBack(e,eq), GenerateHighTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2009, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2021, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2009, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2021, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2010, GenerateLowTierPriestHands(e,eq), GenerateHighTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2022, GenerateLowTierPriestHands(e,eq), GenerateHighTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2004, GenerateLowTierPriestChest(e,eq), GenerateHighTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2016, GenerateLowTierPriestChest(e,eq), GenerateHighTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2011, GenerateLowTierPriestLegs(e,eq), GenerateHighTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2023, GenerateLowTierPriestLegs(e,eq), GenerateHighTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2012, GenerateLowTierPriestFeet(e,eq), GenerateHighTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2024, GenerateLowTierPriestFeet(e,eq), GenerateHighTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt

		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(2007, GenerateLowTierPriestWaist(e,eq), GenerateHighTierPriestWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(2019, GenerateLowTierPriestWaist(e,eq), GenerateHighTierPriestWaist(e,eq)), 1, true);
		end
		
		
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6018, 6001,6016,5021,5034, GenerateLowTierPriestWeapon(e,eq), GenerateHighTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq), GenerateHighTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestTwoHandedWeapon(e,eq), GenerateHighTierPriestTwoHandedWeapon(e,eq)), 1, true);
		end
	elseif (class == 10) then
		-- 3K range: Banded
		-- 2K range: Leather
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4947, GenerateLowTierPriestHead(e,eq), GenerateHighTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4947, GenerateLowTierPriestHead(e,eq), GenerateHighTierPriestHead(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3077,2025,4947, GenerateLowTierPriestHead(e,eq), GenerateHighTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002, GenerateLowTierPriestFace(e,eq), GenerateHighTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014, GenerateLowTierPriestFace(e,eq), GenerateHighTierPriestFace(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3078,2026, GenerateLowTierPriestFace(e,eq), GenerateHighTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003, GenerateLowTierPriestNeck(e,eq), GenerateHighTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015, GenerateLowTierPriestNeck(e,eq), GenerateHighTierPriestNeck(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3079,2027, GenerateLowTierPriestNeck(e,eq), GenerateHighTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005, GenerateLowTierPriestShoulders(e,eq), GenerateHighTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017, GenerateLowTierPriestShoulders(e,eq), GenerateHighTierPriestShoulders(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3081,2029, GenerateLowTierPriestShoulders(e,eq), GenerateHighTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4943, GenerateLowTierPriestArms(e,eq), GenerateHighTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4943, GenerateLowTierPriestArms(e,eq), GenerateHighTierPriestArms(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1032,2032,4943, GenerateLowTierPriestArms(e,eq), GenerateHighTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006,4948, GenerateLowTierPriestBack(e,eq), GenerateHighTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018,4948, GenerateLowTierPriestBack(e,eq), GenerateHighTierPriestBack(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3082,2030,4948, GenerateLowTierPriestBack(e,eq), GenerateHighTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4945, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4945, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3085,2033,4945, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4942, GenerateLowTierPriestHands(e,eq), GenerateHighTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4942, GenerateLowTierPriestHands(e,eq), GenerateHighTierPriestHands(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3089,2034,4942, GenerateLowTierPriestHands(e,eq), GenerateHighTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4946, GenerateLowTierPriestChest(e,eq), GenerateHighTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4946, GenerateLowTierPriestChest(e,eq), GenerateHighTierPriestChest(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3080,2028,4946, GenerateLowTierPriestChest(e,eq), GenerateHighTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4944, GenerateLowTierPriestLegs(e,eq), GenerateHighTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4944, GenerateLowTierPriestLegs(e,eq), GenerateHighTierPriestLegs(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(1035,2035,4944, GenerateLowTierPriestLegs(e,eq), GenerateHighTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4941, GenerateLowTierPriestFeet(e,eq), GenerateHighTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024,4941, GenerateLowTierPriestFeet(e,eq), GenerateHighTierPriestFeet(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3088,2036,4941, GenerateLowTierPriestFeet(e,eq), GenerateHighTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007, GenerateLowTierPriestWaist(e,eq), GenerateHighTierPriestWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019, GenerateLowTierPriestWaist(e,eq), GenerateHighTierPriestWaist(e,eq)), 1, true);
		elseif(race_large == true) then
			e.self:AddItem(eq.ChooseRandom(3083,2031, GenerateLowTierPriestWaist(e,eq), GenerateHighTierPriestWaist(e,eq)), 1, true);
		end
	
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350,7014,7351, GenerateLowTierPriestWeapon(e,eq), GenerateHighTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq), GenerateHighTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestTwoHandedWeapon(e,eq), GenerateHighTierPriestTwoHandedWeapon(e,eq)), 1, true);
		end

	elseif(class == 2) then
		-- Helm
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3053,2001,4201,21001, GenerateLowTierPriestHead(e,eq), GenerateHighTierPriestHead(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3065,2013,4213,21013, GenerateLowTierPriestHead(e,eq), GenerateHighTierPriestHead(e,eq)), 1, true);
		end

	-- Face
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3054,2002,4202,21002, GenerateLowTierPriestFace(e,eq), GenerateHighTierPriestFace(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3066, 2014,4214,21014, GenerateLowTierPriestFace(e,eq), GenerateHighTierPriestFace(e,eq)), 1, true);
		end

	-- Neck
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3055,2003,4203,21003, GenerateLowTierPriestNeck(e,eq), GenerateHighTierPriestNeck(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3067,2015,4215,21015, GenerateLowTierPriestNeck(e,eq), GenerateHighTierPriestNeck(e,eq)), 1, true);
		end

	-- Shoulders
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3057,2005,4205,21005, GenerateLowTierPriestShoulders(e,eq), GenerateHighTierPriestShoulders(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3069,2017,4217,21017, GenerateLowTierPriestShoulders(e,eq), GenerateHighTierPriestShoulders(e,eq)), 1, true);
		end

	-- Arms
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3060,2008,4208,21008,4923, GenerateLowTierPriestArms(e,eq), GenerateHighTierPriestArms(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1020,2020,4220,21020,4923, GenerateLowTierPriestArms(e,eq), GenerateHighTierPriestArms(e,eq)), 1, true);
		end

	-- Back
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3058,2006, GenerateLowTierPriestBack(e,eq), GenerateHighTierPriestBack(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3070,2018, GenerateLowTierPriestBack(e,eq), GenerateHighTierPriestBack(e,eq)), 1, true);
		end

	-- Left Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		end

	-- Right Wrist
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3061,2009,4209,21009,4925, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3073,2021,4221,21021,4925, GenerateLowTierPriestWrist(e,eq), GenerateHighTierPriestWrist(e,eq)), 1, true);
		end

	-- Hands
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3062,2010,4210,21010,4922, GenerateLowTierPriestHands(e,eq), GenerateHighTierPriestHands(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3074,2022,4222,21022,4922, GenerateLowTierPriestHands(e,eq), GenerateHighTierPriestHands(e,eq)), 1, true);
		end

	-- Chest
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3056,2004,4204,21004,4926, GenerateLowTierPriestChest(e,eq), GenerateHighTierPriestChest(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3068,2016,4216,21004,4926, GenerateLowTierPriestChest(e,eq), GenerateHighTierPriestChest(e,eq)), 1, true);
		end

	-- Legs
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3063,2011,4211,21011,4924, GenerateLowTierPriestLegs(e,eq), GenerateHighTierPriestLegs(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(1023,2023,4223,21023,4924, GenerateLowTierPriestLegs(e,eq), GenerateHighTierPriestLegs(e,eq)), 1, true);
		end

	-- Feet
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3064,2012,4212,21012,4921, GenerateLowTierPriestFeet(e,eq), GenerateHighTierPriestFeet(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3076,2024,4224,21024,4921, GenerateLowTierPriestFeet(e,eq), GenerateHighTierPriestFeet(e,eq)), 1, true);
		end

	-- Belt
		if(race_medium == true) then
			e.self:AddItem(eq.ChooseRandom(3059,2007,4207,21007, GenerateLowTierPriestWaist(e,eq), GenerateHighTierPriestWaist(e,eq)), 1, true);
		elseif(race_small == true) then
			e.self:AddItem(eq.ChooseRandom(3071,2019,4219,21019, GenerateLowTierPriestWaist(e,eq), GenerateHighTierPriestWaist(e,eq)), 1, true);
		end
	
		one_handed = eq.ChooseRandom(true,false);
		if(one_handed == true) then
			e.self:AddItem(eq.ChooseRandom(6022,6024,6351,6350, GenerateLowTierPriestWeapon(e,eq), GenerateHighTierPriestWeapon(e,eq)), 1, true);
			e.self:AddItem(eq.ChooseRandom(9002, GenerateLowTierPriestOffHand(e,eq), GenerateHighTierPriestOffHand(e,eq)), 1, true);
		else
			e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestTwoHandedWeapon(e,eq), GenerateHighTierPriestTwoHandedWeapon(e,eq)), 1, true);
		end
	end
	
	
	-- Jewelry
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestRing(e,eq), GenerateHighTierPriestRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestRing(e,eq), GenerateHighTierPriestRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestEarRing(e,eq), GenerateHighTierPriestEarRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierPriestEarRing(e,eq), GenerateHighTierPriestEarRing(e,eq)), 1, true);
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
	-- Head
	if(race_medium == true) then
		e.self:AddItem(1001, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1013, 1, true);
	end

	-- Face
	if(race_medium == true) then
		e.self:AddItem(1002, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1014, 1, true);
	end

	-- Shoulders
	if(race_medium == true) then
		e.self:AddItem(1005, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1017, 1, true);
	end

	-- Arms
	if(race_medium == true) then
		e.self:AddItem(1008, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1020, 1, true);
	end

	-- Back
	if(race_medium == true) then
		e.self:AddItem(1006, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1018, 1, true);
	end

	-- Wrist
	if(race_medium == true) then
		e.self:AddItem(1009, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1021, 1, true);
	end

	-- Wrist
	if(race_medium == true) then
		e.self:AddItem(1009, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1021, 1, true);
	end

	-- Gloves
	if(race_medium == true) then
		e.self:AddItem(1010, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1022, 1, true);
	end

	-- Robe
	if(class == 11) then
		e.self:AddItem(119468, 1, true);
	elseif(class == 12) then
		e.self:AddItem(119467, 1, true);
	elseif(class == 13) then
		e.self:AddItem(119469, 1, true);
	elseif(class == 14) then
		e.self:AddItem(119466, 1, true);
	end

	-- Legs
	if(race_medium == true) then
		e.self:AddItem(1011, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1023, 1, true);
	end

	-- Feet
	if(race_medium == true) then
		e.self:AddItem(1012, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1024, 1, true);
	end

	-- Waist
	if(race_medium == true) then
		e.self:AddItem(1007, 1, true);
	elseif(race_small == true) then
		e.self:AddItem(1019, 1, true);
	end
end

function GenericLowTierCasterLoot(e,eq)
	-- Head
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1001, GenerateLowTierCasterHead(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1013, GenerateLowTierCasterHead(e,eq)), 1, true);
	end

	-- Face
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1002, GenerateLowTierCasterFace(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1014, GenerateLowTierCasterFace(e,eq)), 1, true);
	end

	-- Shoulders
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1005, GenerateLowTierCasterShoulders(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1017, GenerateLowTierCasterShoulders(e,eq)), 1, true);
	end

	-- Arms
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1008, GenerateLowTierCasterArms(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1020, GenerateLowTierCasterArms(e,eq)), 1, true);
	end

	-- Back
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1006, GenerateLowTierCasterBack(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1018, GenerateLowTierCasterBack(e,eq)), 1, true);
	end

	-- Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009, GenerateLowTierCasterWrist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021, GenerateLowTierCasterWrist(e,eq)), 1, true);
	end

	-- Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009, GenerateLowTierCasterWrist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021, GenerateLowTierCasterWrist(e,eq)), 1, true);
	end

	-- Gloves
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1010, GenerateLowTierCasterHands(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1022, GenerateLowTierCasterHands(e,eq)), 1, true);
	end

	-- Robe
	if(class == 11) then
		e.self:AddItem(eq.ChooseRandom(119468, GenerateLowTierCasterChest(e,eq)), 1, true);
	elseif(class == 12) then
		e.self:AddItem(eq.ChooseRandom(119467, GenerateLowTierCasterChest(e,eq)), 1, true);
	elseif(class == 13) then
		e.self:AddItem(eq.ChooseRandom(119469, GenerateLowTierCasterChest(e,eq)), 1, true);
	elseif(class == 14) then
		e.self:AddItem(eq.ChooseRandom(119466, GenerateLowTierCasterChest(e,eq)), 1, true);
	end

	-- Legs
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1011, GenerateLowTierCasterLegs(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1023, GenerateLowTierCasterLegs(e,eq)), 1, true);
	end

	-- Feet
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1012, GenerateLowTierCasterFeet(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1024, GenerateLowTierCasterFeet(e,eq)), 1, true);
	end

	-- Waist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1007, GenerateLowTierCasterWaist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1019, GenerateLowTierCasterWaist(e,eq)), 1, true);
	end
end

function GenericHighTierCasterLoot(e,eq)
	-- Head
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1001, GenerateLowTierCasterHead(e,eq), GenerateHighTierCasterHead(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1013, GenerateLowTierCasterHead(e,eq), GenerateHighTierCasterHead(e,eq)), 1, true);
	end

	-- Face
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1002, GenerateLowTierCasterFace(e,eq), GenerateHighTierCasterFace(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1014, GenerateLowTierCasterFace(e,eq), GenerateHighTierCasterFace(e,eq)), 1, true);
	end

	-- Shoulders
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1005, GenerateLowTierCasterShoulders(e,eq), GenerateHighTierCasterShoulders(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1017, GenerateLowTierCasterShoulders(e,eq), GenerateHighTierCasterShoulders(e,eq)), 1, true);
	end

	-- Arms
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1008, GenerateLowTierCasterArms(e,eq), GenerateHighTierCasterArms(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1020, GenerateLowTierCasterArms(e,eq), GenerateHighTierCasterArms(e,eq)), 1, true);
	end

	-- Back
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1006, GenerateLowTierCasterBack(e,eq), GenerateHighTierCasterBack(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1018, GenerateLowTierCasterBack(e,eq), GenerateHighTierCasterBack(e,eq)), 1, true);
	end

	-- Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009, GenerateLowTierCasterWrist(e,eq), GenerateHighTierCasterWrist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021, GenerateLowTierCasterWrist(e,eq), GenerateHighTierCasterWrist(e,eq)), 1, true);
	end

	-- Wrist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1009, GenerateLowTierCasterWrist(e,eq), GenerateHighTierCasterWrist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1021, GenerateLowTierCasterWrist(e,eq), GenerateHighTierCasterWrist(e,eq)), 1, true);
	end

	-- Gloves
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1010, GenerateLowTierCasterHands(e,eq), GenerateHighTierCasterHands(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1022, GenerateLowTierCasterHands(e,eq), GenerateHighTierCasterHands(e,eq)), 1, true);
	end

	-- Robe
	if(class == 11) then
		e.self:AddItem(eq.ChooseRandom(119468, GenerateLowTierCasterChest(e,eq), GenerateHighTierCasterChest(e,eq)), 1, true);
	elseif(class == 12) then
		e.self:AddItem(eq.ChooseRandom(119467, GenerateLowTierCasterChest(e,eq), GenerateHighTierCasterChest(e,eq)), 1, true);
	elseif(class == 13) then
		e.self:AddItem(eq.ChooseRandom(119469, GenerateLowTierCasterChest(e,eq), GenerateHighTierCasterChest(e,eq)), 1, true);
	elseif(class == 14) then
		e.self:AddItem(eq.ChooseRandom(119466, GenerateLowTierCasterChest(e,eq), GenerateHighTierCasterChest(e,eq)), 1, true);
	end

	-- Legs
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1011, GenerateLowTierCasterLegs(e,eq), GenerateHighTierCasterLegs(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1023, GenerateLowTierCasterLegs(e,eq), GenerateHighTierCasterLegs(e,eq)), 1, true);
	end

	-- Feet
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1012, GenerateLowTierCasterFeet(e,eq), GenerateHighTierCasterFeet(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1024, GenerateLowTierCasterFeet(e,eq), GenerateHighTierCasterFeet(e,eq)), 1, true);
	end

	-- Waist
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1007, GenerateLowTierCasterWaist(e,eq), GenerateHighTierCasterWaist(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1019, GenerateLowTierCasterWaist(e,eq), GenerateHighTierCasterWaist(e,eq)), 1, true);
	end
end

function GenerateTierTwoCasterLoot(e,eq)

	GenericLowTierCasterLoot(e,eq);
	one_handed = eq.ChooseRandom(true,false);
	if(one_handed == true) then
		e.self:AddItem(eq.ChooseRandom(7012, 6018, GenerateLowTierCasterWeapon(e,eq)), 1, true);	-- Weapons
		e.self:AddItem(GenerateLowTierCasterOffHand(e,eq), 1, true);
	else
		e.self:AddItem(GenerateLowTierCasterTwoHandedWeapon(e,eq), 1, true);
	end

	-- Doing Neck slot here because I can't be arsed to retool this whole mess
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1003, GenerateLowTierCasterNeck(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1015, GenerateLowTierCasterNeck(e,eq)), 1, true);
	end

	
	-- Jewelry
	e.self:AddItem(GenerateLowTierCasterRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterEarRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterEarRing(e,eq), 1, true);
end

function GenerateTierThreeCasterLoot(e,eq)
	GenericLowTierCasterLoot(e,eq);
	one_handed = eq.ChooseRandom(true,false);
	if(one_handed == true) then
		e.self:AddItem(eq.ChooseRandom(7350, 6018, GenerateLowTierCasterWeapon(e,eq)), 1, true);	-- Weapons
		e.self:AddItem(GenerateLowTierCasterOffHand(e,eq), 1, true);
	else
		e.self:AddItem(GenerateLowTierCasterTwoHandedWeapon(e,eq), 1, true);
	end
	
	-- Doing Neck slot here because I can't be arsed to retool this whole mess
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1003, GenerateLowTierCasterNeck(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1015, GenerateLowTierCasterNeck(e,eq)), 1, true);
	end
	
	-- Jewelry
	e.self:AddItem(GenerateLowTierCasterRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterEarRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterEarRing(e,eq), 1, true);
end

function GenerateTierFourCasterLoot(e,eq)
	GenericLowTierCasterLoot(e,eq);
	one_handed = eq.ChooseRandom(true,false);
	if(one_handed == true) then
		e.self:AddItem(eq.ChooseRandom(7350, 6018, GenerateLowTierCasterWeapon(e,eq)), 1, true);	-- Weapons
		e.self:AddItem(GenerateLowTierCasterOffHand(e,eq), 1, true);
	else
		e.self:AddItem(GenerateLowTierCasterTwoHandedWeapon(e,eq), 1, true);
	end
	
	-- Doing Neck slot here because I can't be arsed to retool this whole mess
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1003, GenerateLowTierCasterNeck(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1015, GenerateLowTierCasterNeck(e,eq)), 1, true);
	end
	
	-- Jewelry
	e.self:AddItem(GenerateLowTierCasterRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterEarRing(e,eq), 1, true);
	e.self:AddItem(GenerateLowTierCasterEarRing(e,eq), 1, true);
end

function GenerateTierFiveCasterLoot(e,eq)
	GenericHighTierCasterLoot(e,eq);
	one_handed = eq.ChooseRandom(true,false);
	if(one_handed == true) then
		e.self:AddItem(eq.ChooseRandom(7350, 6018, GenerateLowTierCasterWeapon(e,eq), GenerateHighTierCasterWeapon(e,eq)), 1, true);	-- Weapons
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierCasterOffHand(e,eq), GenerateHighTierCasterOffHand(e,eq)), 1, true);
	else
		e.self:AddItem(eq.ChooseRandom(GenerateLowTierCasterTwoHandedWeapon(e,eq), GenerateHighTierCasterTwoHandedWeapon(e,eq)), 1, true);
	end
	
	-- Doing Neck slot here because I can't be arsed to retool this whole mess
	if(race_medium == true) then
		e.self:AddItem(eq.ChooseRandom(1003, GenerateLowTierCasterNeck(e,eq), GenerateHighTierCasterNeck(e,eq)), 1, true);
	elseif(race_small == true) then
		e.self:AddItem(eq.ChooseRandom(1015, GenerateLowTierCasterNeck(e,eq), GenerateHighTierCasterNeck(e,eq)), 1, true);
	end
	
	-- Jewelry
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierCasterRing(e,eq), GenerateHighTierCasterRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierCasterRing(e,eq), GenerateHighTierCasterRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierCasterEarRing(e,eq), GenerateHighTierCasterEarRing(e,eq)), 1, true);
	e.self:AddItem(eq.ChooseRandom(GenerateLowTierCasterEarRing(e,eq), GenerateHighTierCasterEarRing(e,eq)), 1, true);
end

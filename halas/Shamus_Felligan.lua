-- : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : In that order

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetin's! Justice speaks through us. We're the followers o' the Tribunal. We act as judge. jury and executioner fer all misled Northmen. Sometimes we must also execute our swift justice upon evil races. such as th' [ice goblins].");
	elseif(e.message:findi("ice goblins")) then
		e.self:Say("The ice goblins are a weak race. They pose no threat to our community. but lately we've heard rumors of ice goblins that can cast spells. They're said to be as weak as the goblin warriors. so I seek to employ the talents of our young shamans to [hunt the goblin casters].");
	elseif(e.message:findi("hunt the goblin casters")) then
		e.self:Say("Aye, ye'll serve justice.  I must find the source o' their recent spellcasting ability.  I hear reports o' glowing necklaces upon these wicked beasts' necks. Get me one o' these casters' necklaces. Return them in any condition at all. Go! Justice awaits yer return.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13968})) then								--Shattered Caster Beads
		e.self:Say("Shattered! This has happened frequently! These beads are very delicate. They're useless to me now, however, I'll reward ye fer the execution of yet more goblin casters. Continue yer work. The Tribunal watches ye!");
		e.other:AddEXP(1600);
		e.other:Ding();
		e.other:Faction(328,2);																--Merchants of Halas
		e.other:Faction(327,2); 															--Shamen of Justice
		e.other:Faction(223,-3); 															--Circle of Unseen Hands
		e.other:Faction(336,-3); 															--Coalition of Tradefolk Underground
		e.other:Faction(5008,-3); 															--Hall of the Ebon Mask
		e.other:SummonItem(eq.ChooseRandom(15270,15275,15075,15271,15279,15212,15079));	--A Random Spell Listed Above
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13969})) then							--Caster Beads
		e.self:Say("Finally! Intact! This IS good news! I can continue me investigation now. As fer yer loyal deed, I'll offer ye this, the Gavel of Justice. May ye employ it well in the service o' justice");
		e.other:AddEXP(6400);
		e.other:Ding();
		e.other:Faction(328,6); 															--Merchants of Halas
		e.other:Faction(327,6); 															--Shamen of Justice
		e.other:Faction(223,-9); 															--Circle of Unseen Hands
		e.other:Faction(336,-9); 															--Coalition of Tradefolk Underground
		e.other:Faction(5008,-9); 															--Hall of the Ebon Mask
		e.other:SummonItem(6028); 														--Gavel of Justice
		e.other:GiveCash(0,0,0,1);
	end
item_lib.return_items(e.self, e.other, e.trade)
end

-- DEVELOPER: KOVOU
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. The fishing is sparse here. You would fare better at [Lake Rathe].");
	elseif(e.message:findi("lake rathe")) then
		e.self:Say("Beyond the Plains of Karana can be found a pass to Lake Rathe. I have heard stories of a giant water beast and underwater cities. I wish I knew how to swim.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18893})) then -- A Sealed Letter
		e.self:Say("So you are the new warrior. Let us test your skill. Across the pond is a skeleton. See him? Engage him in combat. He awaits. Return his skull to me and I shall call you a Steel Warrior. Be quick. He will dissipate soon.");
		eq.unique_spawn(4197,0,0,1055,3858,-19); -- a_strange_skeleton (self-depops after 5 min via its own timer)
		e.other:Ding();
		e.other:Faction(311,15,0); -- Steel Warriors
		e.other:Faction(262,15,0); -- Guards of Qeynos
		e.other:Faction(230,-15,0); -- Corrupt Qeynos Guards
		e.other:Faction(330,-15,0); -- Freeport Militia
		e.other:Faction(281,15,0); -- Knights of Truth
		e.other:AddEXP(2000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13397})) then -- Skull
		e.self:Say("So you have returned. Victory is yours, young Steel Warrior. Take this letter of recommendation to Brin Stolunger at the arena in Qeynos. You have passed.");
		e.other:SummonItem(18895); -- Letter of Recommendation
		e.other:Ding();
		e.other:Faction(311,15,0); -- Steel Warriors
		e.other:Faction(262,15,0); -- Guards of Qeynos
		e.other:Faction(230,-15,0); -- Corrupt Qeynos Guards
		e.other:Faction(330,-15,0); -- Freeport Militia
		e.other:Faction(281,15,0); -- Knights of Truth
		e.other:AddEXP(6000);
		e.other:GiveCash(7,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Defend yourself!");
	end
end

function event_slay(e)
	e.self:Say("A valiant effort! Unfortunately, no match for the mettle of a Steel Warrior!");
end

function event_death_complete(e)
	e.self:Say("The death of a Steel Warrior shall never go unnoticed!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhh ! Keep it down ! I'm here on a special mission for the clerical orders of Qeynos. Please be quick or you'll blow my cover!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 27498})) then
		e.self:Say("Oh thank Rodcet Filian sent you, I'm starving. Here - take my report back to him, and quickly. Those Gnolls are up to no good.");
		e.other:SummonItem(27420); -- Malityn's Report
		e.other:Ding();
		e.other:Faction(219,30,0);
		e.other:Faction(221,-30,0);
		e.other:Faction(262,30,0);
		e.other:Faction(282,30,0);
		e.other:Faction(341,30,0);
		e.other:AddEXP(5000);
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("In the name of the Rainkeeper, I strike at thee!!");
	end
end

function event_death_complete(e)
	e.self:Say("You will meet your own doom soon enough, my friend.. my influence with the Knights of Thunder is great, and they will not rest until I am avenged!");
end
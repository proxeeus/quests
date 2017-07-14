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
		e.other:Faction(9,30,0);
		e.other:Faction(21,-30,0);
		e.other:Faction(135,30,0);
		e.other:Faction(186,30,0);
		e.other:Faction(257,-30,0);
		e.other:AddEXP(5000);
	end
	
	item_lib.return_items(e.self, e.other, e.trade);
end
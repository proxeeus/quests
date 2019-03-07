function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13995})) then
		e.self:Say("Ahh!! You must have been sent by Beno of the Stormguard. I have been wondering when he would return my card. I have not been playing with a full deck. How about a reward? Hmm. Let's see what I have lying around.. Here!! Take this. I cannot possibly give you any of my good armor.");
		e.other:SummonItem(eq.ChooseRandom(3301,3048,3042,3050,3044,3047,3040,3043,3046,3049,3051,5358,7012,7015));
		e.other:Ding();
		e.other:AddEXP(5000);
		e.other:Faction(312,15,0);
		e.other:Faction(274,15,0);
		e.other:Faction(293,15,0);
		e.other:Faction(290,15,0);
		e.other:Faction(232,-15,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

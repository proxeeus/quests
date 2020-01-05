function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1681})) then
		e.self:Say("Nothing is left to hide now. You shall have the truth. But truth is not won easily and if you cannot defeat me, you have not the ability to see that vengeance is served. Brace yourself!");
		e.other:Ding();
		e.other:AddEXP(5000);
		e.other:Faction(404,50);
		e.self:AddToHateList(e.other, 1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

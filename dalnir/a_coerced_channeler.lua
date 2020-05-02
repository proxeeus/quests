function event_death_complete(e)
	e.self:Shout("The river of Xinth...");
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12752})) then
		e.other:SummonItem(12748);
		eq.spawn2(104079,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		e.self:Depop(true);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
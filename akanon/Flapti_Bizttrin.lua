function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You'll have to excuse me, but I am currently quite busy.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

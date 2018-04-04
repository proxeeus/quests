function event_say(e)
    s.self:Say("You will have to excuse me, I am quite busy.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

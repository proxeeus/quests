function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my humble establishment!  I specialize in cloth, but lately I have begun to dabble in silk, the finest material I have ever used.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

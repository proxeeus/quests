function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You show a great deal of courage in coming here to speak with me at such a young age. I'm afraid you are not yet ready to pursue work with the Wayfarers Brotherhood.Come back when you have more experience and we will talk again.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

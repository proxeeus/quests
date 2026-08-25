function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. I am afraid I cannot tell you much about my merchandise. I was hired by Ton to look after the shop at night. I can tell you that you would find a better deal during the daytime hours. Ton instructs me to charge more for nighttime service.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

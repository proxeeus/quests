function event_say(e)
	if(e.message:findi("nice hat")) then
		e.self:Say(string.format("Thank you, It is worn with pride and is the symbol of the Rivervale Militia."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if(e.joined) then
		e.self:Say(string.format("Time to die %s.", e.other:GetCleanName()));
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

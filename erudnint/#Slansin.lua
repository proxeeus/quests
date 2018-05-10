-- Inert Potion

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome! Please feel free to look around.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13983})) then
			e.self:Say("Thank you. I have been expecting this. We require it for mixing.");
			e.other:Ding();
			e.other:Faction(56,-5,0);
			e.other:Faction(145,-5,0);
			e.other:Faction(143,1,0);
			e.other:Faction(147,-5,0);
			e.other:AddEXP(300);
			e.self:Depop();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:23001 -- Slansin
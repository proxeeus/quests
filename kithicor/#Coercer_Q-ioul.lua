-- Rogue Epic NPC -- #Coercer_Q`ioul

function event_say(e)
	e.self:Emote("ignores you.");
end

function event_combat(e)
	if e.joined then
		e.self:Say("Kill! Kill! Kill! For Queen Cristanos!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28057})) then
		e.self:Say("The General will take care of you!");
		e.other:Ding();
		e.other:AddEXP(500);
		eq.spawn2(20252, 0, 0, 2316, 797, 275, 387);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

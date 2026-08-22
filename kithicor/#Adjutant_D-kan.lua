-- Rogue Epic NPC -- #Adjutant_D`kan

function event_say(e)
	e.self:Emote("ignores you.");
end

function event_combat(e)
	if e.joined then
		e.self:Say("Prepare to be gutted like a fish.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28057})) then
		if(e.other:GetLevel() >= 50) then
			e.self:Say("The general will want to look at this, Wait here.");
			eq.unique_spawn(20252, 0, 0, 2316, 797.5, 272.8, 390.2);
			eq.signal(20252, 1, 1);
		else
			e.self:Say("The General will take care of you!");
			e.other:Ding();
			e.other:AddEXP(500);
			eq.spawn2(20252, 0, 0, 2316, 797, 275, 387);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

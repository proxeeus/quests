function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("This better be good, " .. e.other:Race() .. "!  Well?  Spit it OUT!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 1724}, 0)) then
		e.self:Say("It's about time, whelp.  Take your payment and leave, you're scaring away my... clients.");
		e.other:Faction(448,3); -- Faction: Kromzek
		e.other:Faction(419,1); -- Faction: Kromrif
		e.other:Faction(429,1); -- Faction: King Tormax
		e.other:Faction(430,-1); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),0,0);

		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
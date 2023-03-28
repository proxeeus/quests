function event_combat(e)
	if(e.joined) then
		e.self:Say("Ahhh, money in the bank!");
	end
end

function event_spawn(e)
	local randomface = require("random_face");
	randomface.RandomFace(e.self, eq);
end


function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 1724})) then
	
		e.self:Say("It's about time, whelp. Take your payment and leave, you're scaring away my... clients.");
	
		e.other:GiveCash(5,5,2,1);
		e.other:Faction(430,-30,0); -- CoV
		e.other:Faction(419,10,0); -- Kromrif
		e.other:Faction(448,10,0); -- Kromzek
		e.other:AddEXP(1000);
		e.other:Ding();
		e.self:Depop(true);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
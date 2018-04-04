function event_trade(e)
    local item_lib = require("items");
    
    if(item_lib.check_turn_in(e.trade, {item1 = 18013})) then
      e.self:Say("What's this?  Oh dear. I am very sorry. Please take this to Uner with my apologies.");
      e.other:SummonItem(13240);
      e.other:Ding();
      e.other:AddEXP(200);
    end
end


function event_death(e)
	e.self:Say("My comrades will avenge my death.");
end

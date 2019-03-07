function event_death(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_trade(e)
  local item_lib = require("items");
  
  if(item_lib.check_turn_in(e.trade, {item1 = 16165})) then
    e.self:Say("Daleen sent you? She is so sweet. If she wasn't married.. ehem.. Thanks.");
    e.other:Ding();
		e.other:Faction(263,10,0);
		e.other:Faction(286,10,0);
		e.other:Faction(355,10,0);
		e.other:Faction(334,-30,0);
		e.other:Faction(292,10,0);
    e.other:AddEXP(500);
  end
end

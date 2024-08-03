-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13844})) then
		e.self:Say("Tick.. Pop.. Access granted.");
		e.other:Ding();
		e.other:SummonItem(13212);
		e.other:Faction(333,1,0);
		e.other:Faction(245,1,0);
		e.other:Faction(255,1,0);
		e.other:Faction(238,-1,0);
		e.other:Faction(287,-1,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Say("Bzzzz... Click... This unit is terminally damaged. Destruction of city property is a violation of city code 22468. All units shall be notified of your offense...");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Click... Tick... City violation. Code 5150. This unit is authorized to execute punishment. Please stand still. Thank you.");
    end
  end
  
-- Converted to .lua by Speedz

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 10999, item2 = 10975,item3 = 11039})) then
		e.self:Emote("fashions the ebon drakeling scales into a grip on the shaft of the staff, places the harpies eye within a metal fixture, fastens the fixture to the top of the staff and carves some delicate runes into the wood. 'click... wrrrr... a staff for you sir/madam. Click... wrrr.");
		e.other:Ding();
		e.other:SummonItem(11081);
		e.other:Faction(176,1,0);
		e.other:Faction(91,1,0);
		e.other:Faction(115,1,0);
		e.other:Faction(71,-1,0);
		e.other:Faction(209,-1,0);
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

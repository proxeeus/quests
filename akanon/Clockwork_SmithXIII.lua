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

	elseif(item_lib.check_turn_in(e.trade, {item1 = 11084, item2 =13054})) then
		e.self:Emote("fashions the giant rat pelt into a grip on the hilt of the stiletto and carves some delicate runes into the blade. 'click... wrrrr... a stiletto for you sir/madam. Click... wrrr.");
		e.other:Ding();
		e.other:SummonItem(11079);
		e.other:Faction(71,100,0); 	-- Dark reflection
		e.other:Faction(91,-10,0); 	-- eldritch collective
		e.other:Faction(115,-10,0); -- gem choppers
		e.other:Faction(76,-10,0); 	-- Deepmuses
		e.other:AddEXP(1000);
		
	elseif(item_lib.check_turn_in(e.trade, {item1 = 11083, item2 =11086})) then
		e.self:Emote("fashions the ebon drake scale into a grip on the hilt of the short sword and carves some delicate runes into the blade. 'click... wrrrr... a short sword for you sir/madam. Click... wrrr.");
		e.other:Ding();
		e.other:SummonItem(11078);
		e.other:Faction(71,100,0); 	-- Dark reflection
		e.other:Faction(91,-10,0); 	-- eldritch collective
		e.other:Faction(115,-10,0); -- gem choppers
		e.other:Faction(76,-10,0); 	-- Deepmuses
		e.other:AddEXP(1000);	
		
	elseif(item_lib.check_turn_in(e.trade, {item1 = 11082, item2 =11086})) then
		e.self:Emote("fashions the ebon drake scale into a grip on the hilt of the axe and carves some delicate runes into the blade. 'click... wrrrr... an axe for you sir/madam. Click... wrrr.");
		e.other:Ding();
		e.other:SummonItem(11078);
		e.other:Faction(71,100,0); 	-- Dark reflection
		e.other:Faction(91,-10,0); 	-- eldritch collective
		e.other:Faction(115,-10,0); -- gem choppers
		e.other:Faction(76,-10,0); 	-- Deepmuses
		e.other:AddEXP(1000);	
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why hello there, what are you looking for in this dark place? All that's down here is us assassins.");
	elseif(e.message:findi("dark assassin")) then
		e.self:Say("You have heard of him? I had a nice conversation with him. Sharing some secrets of gnomish spirits if yah know what I mean! In return he gave me a sketch that looks quite interesting. Of course I am stuck in this place waiting youngsters to teach when I would rather be out with you making poisons. Perhaps you are willing to make a trade with me for the sketch?");
	elseif(e.message:findi("trade")) then
		e.self:Say("Fantastic! If you combine Rage of Incapacitation, Wasted Flesh and Dreams of Drusella within a coffin bottle you can make me a nice bundle of poisons to play with. Then I will have no need for the sketch.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9470})) then	-- Bundle of Poisons
		e.self:Say("Look at all you brought me! Wonderful! Now I have something to do while I sit down here waiting on the youngsters. Here is the sketch I promised you."); 		-- text made up
		e.other:SummonItem(24096); 								-- Dip Resist Sketch
		e.other:Ding();
		e.other:Faction(240,100,0); 	-- Deep Muses
		e.other:Faction(288,15,0); 	-- Merchants of Ak'Anon
		e.other:Faction(255,15,0); 	-- Gem Choppers
		e.other:Faction(238,-15,0); 	-- Dark Reflection
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

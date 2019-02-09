function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Have you come here to test your powers of enchantment?");
	elseif(e.message:findi("test")) then
		e.self:Say("I am most honored to be able to help you. Please choose from one of my instructors. Lelulean or Enderbite.");
	elseif(e.message:findi("enderbite")) then
		e.self:Say("Enderbite it shall be. Take this book and read it. When you are finished, hand it back to me and I shall summon Enchantress Enderbite to test you.");
		e.other:SummonItem(18535);
	elseif(e.message:findi("lelulean")) then
		e.self:Say("Lelulean it shall be. Take this book and read it. When you are finished, hand it back to me and I shall summon Enchantress Lelulean to test you.");
		e.other:SummonItem(18534);

	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18534})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71104,0,0,640,1303.2,-766.9,0.8);
		e.self:Say("Till next time! Farewell!");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18535})) then
		e.self:Say("Farewell.");
		eq.spawn2(71085,0,0,640,1303.2,-766.9,0.8);
		e.self:Say("Till next time! Farewell!");
		eq.depop_with_timer();
	end
end


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

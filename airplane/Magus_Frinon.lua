function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Have you come here to test your abilities as a magician?");
	elseif(e.message:findi("test")) then
		e.self:Say("Choose your tester. Frederic or Roanis.");
	elseif(e.message:findi("frederic")) then
		e.self:Say("Frederic it shall be. Take this book and read it. When you are finished, hand it back to me and I shall summon the magician Frederic to test you.");
		e.other:SummonItem(18532);
	elseif(e.message:findi("roanis")) then
		e.self:Say("Return this tome to me if you wish me to summon Roanis Elindar to assist you. Destroy it if you do not.");
		e.other:SummonItem(18533);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18532})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71088,0,0,614.5,1304.1,-766.9,510);
		e.self:Say("I am no longer needed and will take my leave.");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18533})) then
		e.self:Say("Farewell.");
		eq.spawn2(71094,0,0,614.5,1304.1,-766.9,510);
		e.self:Say("I am no longer needed and will take my leave.");
		eq.depop_with_timer();
	end
end


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

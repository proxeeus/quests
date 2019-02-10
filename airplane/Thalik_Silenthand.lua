function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Do you believe you are a great rogue?");
	elseif(e.message:findi("great rogue")) then
		e.self:Say("I will not take your word for it!  You must prove your greatness to one of my apprentices.  Do you wish to be tested by Rayne or by Kendrick?");
	elseif(e.message:findi("rayne")) then
		e.self:Say("Rayne it shall be. Take this book and read it. When you are finished, hand it back to me and I shall summon the mighty rogue Rayne to test you.");
		e.other:SummonItem(18522);
	elseif(e.message:findi("kendrick")) then
		e.self:Say("Kendrick it shall be. Take this book and read it. When you are finished, hand it back to me and I shall summon the mighty rogue Kendrick to test you.");
		e.other:SummonItem(18523);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18522})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71061,0,0,563.3,1372.6,-766.9,126.8);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18523})) then
		e.self:Say("Farewell.");
		eq.spawn2(71068,0,0,563.3,1372.6,-766.9,126.8);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

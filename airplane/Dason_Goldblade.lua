function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Are you pure of heart and soul?");
	elseif(e.message:findi("pure")) then
		e.self:Say("Then choose. Do you wish your purity to be tested by Gregori or Dirkog?");
	elseif(e.message:findi("gregori")) then
		e.self:Say("Gregori is a true and faithful warrior of Tunare. Read this book and, when you feel confident, hand it back to me. I will summon Gregori to test you after you have done so.");
		e.other:SummonItem(18526);
	elseif(e.message:findi("dirkog")) then
		e.self:Say("Dirkog is a gruff one, but his faith is what all paladins should strive to equal. Read this book and return it to me. After you have done so, I shall summon Dirkog to test you.");
		e.other:SummonItem(18527);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18526})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71089,0,0,563,1331.1,-766.9,126.8);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18527})) then
		e.self:Say("Farewell.");
		eq.spawn2(71077,0,0,563,1331.1,-766.9,126.8);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

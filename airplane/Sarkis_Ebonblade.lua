function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ".  Have you come here to test your dark powers of skill and spell casting?");
	elseif(e.message:findi("test")) then
		e.self:Say("You will be tested by either Gragrot or Tynicon.  Choose one!");
	elseif(e.message:findi("gragrot")) then
		e.self:Say("Gragrot it is! Take this book and read it. When you are finished, hand it back to me and I shall summon Gragrot to test you.");
		e.other:SummonItem(18524);
	elseif(e.message:findi("tynicon")) then
		e.self:Say("Tynicon it is! Take this book and read it. When you are finished, hand it back to me and I shall summon Tynicon to test you.");
		e.other:SummonItem(18525);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18524})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71063,0,0,563.3,1351.9,-766.9,126.8);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18525})) then
		e.self:Say("Farewell.");
		eq.spawn2(71098,0,0,563.3,1351.9,-766.9,126.8);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

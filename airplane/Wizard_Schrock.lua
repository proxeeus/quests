function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Do you believe that you are a [great Wizard]?");
	elseif(e.message:findi("great wizard")) then
		e.self:Say("I will not take your word for it! You must prove your greatness to my apprentices. Do you wish to be tested by Neasin or by Abec?");
	elseif(e.message:findi("neasin")) then
		e.self:Say("Neasin it shall be. Take this book and read it. When you are finished, hand it back to me and I shall summon the mighty wizard Neasin to test you.");
		e.other:SummonItem(18530);	
	elseif(e.message:findi("abec")) then
		e.self:Say("Abec it shall be. Take this book and read it. When you are finished, hand it back to me and I shall summon the mighty wizard Abec to test you.");
		e.other:SummonItem(18531);	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18530})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71092,0,0,585,1304.3,-766.9,0.2);
		e.self:Say("Till next time! Farewell!");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18531})) then
		e.self:Say("Farewell.");
		eq.spawn2(71079,0,0,585,1304.3,-766.9,0.2);
		e.self:Say("Till next time! Farewell!");
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

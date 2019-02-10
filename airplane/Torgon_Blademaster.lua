function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Are you a [true warrior]?");
	elseif(e.message:findi("true warrior")) then
		e.self:Say("Then you shall be tested as one. Choose. Do you wish to be tested by Falorn or Ogog?");
	elseif(e.message:findi("falorn")) then
		e.self:Say("So be it, warrior. Take this book and read it. When you are finished, hand it back to me and I shall summon the mighty warrior Falorn to test you.");
		e.other:SummonItem(18520);
	elseif(e.message:findi("ogog"))then
		e.self:Say("Ogog? You are indeed brave for choosing that brute. Take this book telling the tale of Ogog and read it. When you are finished, hand it back to me.");
		e.other:SummonItem(18521);	
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18520})) then	
		e.self:Say("Falorn, come forth!");
		eq.spawn2(71067,0,0,563.3,1392.4,-766.9,126.8);
		e.self:Say("Farewell.");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18521})) then
		e.self:Say("Ogog, come forth!");
		eq.spawn2(71064,0,0,563.3,1392.4,-766.9,126.8);
		e.self:Say("Farewell.");
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ".  Do you feel that you are ready to be tested in song?");
	elseif(e.message:findi("tested in song")) then
		e.self:Say("The test of songs holds both joy and sorrow. Choose who you wish to begin with, Denise or Clarisa.");
	elseif(e.message:findi("clarisa")) then
		e.self:Say("Take this book of melodies and read. When you are done, I will summon Clarisa so you can begin your test.");
		e.other:SummonItem(18542);
	elseif(e.message:findi("denise")) then
		e.self:Say("Return this tome if you wish me to summon Denise Songweaver to assist you. Destroy it if you do not.");
		e.other:SummonItem(18543);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18543})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71082,0,0,660.7,1368.4,-766.9,385.2); -- Denise
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18542})) then
		e.self:Say("Farewell.");
		eq.spawn2(71081,0,0,660.7,1388.9,-766.9,385.2); -- Clarisa
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ".  Are you ready to begin your test of faith?");
	elseif(e.message:findi("test of faith")) then
		e.self:Say("I have faith that you will do well. Choose Alan or Deric.");
	elseif(e.message:findi("Alan")) then
		e.self:Say("Take and read this book. When you are done, hand it back to me and I will summon him.");
		e.other:SummonItem(18540);
	elseif(e.message:findi("Deric")) then
		e.self:Say("Take and read this book. When you are done, hand it back to me and I will summon him.");
		e.other:SummonItem(18541);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18541})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71083,0,0,660.7,1338.0,-766.9,386.4);	-- Deric dwarf
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18540})) then
		e.self:Say("Farewell.");
		eq.spawn2(71080,0,0,660.7,1361.6,-766.9,386.4);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

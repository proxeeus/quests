-- Necromancer Epic NPC -- Drakis_Bloodcaster
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, dark one. Are you ready to begin?");
	elseif(e.message:findi("ready")) then
		e.self:Say("Then choose, necromancer. Do you wish to be tested by Dugaas or Jzil?");
	elseif(e.message:findi("jzil")) then
		e.self:Say("Take this tome and read it. When you are finished, return it to me and I will summon Jzil.");
		e.other:SummonItem(18537);
	elseif(e.message:findi("dugaas")) then
		e.self:Say("Take this book and read it then. When you are finished, hand it back to me and I will summon the vile Dugaas.");
		e.other:SummonItem(18536);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18536})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71084,0,0,661.6,1302.8,-766.9,509.8);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18537})) then
		e.self:Say("Farewell.");
		eq.spawn2(71074,0,0,654.9,1305,-762.2,44);
		eq.depop_with_timer();
	end
end

--Quest by: Solid11
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you, " .. e.other:GetName() .. ". Are you a shaman of [much experience]?");
	elseif(e.message:findi("much experience")) then
		e.self:Say("Then welcome to the tests of the medicine man. I have two tomes, each tells of a shaman of great accomplishment. They are Gina MacStargan and Ooga. Simply tell me the name of the shaman you want to be tested by.");
	elseif(e.message:findi("gina")) then
		e.self:Say("Return this tome to me if you wish me to call forth Gina. Destroy it if you do not.");
		e.other:SummonItem(18544);
	elseif(e.message:findi("ooga")) then
		e.self:Say("Return this tome if you wish me to summon Ooga to assist you. Destroy it if you do not.");
		e.other:SummonItem(18545);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18544})) then	
		e.self:Say("Farewell.");
		eq.spawn2(71087,0,0,631.9,1401.9,-766.9,259.6);
		e.self:Say("I am no longer needed and will take my leave.");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18545})) then
		e.self:Say("Farewell.");
		eq.spawn2(71093,0,0,653.4,1399.0,-766.9,259.6);
		e.self:Say("I am no longer needed and will take my leave.");
		eq.depop_with_timer();
	end
end


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

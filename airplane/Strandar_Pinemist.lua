function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, young one. Are you a [child of the trees]?");
	elseif(e.message:findi("child of the trees")) then
		e.self:Say("Then you are welcome in my presence. I shall call forth some loyal children if you but speak the name. Will or Fenalla will serve you well.");
	elseif(e.message:findi("will")) then
		e.self:Say("Please read this tome. It will explain how Will Treewalker is able to assist. When you are finished, please return it to me. We have but a single copy of such a tome, for which a tree gave its life.");
		e.other:SummonItem(18528);
	elseif(e.message:findi("fenalla")) then
		e.self:Say("Please read this tome. It wll explain what Fenalla Moonshadow can assist you with. When you are finished, please return this to me. We have but a single copy of such a tome in the world, for which a tree gave its life.");
		e.other:SummonItem(18529);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18528})) then	
		e.self:Say("Welcome, Will Treewalker.");
		eq.spawn2(71099,0,0,563,1311.4,-766.9,130.8);
		e.self:Say("I am no longer needed and will take my leave.");
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18529})) then
		e.self:Say("Welcome, Fenalla Moonshadow.");
		eq.spawn2(71086,0,0,562.5,1329.3,-766.9,130.8);
		e.self:Say("I am no longer needed and will take my leave.");
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

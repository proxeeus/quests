function event_spawn(e)
	eq.set_timer("depop",300000);
	e.self:Say("I am here to do your bidding, Magician Spirit!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome. I am Magus Frederic. Do you wish to test your powers?");
	elseif(e.message:findi("test")) then
		e.self:Say("Great, let us waste no more time! I offer to you three challenges. Clarification, Empowerment, Gesticulation, and Shielding. Please choose one of these.");
	elseif(e.message:findi("clarification")) then 	--magician test of clarification
		e.self:Say("Clarification it is. Proceed upward through the sky and return to me a Crimson Tessera, an Ethereal Sapphire, and Feathered Cape.  This will prove your abilities to me and I will reward you with the Bracelet of Clarification.");
	elseif(e.message:findi("empowerment")) then 	--magician test of empowerment
		e.self:Say("Empowerment it is. Proceed upward through the sky and return to me an Iron Disc, a Gem of Empowerment, and a Ceramic Mask. This will prove your abilities to me and I will reward you with the Mask of Empowerment.");
	elseif(e.message:findi("shielding")) then 		--magician test of shielding
		e.self:Say("Shielding it is. Proceed upward through the sky and return to me a Hyaline Globe, an Ivory Pendant, and a Golden Coffer. This will prove your abilities to me and I will reward you with an Gold White Pendant.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20931, item2 = 20754, item3 = 20755})) then 					--magician test of clarification using crimson tessera, ethereal sapphire, feathered cape
		e.other:SummonItem(1274); 	--bracelet of clarification
		e.other:AddEXP(100000);
		e.self:Say("Take this as your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20937, item2 = 20756, item3 = 20757})) then 				--magician test of empowerment using iron disc, gem of empowerment, ceramic mask
		e.other:SummonItem(2707); 	--mask of empowerment
		e.other:AddEXP(100000);
		e.self:Say("Take this as your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20944, item2 = 20758, item3 = 20759, item4 = 20872})) then	--magician test of shielding using hyaline globe, ivory pendant, golden coffer
		e.other:SummonItem(14557); 	--gold white pendant
		e.other:AddEXP(100000);
		e.self:Say("Take this as your reward.");
		e.other:Ding();
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

function event_spawn(e)
	eq.set_timer("depop",300000);
	e.self:Say("Hail, I have come to assist.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I will test you in the tests of might, health, and sight. Which will it be?  I also have been intrusted allow adventurers to trade back their old items for an upgraded version.");
	elseif(e.message:findi("might")) then	--shaman test of might
		e.self:Say("The test of might It Is. Go find an Auburn Tessera, a Drake Fang and a Leather Chord. Bring them to me when you have them all and I shall reward you.");
	elseif(e.message:findi("health")) then 	--shaman test of health
		e.self:Say("The test of health Is difficult. I am sure that you will find It a challenge. Bring to me a Platinum Disc, some Ethereal Amber, a Shimmering Amber and finally a Ceremonial Belt. Return them all to me at once and you shall have your just reward.");
	elseif(e.message:findi("sight")) then 	--shaman test of sight
		e.self:Say("So you wish to take the test of sight do you? Get me a Phosphoric Globe, a Sphinx Hide and a Light Damask Mantle. Give them all to me at the same time and I shall reward you well.");
	elseif(e.message:findi("trade")) then
		e.self:Say("I am currently looking for the following. Drake Fang Amulet, Elder Shaman's Ceremonial Bracelet, or a Sphinx-Hide Mantle. I will reward you fairly for your work if you bring me for any one of those items.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20934, item2 = 20834, item3 = 20835})) then						--shaman test of might using auburn tessera, drake fang, leather cord
		e.other:SummonItem(14566); --drake fang amulet
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Take this as your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20940, item2 = 20836, item3 = 20837, item4 = 20838})) then 	--shaman test of health using platinum disc, ethereal amber, shimmering amber, ceremonial belt
		e.other:SummonItem(27727); --bracelet of the spirits
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Take this as your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20947, item2 = 20839, item3 = 20840, item4 = 20838})) then	--shaman test of sight using phosphoric globe, sphinx hide, light damask mantle
		e.other:SummonItem(27728); --fairy-hide mantle
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Take this as your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14566})) then
		e.other:SummonItem(27726); 
		e.self:Say("Thank you for bringing me back the Drake Fang Amulet. Here's something much better.");
		e.other:Ding();
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

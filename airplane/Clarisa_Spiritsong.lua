--Clarisa Spiritsong. Bard Quest NPC
function event_spawn(e)
	eq.set_timer("depop",300000);
	e.self:Say("Rejoice and sing my friend.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met " .. e.other:GetName() .. "! I give the second half of the test of songs. If you are ready, choose between the tests of brass, wind, and harmony. Or perhaps you wish to trade?");
	elseif(e.message:findi("brass")) then	--Bard Test of Brass
		e.self:Say("Then bring back to me an Efreeti War Horn, a Saffron Spiroc Feather, Adamintium Bands, and a Glowing Diamond. Then I will give you the horn of disaster.");
	elseif(e.message:findi("wind")) then	--Bard Test of Wind
		e.self:Say("Bring me an imp statuette, a dull stone, and an amulet of woven hair. Then I will give you the fae amulet.");
	elseif(e.message:findi("harmony")) then	--Bard Test of Harmony
		e.self:Say("Working with the environment to enthrall those that listen to you is of the utmost importance to us. Go out and retrieve an efreeti war spear, some manna nectar, a nebulous emerald, and a nebulous diamond. Return these items to me and receive the harmonic spear as your reward.");
	elseif(e.message:findi("trade")) then
		e.self:Say("I am currently looking for a Fae Amulet. If you do have one, please bring it to me so that I can give you a better one!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20830, item2 = 20961, item3 = 20828, item4 = 20829})) then		--Bard test of Brass using Adamantium Bands, Effreeti War horn, glowing diamond, and saffron spiroc feather
		e.other:SummonItem(27724); --Denon's Horn of Disaster
		e.other:AddEXP(100000);
		e.self:Say("Well done, " .. e.other:GetName() .. ". Here is your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20953, item2 = 20826, item3 = 20827, item4 = 20829})) then	--Bard test of Wind using Amulet of woven hair, dull stone, and imp statuette
		e.other:SummonItem(14565); --Fae amulet
		e.other:AddEXP(100000);
		e.self:Say("Well done, " .. e.other:GetName() .. ". Here is your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20831, item2 = 20968, item3 = 20832, item4 = 20833})) then	--Bard test of harmony using Effreeti war spear, manna nectar, nebulous diamond, and nebulous emerald
		e.other:SummonItem(10852); --harmonic spear
		e.other:AddEXP(100000);
		e.self:Say("Well done, " .. e.other:GetName() .. ". Here is your reward.");
		e.other:Ding();
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 14565})) then
		e.other:SummonItem(27723); 
		e.self:Say("Thank you for bringing me back the Fae Amulet. Here's something much better.");
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

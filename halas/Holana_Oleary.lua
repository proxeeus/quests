function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmph. Hello, how are ye an' how do ye do? Now, what are ye planning to buy?");
		eq.signal(29043, 1);
	elseif(e.message:findi("Jinkus sent me to assist you")) then
		e.self:Say("So, ye're the next to be tested, then, eh?! I pray ye're able to return. Ye'll need to take this note to Einhorst in Clan McMannus' fishing village in the Plains o' Karana. He'll hand ye the monthly Karana clover shipment to be returned to me. Just remember, dinnae stop running! Do ye [need directions to Clan McMannus]?"); 
		e.other:SummonItem(18831); 								-- Tattered Note identifying as Message to Clan McMannus
	elseif(e.message:findi("need directions to Clan McMannus")) then
		e.self:Say("Ye go through Everfrost Peaks and run through Blackburrow. Once in Qeynos Hills, ye'll head to yer left and follow the pathway to the Plains of Karana. In the plains, when the pathway splits, go to yer right. Then just head toward the horizon.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13962})) then	--Karana Clover Shipment
		e.self:Say("Good work. We Shamans o' Justice are like no other. We must remain in top physical form for we never know when justice must be served. I was commanded to give ye a reward. Take this. It was doing nothing more than collecting dust. Go, and serve justice well.");
		local rewardr = math.random(10);
		e.other:GiveCash(math.random(99),math.random(99),math.random(99),0);
		e.other:AddEXP(1600);
		e.other:Ding();
		e.other:Faction(213,2); 								--Merchants of Halas
		e.other:Faction(294,2); 								--Shamen of Justice
		e.other:Faction(33,-3); 								--Circle of Unseen Hands
		e.other:Faction(48,-3); 								--Coalition of Tradefolk Underground
		e.other:Faction(137,-3); 								--Hall of the Ebon Mask
		if(rewardr  < 4) then
			-- : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : Scale Skin : Spirit Pouch : In that order
			local spellreward = eq.ChooseRandom(15270,15275,15075,15271,15279,15212,15079,15274,15272);
			local dialog0;
			local dialog1 = "Drowsy ";
			local dialog2 = "Frost Rift";
			local dialog3 = "Sicken";
			local dialog4 = "Fleeting Fury";
			local dialog5 = "Spirit o' the Bear"; --check dialog with alla or live
			local dialog6 = "Cure Blindness";
			local dialog7 = "Spirit Sight";
			local dialog8 = "Scale Skin";
			local dialog9 = "Spirit Pouch";
			if(spellreward == 15270) then
				dialog0 = dialog1;
			elseif(spellreward == 15275) then
				dialog0 = dialog2;
			elseif(spellreward == 15075) then
				dialog0 = dialog3;
			elseif(spellreward == 15271) then
				dialog0 = dialog4;
			elseif(spellreward == 15279) then
				dialog0 = dialog5;
			elseif(spellreward == 15212) then
				dialog0 = dialog6;
			elseif(spellreward == 15079) then
				dialog0 = dialog7;
			elseif(spellreward == 15274) then
				dialog0 = dialog8;
			elseif(spellreward == 15272) then
				dialog0 = dialog9;
			end
			e.other:SummonItem(spellreward);
		elseif(rewardr < 7) then
			e.other:SummonItem(eq.ChooseRandom(2031,2036,2030,2034,2027,2038,2026,2029,2025,2032,2028,2033));	-- Complete Set of Large Leather Items
		elseif(rewardr < 10) then
			e.other:SummonItem(eq.ChooseRandom(5043,6032,6030,7022,7024,94155,6031));							-- All SHM usable tarnished weaponry
		else
			e.other:SummonItem(2912); 																			-- Polar Bear Cloak
		end
	end
end

-- DEVELOPER: KOVOU
-- modified by Speedz, Edited by Robregen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

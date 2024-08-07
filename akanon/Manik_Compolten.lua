-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, young one. I am Manik Compolten, High Watchman. Are you a [new warrior] or an [experienced fighter]?");
	elseif(e.message:findi("new warrior") or e.message:findi("keycard")) then
		e.self:Say("It is always good to see new blood amongst the Gemchoppers. I have a small task for you. Take this keycard. I will give you only one at a time. Use each to obtain blackboxes for the C series clockworks. I am sure you are familiar with the clockworks. When you are done, bring them all to me. Let me know if you need another keycard.");
		e.other:SummonItem(13844);
	elseif(e.message:findi("experienced fighter")) then
		e.self:Say("Good. I require your talents to destroy rogue clockworks. After we sent the clockworks to destroy the Asylum of the Mad we found some of the clockworks went haywire and never returned. We must destroy them, not for the safety of the people, but to keep our technology from falling into the hands of any other nation. Go to the Steamfont Mountains and return their rogue blackboxes to me.");
	elseif(e.message:findi("clockwork")) then
		e.self:Say("The clockworks were developed by the Eldritch Collective. They are used as our policing force in Ak'Anon. They come in many series. The letter following their number is the series model.");
	elseif(e.message:findi("bull smasher")) then
		e.self:Say("The war hammer, Bull Smasher was crafted by our great blacksmiths and tinkers. It is not magical, but it is weighted to perform for only the short of stature. Certainly an item like Bull Smasher could only be crafted by gnomes.");
	elseif(e.message:findi("meldrath")) then
		e.self:Say("Meldrath is the mad gnome. He used to be a member of the Eldritch Collective. Some say he lost his mind while he was working on a formula he obtained from other worlds. He used to lead the cult called the Asylum of the Mad.");
	elseif(e.message:findi("asylum")) then
		e.self:Say("The Asylum of the Mad was formed by the mad gnome, Meldrath. Under his direction, they were trying to build some giant mechanical titan. We recently sent all of our clockworks into the Steamfont Mountains to destroy their evil cult.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13208,item2 = 13208})) then -- 2x Rusted Blackbox
		e.self:Say("Excellent work! You were born to be a warrior. Here is a little bonus for the good job.");
		e.other:AddEXP(1000);
		e.other:GiveCash(1,3,1,2);
		e.other:Faction(255,3,0); 	-- gem choppers
		e.other:Faction(333,3,0); 	-- King ak'anon
		e.other:Faction(288,10,0); 	-- Merchants of Ak'Anon
		e.other:Faction(1604,-10,0); 	-- Clan Grikbar
		e.other:Faction(238,-10,0); 	-- Dark Reflection
		e.other:Ding();
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13212, item2 = 13211, item3 = 13213, item4 = 13214})) then
		e.self:Say("Ah!! I see you had no problem finding all of the C series clockworks. Good work. Here. Take this blackbox. We received it from Clockwork 27C. Take it to Jogl Doobraugh. He is the operator of the only blackbox definer in Ak'Anon. He is out at the windmills checking on their operation.");
		e.other:SummonItem(13209);
		e.other:Faction(255,1,0); 	-- gem choppers
		e.other:Faction(333,1,0); 	-- King ak'anon
		e.other:Faction(288,1,0); 	-- Merchants of Ak'Anon
		e.other:Faction(1604,-1,0); 	-- Clan Grikbar
		e.other:Faction(238,-1,0); 	-- Dark Reflection
		e.other:AddEXP(5000);
		e.other:Ding();
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13215})) then 
		e.self:Say("This is fabulous news!! You have done well, young one. Once you are ready for [further instruction] please let me know, I will guide you through your early most dangerous days. When you have become more experienced in our art, I wil be able to further instruct you on how to progress through your early ranks, as well as in some various [trades] you will have available to you.");
		e.other:SummonItem(eq.ChooseRandom(13219, 13219, 13220, 13220, 1013, 1018, 1015, 1019, 1022, 1023, 1024, 1017, 1016, 1020, 1014, 1021));
		e.other:Faction(255,1,0); 	-- gem choppers
		e.other:Faction(333,1,0); 	-- King ak'anon
		e.other:Faction(288,1,0); 	-- Merchants of Ak'Anon
		e.other:Faction(1604,-1,0); 	-- Clan Grikbar
		e.other:Faction(238,-1,0); 	-- Dark Reflection
		e.other:AddEXP(5000);
		e.other:Ding();
		e.other:GiveCash(1,3,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

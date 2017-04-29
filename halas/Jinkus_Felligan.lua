function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice], then, eh?");
	elseif(e.message:findi("new to the shamans")) then
		e.self:Say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye ready to [contribute to yer church] or do ye [wish to meditate] within our walls?");
	elseif(e.message:findi("contribute")) then
		e.self:Say("Well then, ye best be off ta find Holana Oleary, she organises our monthly Karan Clover shipments, just tell her Jinkus sent you to assist her. Or, I can have you [make a delivery] for me."); --made up text
	elseif(e.message:findi("wish to meditate")) then
		e.self:Say("Then find yerself a spot out o' the way. Please dinnae obstruct the paths of others who wish to pay tribute to the righteousness o' the Tribunal.");
	elseif(e.message:findi("make a delivery")) then
		e.self:Say("The Church of the Tribunal works with the Qeynos Guards to apprehend fugitives. There's a new criminal on the loose, so we must send a wanted poster to Qeynos for them to display on the walls of their bank. Speak with Cindl about a piece o' mammoth hide parchment and with Greta Terrilon about some ink and I'll prepare the bounty poster.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12621, item2 = 12619})) then 		--Mammoth Hide Parchment, Vial of Datura Ink
		e.self:Say("Here is th' bounty poster. Take it to a bank guard in Qeynos, immediately!");
		e.other:SummonItem(12620);													--Wanted Poster
		e.other:Faction(213,2);  													--Merchants of Halas
		e.other:Faction(294,2);  													--Shamen of Justice
		e.other:Faction(33,-3);  													--Circle of Unseen Hands
		e.other:Faction(48,-3);  													--Coalition of Tradefolk Underground
		e.other:Faction(137,-3); 													--Hall of the Ebon Mask
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12622})) then	--List of Qeynos Most Wanted
		e.self:Say(string.format("Ye're learnin' to serve the church well, young Initiate %s. I grant ye yer holy symbol and the blessing o' the Tribunal that They may grant ye wisdom in serving Their will..", e.other:GetName()));
		e.other:SummonItem(1376); 													--Initiate Symbol of the Tribunal
		e.other:Faction(213,2);  													--Merchants of Halas
		e.other:Faction(294,25);  													--Shamen of Justice
		e.other:Faction(33,-3);  													--Circle of Unseen Hands
		e.other:Faction(48,-3);  													--Coalition of Tradefolk Underground
		e.other:Faction(137,-3); 													--Hall of the Ebon Mask
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- DEVELOPER: KOVOU
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------

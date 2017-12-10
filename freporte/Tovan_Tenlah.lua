function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I suppose you're one of Nestral's new employees, eh? Well if that's the case I can help get you outfitted with some [gear] necessary for people in this [line of work].");
	elseif(e.message:findi("gear")) then
		e.self:Say("The first thing you need is a suit of sturdy traders clothing. Take this note to Verona Rankin and she'll help you with a suit tailored to your needs. Once you have been outfitted in your traders clothing return to me and I will inform you of your [next task].");
		e.other:SummonItem(19846); -- Note to Verona Rankin
	elseif(e.message:findi("next task")) then
		e.self:Say("Ready to get to work are you? Listen carefully. Outside Freeport's South gate you will find one of our employees, Rigg Nostra, who is acting as an intermediary between the Coalition of Tradefolk and some recently acquired business associates. Give him this card so he knows I've sent you and he will give you further instructions. Do not mention any of our names in public. The Freeport Militia would likely impose high taxes on the Coalition if they found out about the goods being exchanged to us by our new associates.");
		e.other:SummonItem(19917); -- Bent Playing Card
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19918})) then
		e.self:Say("Excellent work. You've fulfilled your end of the bargain, and a small reward's in order. Take this dagger to a forge with a sharpening stone. Once that is done, take it with this gem and a rattlesnake skin to Verona Rankin.");
		e.other:SummonItem(19919);
		e.other:SummonItem(19920);
		e.other:Faction(369,1,0); -- Coalition of TradeFolk III
		e.other:Faction(47,1,0); -- Coalition of Trade Folk
		e.other:Faction(31,1,0); -- Carson McCabe
		e.other:Faction(53,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(105,1,0); -- Freeport Militia
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10154 -- Tovan_Tenlah

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail citizen. Welcome to the Freeport Militia House. It is time for you to serve the state. You will assist us with our war with [Clan Deathfist] before you are truly accepted within our city. We urge you to be all we command you to be.");
	elseif(e.message:findi("clan deathfist")) then
		e.self:Say("'Clan Deathfist are the orcs of the Commonlands. They are a nuisance and Sir Lucan has ordered their extermination. You will go forth into the Commonlands and kill these orcs. Clan Deathfits is known to wear a Clan Belt. Bring this belt to me as proof of their death and you shall receive your wages and prove your allegiance to Freeport and all that is good.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13916})) then
		e.self:Say("Good work warrior. Your are good Militia material. Beware though, there are some who dare to call us foe. You have performed so well.");
		e.other:Ding();
		e.other:Faction(105,5,0); -- Freeport Militia
		e.other:Faction(311,-5,0); -- Steel Warriors
		e.other:Faction(184,-5,0); -- Knights of Truth
		e.other:AddEXP(100);
		e.other:GiveCash(0,0,8,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw  ID:9109 -- Captain_Hazran

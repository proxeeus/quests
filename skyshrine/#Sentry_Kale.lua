-- Sentry Kale in Skyshrine for Ring of the Chameleon
-- Part of the set of 3 Sentry Kale scripts (3 different quests according to P99 wiki)

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why come you to the home of the kin? Seek a home amongst the kin perhaps? Perhaps if you wish to prove yourself I may have a task for you.");
	elseif(e.message:findi("wish to prove")) then
		e.self:Say("Very well, it is a minor task, but I am sure that you are quite capable. Lately the food supply in the guards' galley has been dwindling. I fear that there are spiders amongst us who are pilfering our food when we do not see. I would ask of you to please seek out and eliminate these vermin for us. Bring their legs back to me and I shall reward you for your effort.");
	end
end

function event_trade(e)
	local item_lib = require("items");
		if(item_lib.check_turn_in(e.trade, {item1 = 29080, item2 = 29080, item3 = 29080, item4 = 29080})) then -- Velium Spider Legs
			e.self:Say("Excellent work, "..e.other:GetName()..". Here is your payment. I will also reward you for any more you bring.");
			e.other:Faction(430, 10); --Yelinak
			e.other:Faction(436, 10); --CoV
			e.other:Faction(448, -30); --Kromzek
			e.other:QuestReward(e.self, 0,0,0,4,29063, 32500); -- Ring of the Chameleon
		end
    item_lib.return_items(e.self, e.other, e.trade);
end

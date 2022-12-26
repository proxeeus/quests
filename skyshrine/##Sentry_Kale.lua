-- Sentry Kale in Skyshrine for Bracer of Hammerfall
-- Part of the set of 3 Sentry Kale scripts (3 different quests according to P99 wiki)

function event_say(e)
	if(e.message:findi("hail")) then 
		e.self:Say("Another "..e.other:Race()..", in the great shrine? Perhaps the times have gotten worse than we had expected -- I wonder if I will need to reactivate my [sentinel] for further use in my stead.");
	elseif(e.message:findi("sentinel")) then
		e.self:Say("It was not too long ago that I was merely a chunk of walking velium in the eyes of most who traveled through the shrine. However that golem was in fact one of my sentinels used to keep my identity secluded, and took on the tasks that I gave it. However, there has been a [problem] recently with our supplies, and I have had to take it offline until further notice.");
	elseif(e.message:findi("problem")) then
		e.self:Say("As you may have noticed, there are a great deal of golems and gargoyles within the shrine that consist of velium. These are our guards and they serve us well, however with extended use of these creatures comes extensive repair needed. It is because of this necessity to keep our sentries and lookouts working well that we require a great deal of velium ore stocked and ready for use. Unfortunately, our [supplies] have been running thin and we are in need of a new shipment of ore.");
	elseif(e.message:findi("supplies")) then
		e.self:Say("I may have been wrong in my initial thoughts about your race, "..e.other:Race()..". You may just prove to be worth my time. Take this note now and find Ungdin. Please hurry and remember to keep this information to yourself.");
		e.other:SummonItem(1725); -- Velium Delivery Note
	end
end

function event_trade(e)
	local item_lib = require("items");
		if(item_lib.check_turn_in(e.trade, {item1 = 29064})) then -- A shipment of Velium Ore
			e.self:Say("You've returned, and with the shipment of ore intact! It was wise to send you out on that mission, "..e.other:GetName()..", and I'm glad you did not fail. If you're looking for more assignments to do, I may have something that is just right for you. If you're interested in it, just let me know and we'll talk.");
			e.other:Faction(430, 10); --Yelinak
			e.other:Faction(436, 10); --CoV
			e.other:Faction(448, -30); --Kromzek
			local reward = 0;
			if math.random(10) > 5 then reward = 1727 end
			e.other:QuestReward(e.self, math.random(10),math.random(10),math.random(10),math.random(10), reward, 12500); -- Bracer of Hammerfal
		end
    item_lib.return_items(e.self, e.other, e.trade);
end

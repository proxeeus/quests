-- Sentry Kale in Skyshrine for Dragon Tooth Choker
-- Part of the set of 3 Sentry Kale scripts (3 different quests according to P99 wiki)

function event_say(e)
	if (e.other:GetFaction(e.self) <= 2) then -- Warmly or lower
		if(e.message:findi("hail") ) then
			e.self:Say("Ah, outsiders, I have heard word of your travel here.  Perhaps you wish to become a [friend of the kin]?");
		elseif(e.message:findi("friend of the kin") ) then
			e.self:Say("Good, then you would not mind assisting us with a matter of grave importance. We have received news of an alarming sort. There walks amongst us a spy of the storm giants, who feeds our every move to them and their accursed strategist. For the life of us, we cannot deduce whom the traitor is, however we have received word from Wenglawks of Kael, an associate of ours, that he has information concerning this. For a measly sum of 100 platinum, he has offered to give us the information to rid ourselves of this traitor. If you are indeed friend to the kin, take this note to Wenglawks and rid us of this traitor.");
			e.other:SummonItem(29068); -- Note to Wenglawks
		end
	else
		e.self:Say("You must prove your worth before I will discuss such matters with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 3) then
		if(item_lib.check_turn_in(e.trade, {item1 = 29065})) then -- a spy report
			e.self:Say("You have shown us yet again your loyalty to our people. Please accept this token of our gratitude.");
			e.other:Faction(436, 10); --Yelinak
			e.other:Faction(430, 10); --CoV
			e.other:Faction(448, -30); --Kromzek
			e.other:SummonItem(29050, 4); -- Dragon Tooth Choker (summoning outside QuestReward to set charges correctly)
			e.other:QuestReward(e.self, math.random(10),math.random(10),math.random(10),math.random(10), 0, 32500);
		end
	end
    item_lib.return_items(e.self, e.other, e.trade);
end

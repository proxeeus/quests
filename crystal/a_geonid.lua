function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1693}, 0)) then
		e.self:Emote("seems as if it doesn't recognize you as anything of importance. You attempt to speak with the geonid through your velium focus but all you are able to hear is the same though over and over.., Eat. You have gained no knowledge from these creatures but you notice your focus has been altered slightly.");
		e.other:Faction(458,10); -- Faction: Geonid Collective
		e.other:QuestReward(e.self,0,0,0,0,1701,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if(e.joined) then
		e.self:Emote("quakes with anger as it moves to attack.");
	end
end

function event_death_complete(e)
	e.self:Emote("rumbles and shakes as it goes through its last death spasms.");
end

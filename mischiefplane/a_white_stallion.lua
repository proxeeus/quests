--a white stallion (NPC
--zone:  mischiefplane

--quest NPC for Crest of the Unicorns.  Will spawn White Lithiniath upon quest hand-in

function event_spawn(e)
	eq.depop(126612);  --despawns White Lithiniath if remained up 
end

function event_say(e)
        if(e.message:findi("Hail")) then
                e.self:Emote("stares at " .. e.other:GetName() .. " unblinking with colorless eyes.");
        end      
end

function event_trade(e)
    local item_lib = require("items");
    if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22856})) then --Check for Lithiniath's Horn
        e.self:QuestSay(e.other,"Oh wow! A rabbits foot!! Thank you so much. Here take this, I won't need this smelly thing any more.");  
		e.other:QuestReward(e.self,0,0,0,0,24869,100);  --  Crest of the Unicorns
		eq.depop_with_timer();
		eq.spawn2(126612,0,0,-1013,509,110.97,198);
    end

    item_lib.return_items(e.self, e.other, e.trade)
end


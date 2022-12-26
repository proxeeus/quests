local scoutTurn = 0;

function event_spawn(e)
	scoutTurn = 0;
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 29683})) and (scoutTurn == 0) then -- Scout Tools
		e.self:Say("Great! I was wondering when they would send someone out to give me these. In my haste and excitement of this new assignment I forgot these. This scout business is great I must say. It sure beats setting in Southern Ro studying the ruins. I've been following these Storm Giants for days. They've been wandering up and down the coast looking for something."); 
		eq.set_timer("depop", 1200000); -- 20 minutes
		eq.load_encounter("Scout_Charisa");
        e.other:Faction(430,30);   --Claws of Veeshan
		e.other:Faction(362,30);  --Yelinak
		e.other:Faction(448,-20); --Kromzek
		e.other:QuestReward(e.self,0,0,0,0,0,100000);
		scoutTurn = 1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 29684})) then --Broken Disk
		e.self:Say("Ahhh the artifact, I will return this to Commander Leuz. Please take this updated report to him ahead of me so he knows what to expect on my arrival. Please accept this robe as a reward, I'm not very skilled at judging size so if you have a problem with wearing it please give it back and I will see what else I have for you.");
        e.other:Faction(430,30);   --Claws of Veeshan
		e.other:Faction(362,30);  --Yelinak
		e.other:Faction(448,-20); --Kromzek
        e.other:QuestReward(e.self,0,0,0,0,29688); --Scout Report
        e.other:QuestReward(e.self,0,0,0,0,29685,100000); --Robe of Benevolence
        
    elseif(item_lib.check_turn_in(e.trade, {item1 = 29685})) then --Robe of Benevolence
		e.self:Say("Didn't like the robe, eh? How about this then. They packed it in my scout kit, and it is of no use to me, though it looks very nice.");
        e.other:QuestReward(e.self,0,0,0,0,29686); --Bracer of Benevolence
    
    elseif(item_lib.check_turn_in(e.trade, {item1 = 29686})) then -- Bracer of Benevolence
		e.self:Say("Didn't like the bracer, eh? How about this then. They packed it in my scout kit, and it is of no use to me, though it looks very nice.");
        e.other:QuestReward(e.self,0,0,0,0,29687); --Talisman of Benevolence
    
    elseif(item_lib.check_turn_in(e.trade, {item1 = 29687})) then --Talisman of Benevolence
		e.self:Say("Didn't like the talisman, eh? How about this then. They packed it in my scout kit, and it is of no use to me, though it looks very nice.");
        e.other:QuestReward(e.self,0,0,0,0,29685); --Robe of Benevolence  
	end

	item_lib.return_items(e.self, e.other, e.trade)

end

function event_death_complete(e)
        eq.stop_timer("depop");
		eq.unload_encounter("Scout_Charisa");
		eq.depop(120115); --Captain
		eq.depop_all(120121); --warriors
		eq.depop_with_timer(); --Scout Charisa
		scoutTurn = 0;
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.unload_encounter("Scout_Charisa");
		eq.depop(120115); --Captain
		eq.depop_all(120121); --warriors
		eq.depop_with_timer(); --Scout Charisa
		scoutTurn = 0;
	end

end
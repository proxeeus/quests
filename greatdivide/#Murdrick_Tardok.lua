local cutscene = false;

function event_signal(e)
	if(e.signal == 1) then
		if(cutscene == false) then
			cutscene = true;
			eq.set_timer("dialogue1", 10000);
		end
	elseif(e.signal == 2) then
		e.self:Say("The Dain knows nothing, and I have a plan to keep it that way. I have given the matter much thought, and I have gathered you all here to ask for your help.");
		eq.set_timer("dialogue4", 5000);
	elseif(e.signal == 3) then
		e.self:Say("Rodrick knew what he was getting into, and so did you. It's a bit too late for second thoughts. I don't recall seeing any hesitation when the loot was being passed around.");
		eq.set_timer("dialogue6", 5000);
	elseif(e.signal == 4) then
		e.self:Say("As I said I've thought long and hard of our situation and I feel we are indeed in danger. My cousin Berradin is a captain in the Dain's army. I've always been uneasy about him, but now more than ever. He could easily betray many of us and take credit for destroying the rebellion.");
		eq.set_timer("dialogue8", 10000);
	elseif(e.signal == 5) then
		e.self:Say("Berradin has a weakness for drink, one drink in particular... Avalanche Ale. I have had the recipe altered slightly to include a deadly poison. I have much to do, I need one of you to brew the drink and bring it to me. I'll handle the rest.");
		eq.set_timer("dialogue11", 10000);
	elseif(e.signal == 6) then
		e.self:Emote("smiles, 'Very well, take this recipe and follow it exactly. It won't be easy, but you'll be richly rewarded for your efforts I assure you. Send word to meet me back here when you are finished.'");
		eq.set_timer("dialogue14", 5000);
	elseif(e.signal == 7) then
		eq.spawn2(118216, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	-- Spawn the true, attackable Murdrick
		e.self:Depop(true);
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("It seems we've been overheard, I must be off!");
		e.self:Depop(true);
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro Murdrick's buddies
		local npc_table = {118076,118075, 118074,118072,118073,118077};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end

function event_timer(e)
	if(e.timer == "dialogue1") then
		eq.stop_timer(e.timer);
		e.self:Say("Good day my friends, it is good to see you all are alive and well.");
		eq.set_timer("dialogue2", 5000);
	elseif(e.timer == "dialogue2") then
		eq.stop_timer(e.timer);
		eq.signal(118077, 1);	-- Prompts an answer from Davin Fatfist
	elseif(e.timer == "dialogue4") then
		eq.stop_timer(e.timer);
		eq.signal(118076, 1);		-- Prompts an answer from Gerton Dumkin
	elseif(e.timer == "dialogue6") then
		eq.stop_timer(e.timer);
		eq.signal(118075, 1);		-- Prompts an answer from Lapker Geynion
	elseif(e.timer == "dialogue8") then
		eq.stop_timer(e.timer);
		e.self:Say("My plan is to poison him and plant a suicide note on the body, a note in which he would take full responsibility for the actions of the rebels. This would both ensure that he could never betray us and would give the Dain closure. We will be free to continue working with our Kromrif friends without fear of discovery.");
		eq.set_timer("dialogue9", 15000);
	elseif(e.timer == "dialogue9") then
		eq.stop_timer(e.timer);
		eq.signal(118077, 2);		-- Prompts an answer from Davin Fatfist
	elseif(e.timer == "dialogue11") then
		eq.stop_timer(e.timer);
		eq.signal(118076, 2);		-- Prompts an answer from Gerton Dumkin
	elseif(e.timer == "dialogue14") then
		eq.stop_timer(e.timer);
		eq.signal(118076, 3);		-- Prompts an answer from Gerton Dumkin
	end
end
-- Crusader's Test #4
-- Spawn the iksar knight if he's not already up.

function event_combat(e)
	if(e.joined) then
		e.self:Emote("covers a pouch as to something from jumping out. 'You not get lizard!! You be squashed!!'");
	end
end

-- If an_Iksar_Knight is not up, spawn it and make him run towards Cabwest
function event_death_complete(e)
	local npc_list =  eq.get_entity_list():GetNPCList();
	local knightUp = false;
	for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 79112)) then
			knightUp = true;
		end
	end
	
	if(knightUp == false) then
		eq.spawn2(79112,0,0,1087,-957,-21,475); -- NPC: an_iksar_knight
	end
	
	npc_list = eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 79112)) then
			npc:CastToNPC():SetRunning(true);
			npc:CastToNPC():MoveTo(-719, -2023, 266, 300, true);
		end
	end
end
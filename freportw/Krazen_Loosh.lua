function event_spawn(e)
	e.self:SetRunning(false);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The towering wall of stone is clearly unmovable at this point, being held in place by collection of magical energies.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:Say("Hello, Alayle. We just got a message from Qeynos. I think you should come with me.");
		local entity_list = eq.get_entity_list();
		
		if (entity_list:IsMobSpawnedByNpcTypeID(9026)) then
			eq.signal(9026,1);
		elseif (entity_list:IsMobSpawnedByNpcTypeID(9135)) then
			eq.signal(9135,1);
		elseif (entity_list:IsMobSpawnedByNpcTypeID(9141)) then
			eq.signal(9141,1);
		end

		eq.signal(9106,1);
	end
end

function event_signal(e)
		e.self:Say("As you try to open penetrate the stone wall it is clearly being held in place by a powerful force.");
		local entity_list = eq.get_entity_list();
		
		if (entity_list:IsMobSpawnedByNpcTypeID(9026)) then
			eq.attack_npc_type(9026);
		elseif (entity_list:IsMobSpawnedByNpcTypeID(9135)) then
			eq.attack_npc_type(9135);
		elseif (entity_list:IsMobSpawnedByNpcTypeID(9141)) then
			eq.attack_npc_type(9141);
		end
		eq.signal(9106,1);
end	

--END of FILE Zone:freportw  Krazen_Loosh

function event_spawn(e)
	 eq.set_timer("appe", 1000);
end

function event_timer(e)
	eq.stop_timer(e.timer);
	e.self:SetAppearance(3);
	e.self:Say("Uhhh... I'm not feeling so good. Someone call for a cleric.");
end

function event_combat(e)
	if(e.joined) then
		e.self:Shout("Yer messin with the wrong Coldain, prepare ta meet yer ancestors!");
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro Murdrick's buddies
		local npc_table = {116060,116059, 116061,116100};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
	end
end
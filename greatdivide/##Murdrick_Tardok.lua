function event_combat(e)
	if(e.joined) then
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
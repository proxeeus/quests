-- Ajorek_the_Crimson_Fang NPCID: 124088
function event_combat(e)
	if (e.joined) then
		-- grab the entity list
		local entity_list = eq.get_entity_list();
		-- also aggro #Eashen_of_the_Sky (124004) and Yendilor_the_Cerulean_Wing (124056) 
		-- and Belijor_the_Emerald_Eye (124057) and Nelaarn_the_Ebon_Claw (124089) if they are up
		local npc_table = {124004,124056,124057,124089};
		for k,v in pairs(npc_table) do
			local npc = entity_list:GetMobByNpcTypeID(v);
			if (npc.valid) then
				npc:AddToHateList(e.other,1);
			end
		end
		e.self:Emote("lets out a piercing roar as it charges!");
	end
end
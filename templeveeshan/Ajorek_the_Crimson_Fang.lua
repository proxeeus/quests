-- Ajorek_the_Crimson_Fang NPCID: 124088
function event_combat(e)
	if (e.joined) then
		e.self:Emote("lets out a piercing roar as it charges!");
	end
end
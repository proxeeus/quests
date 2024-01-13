-- Belijor_the_Emerald_Eye NPCID: 124057
function event_combat(e)
	if (e.joined) then
		e.self:Emote("lets out a piercing roar as it charges!");
	end
end
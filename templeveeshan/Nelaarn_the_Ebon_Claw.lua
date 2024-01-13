-- Nelaarn_the_Ebon_Claw NPCID: 124089
function event_combat(e)
	if (e.joined) then
		e.self:Emote("lets out a piercing roar as it charges!");
	end
end
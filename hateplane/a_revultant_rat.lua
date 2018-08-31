function event_combat(e)

	if(e.joined == true) then
		e.self:Say("Eeeaiiiiiiiiiiiiiieeeee!");
	end
end

function event_slay(e)
	e.self:Emote("shivers in anticipation of its next meal.");
end

function event_death_complete(e)
	e.self:Emote("spurts foul smelling blood, and is still.");
end
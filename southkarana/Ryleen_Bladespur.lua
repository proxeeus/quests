function event_combat(e)
	if(e.joined == true) then
		e.self:Emote("glares, her gaze cold and wicked, as she readies her blades, 'One as pathetic as you dares to challenge a Bladespur to battle? Fool! I'll slit your arrogant throat!'");
	end
end

function event_death_complete(e)
	e.self:Emote("'s eyes grow wide in complete disbelief. She crumbles to the ground in a lifeless heap -- her deadened stare fixed in bewilderment.");
end

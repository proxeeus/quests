function event_combat(e)
	if(e.joined) then
		e.self:Say("Ugly creature near my feet, me thinks that you'll be good to eat!");
	end
end

function event_death_complete(e)
	e.self:Say("I wiggled my fingers and waved my hands.  But there is no glory in failed last stands!");
end
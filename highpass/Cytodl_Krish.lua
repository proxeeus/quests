function event_combat(e)
	if(e.joined) then
		e.self:Say("I shall show you the pure fury of the Dead!!");
	end
end

function event_death_complete(e)
	e.self:Say("Soon you shall learn the extent of the Dead's power.  Vengeance shall be theirs.");
end
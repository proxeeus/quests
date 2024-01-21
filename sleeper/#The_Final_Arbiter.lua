function event_combat(e)
	if(e.joined) then
		e.self:Shout("NONE SHALL PASS!");
	end
end

function event_death_complete(e)
	e.self:Shout("Warders, prepare, this one has failed its task!")
end

function event_slay(e)
	e.self:Shout("To approach The Sleeper is death.");
end
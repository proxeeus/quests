function event_combat(e)
	if(e.joined) then
		e.self:Say("Let me release your soul.");
	end
end

function event_death_complete(e)
	e.self:Say("Your destiny lies at the hands of the Greenbloods.");
end

function event_slay(e)
	e.self:Say("Now you know the power of the Greenblood Shamans. How unfortunate for you that it was in battle.");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Death to all who oppose Innoruuk's will!!");
	end
end

function event_death_complete(e)
	e.self:Say("Innoruuk has seen what you have done. His hate, along with the Dismal Rage, will find you.");
end

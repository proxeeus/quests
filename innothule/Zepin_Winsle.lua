function event_combat(e)
	if (e.joined) then
		e.self:Say("Your head shall make a fine trophy upon my mantle!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

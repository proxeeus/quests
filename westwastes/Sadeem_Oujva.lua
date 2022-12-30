function event_death_complete(e)
    e.self:Say("No!  It must..not..end..like this!");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Not even the dragons of Velious can content with my mastery of the elements!  Prepare to meet your fate, fool!");
	end
end


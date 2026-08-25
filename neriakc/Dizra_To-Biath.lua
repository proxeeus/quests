function event_combat(e)
	if e.joined then
		e.self:Say("Guards! Guards!");
	end
end

function event_slay(e)
	e.self:Say("Let that be a lesson to all!  Never cross a Dark Bargainer!");
end

function event_death_complete(e)
	e.self:Say("The death of a Dark Bargainer never goes unnoticed!");
end

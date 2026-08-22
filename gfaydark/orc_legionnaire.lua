function event_combat(e)
	if(e.joined) then
		e.self:Say("You are no match for a legionnaire!!");
	end
end

function event_death_complete(e)
	e.self:Say("You shall have all the Crushbone orc legions on your tail for my death!");
end

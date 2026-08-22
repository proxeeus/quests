function event_combat(e)
	if e.joined then
		e.self:Say("Silent and deadly are the daggers of the Ebon Mask!");
	end
end

function event_slay(e)
	e.self:Say("How foolish! You were no threat to me!");
end

function event_death_complete(e)
	e.self:Say("The Dead shall avenge my death!");
end

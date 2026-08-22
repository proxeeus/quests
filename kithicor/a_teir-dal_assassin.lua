function event_combat(e)
	if e.joined then
		e.self:Say("If it is death you desire, then I will be obliged to deliver it!");
	end
end

function event_death_complete(e)
	e.self:Say("My brothers will avenge my death!");
end

function event_slay(e)
	e.self:Say("Fool! You had no chance to destroy me!");
end

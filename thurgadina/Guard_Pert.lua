function event_signal(e)
	e.self:Emote("chuckles saying, 'Have fun Lieutenant, bring me back an ale while yer at it why don't ye!'");
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

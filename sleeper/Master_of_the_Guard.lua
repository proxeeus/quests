function event_combat(e)
	e.self:Shout("You shall not pass this point.");
end

function event_death_complete(e)
	e.self:Shout("Foolish mortals, this one is but one of many, you will not survive the rest!!")
end
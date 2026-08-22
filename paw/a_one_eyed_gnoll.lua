function event_combat(e)
	if(e.joined) then
		e.self:Say("You will never have my eye!' BARK! BARK!");
	end
end

function event_death_complete(e)
	e.self:Say("Ggggrrrrr... Bark... Bark... My eye... Bark!");
end

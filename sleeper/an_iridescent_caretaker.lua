function event_combat(e)
	if(e.joined) then
		e.self:Say("We have been awakened, the Ancients deem our service necessary.");
	end
end

function event_death_complete(e)
	e.self:Say("Our service now ends, but we are everlasting and one will replace us.");
end

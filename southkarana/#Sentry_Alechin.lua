function event_combat(e)
	if(e.joined == true) then
		e.self:Say("What foolishness is this?! Erollisi will not approve of your actions!!");
	end
end

function event_death_complete(e)
	e.self:Say("The Priests of Marr will not overlook my death. I pity you.");
end
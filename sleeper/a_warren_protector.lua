function event_combat(e)
	if(e.joined) then
		e.self:Say("Trespasser, your death will come swiftly in open arms.");
	end
end

function event_death_complete(e)
	e.self:Say("This one's death has been requisitioned, another is needed.");
end

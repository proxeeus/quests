function event_combat(e)
	if(e.joined) then
		e.self:Say("Hail.. Prime.. Healer!!");
	end
end

function event_death(e)
	e.self:Say("Temple.. Life.. Get you!!  Yes..");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Dark magic, aid me in slaying this fool!!");
	end
end

function event_death_complete(e)
	e.self:Say("A fallen heretic shall be avenged by dark magic.");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Dead men tell no tales!!");
	end
end

function event_death_complete(e)
	e.self:Say("You have run me through! Beware the Pirates of Gunthak.. They will avenge me. . . Unngh!!");
end
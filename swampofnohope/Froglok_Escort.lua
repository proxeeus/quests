function event_death_complete(e)
	e.self:Say("Gcroooakk.. I have failed.. Unghhh.");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Grripp.. Must not interfere with my mission!! Ribbit.");
	end
end
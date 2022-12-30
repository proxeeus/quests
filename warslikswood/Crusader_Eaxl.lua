
function event_combat(e)
	if(e.joined) then
		e.self:Say("You cannot hope to defeat a Crusader of Greenmist!!");
	end
end

function event_death_complete(e)
	e.self:Say("Ha ha!!  Fool..  The Crusaders of Greenmist shall torture you to death!!  Ha ha!!");
end
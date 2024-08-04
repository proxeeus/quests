function event_death_complete(e) 
	e.self:Say("Ha ha!!  Fool..  The Crusaders of Greenmist shall torture you to death!!  Ha ha!!");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Hiss..  You cannot hope to defeat a Crusader of Greenmist!!");
    end
end
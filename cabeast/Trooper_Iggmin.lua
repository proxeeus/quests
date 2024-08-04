function event_death_complete(e) 
	e.self:Say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Cease and desist!!");
    end
end

function event_slay(e)
    e.self:Say("Another victory for the Legion of Cabilis.");
end
function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Guards! Guards! Help me!!");
    end
  end
  
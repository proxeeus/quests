function event_death_complete(e)
	e.self:Say("This unit is disabled. Red 5 fragment forfeited.");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Click... Inferior being. Red 5 shall exterminate.");
    end
  end
  
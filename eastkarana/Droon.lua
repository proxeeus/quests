function event_spawn(e)
  e.self:SetRunning(true);
end

function event_death_complete(e)
  e.self:Say("Ugh.. You beat Droon. You am strong little thing.. Argh..");
end
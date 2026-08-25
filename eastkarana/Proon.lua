function event_spawn(e)
  e.self:SetRunning(true);
end

function event_combat(e)
  if(e.joined) then
    e.self:Say("WHAT YOU DONE TO MY KID!?! ME SQUASH YOU!!!!");
  end
end

function event_death_complete(e)
  e.self:Say("ARGH!!!... Broon? Broon? That you? What all this bright light? I coming son. argh.. argh.. Don't cry.. Poppa here now.. argh..");
end
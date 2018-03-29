function event_spawn(e)
  e.self:SetRunning(true);
end

function event_say(e)
    if(e.message:findi("hail")) then
      e.self:Say("Hail. I am in a bit of a hurry. Please excuse me.");
    end
end

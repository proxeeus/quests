function event_spawn(e)
  e.self:SetRunning(true);
end

function event_death_complete(e)
	e.self:Emote(".squeak, squeak..");
end

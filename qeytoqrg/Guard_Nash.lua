function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:DoAnim(29); -- wave
	end
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

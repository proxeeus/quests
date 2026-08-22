function event_waypoint_arrive(e)
  if(e.wp == 12) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1002,1);
    eq.signal(1181,1);
  elseif(e.wp == 28) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1090,1);
    eq.signal(1091,1);
  elseif(e.wp == 38) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1001,1);
    eq.signal(1189,1);
    eq.signal(1006,1);
    eq.signal(1174,1);
  end
end  

function event_combat(e)
	if(e.joined) then
		e.self:Say("Halt in the name of Antonius Bayle!  Fleeing will only make me angry and your beating more severe!");
	end
end

function event_slay(e)
	e.self:Say("How I loathe to soil my blade with such filth.");
end

function event_death_complete(e)
	e.self:Say("ARGH!  Antonius Bayle will have your head for this!  My men shall avenge me!");
end
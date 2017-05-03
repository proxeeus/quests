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

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
								)
			   );

end
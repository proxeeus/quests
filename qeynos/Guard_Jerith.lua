function event_say(e)
  if(e.message:findi("hail")) then
    e.self:QuestSay(e.other,string.format("Um, sorry, "..e.other:GetName()..". I don't wish to be rude, but I must not be distracted while I am at my post. Commander Bayle trusted me with this watch and I will not let him down.",e.other:GetName()));
  end
end

function event_signal(e)
  e.self:Say("Yes, sir!");
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
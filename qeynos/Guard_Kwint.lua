function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Hail, %s! Are you new to Qeynos? If you are, I highly recommend stopping by the Lion's Mane Tavern for the best ale in Antonica. Oh, did I mention that my brother Earron is the master brewer there? Tell him [Kwint sent] you.",e.other:GetName()));
  end
end

function event_trade(e)
  local item_lib =require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 18821})) then
    e.self:QuestSay(e.other, "Hey. Thanks! Sorry about that 'he's my brother' bit but I am sure you had a good time at the Lion's Mane anyway. I sure didn't lie to you about the quality of the ale there.");
    e.other:Faction(262,10,0);
    e.other:Faction(219,10,0);
    e.other:Faction(223,-20,0);
    e.other:Faction(230,-20,0);
    e.other:Faction(291,10,0);
    e.other:AddEXP(8000);
	e.other:GiveCash(8,0,0,0);
  end
  item_lib.return_items(e.self, e.other, e.trade, e.text)
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

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

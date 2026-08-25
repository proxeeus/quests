function event_combat(e)
  local racesplural = require("races_plural");

  if(e.joined) then
    e.self:Say(eq.ChooseRandom(
      string.format("Filthy %s like you must die!", racesplural.GetPlural(e.other:GetRace())),
      "Prepare to die!!",
      "How could you ever expect to defeat the swift blades of the Butcherblock Bandits?!"
      )
    );
  end
end

function event_death_complete(e)
  e.self:Say("You shall soon feel the daggers of the Butcherblock Bandits upon your back!!");
end

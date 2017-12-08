function event_combat(e)
  local racesplural = require("races_plural");

  e.self:Say(eq.ChooseRandom(
  string.Format("Filthy %s like you must die!", racesplural.GetPlural(e.other:GetRace())),
                "Prepare to die!!"
    )
  );
end

function event_death_complete(e)
  e.self:Say("You shall soon feel the daggers of the Butcherblock Bandits upon your back!!");
end

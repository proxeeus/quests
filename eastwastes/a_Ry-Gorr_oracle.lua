function event_combat(e)

    local racesplural = require("races_plural");
    
    e.self:Say(eq.ChooseRandom(string.Format("%s like you are better left dead than alive.", racesplural.GetPlural(e.other:GetRace()))));
end

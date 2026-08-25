function event_combat(e)

    local racesplural = require("races_plural");

    if(e.joined) then
        e.self:Say(eq.ChooseRandom(string.Format("%s like you are better left dead than alive.", racesplural.GetPlural(e.other:GetRace())),
                                   "Crush, maim, kill, and defy!  For dinner tonight, your brains we shall fry!"));
    end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20372})) then --
		e.other:Ding();
		e.self:Say("Ah! 'Bout time ye got yer lazy bones down here! I was beginnin' ta worry bout ya. Thought ye'd never pick the doll up. Me kin worked and toiled over this thing fer days. That Baenar was sure exact in every detail. For a special child, he said. Must be some child. He spent all he had and some he didn't. Still owes us a show! Anyway, I heard she passed away some time ago. Give the lad muh regards.");
		e.other:SummonItem(20370);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_combat(e)
	if(e.joined) then
		local racesplural = require("races_plural");

		e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
									 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
									 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
									)
				   );
    end
end
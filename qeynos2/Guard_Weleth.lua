function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s. My name is Weleth Nagoh. In addition to my patrol, I am in charge of keeping the guardhouse stocked with supplies. I must get back to my duties. Farewell.",e.other:GetName()));
	elseif(e.message:findi("crate")) then
		e.self:Say("Oh, we just received a shipment of arrows from [Nesiff] in South Qeynos. The arrows in this box are missing their fletchings and I can't leave my patrol to take them back.");
	elseif(e.message:findi("nesiff")) then
		e.self:Say("Nesiff Tallaherd owns the wooden weapons shop in Merchant's Square in South Qeynos.");
	elseif(e.message:findi("arrows")) then
		e.self:Say("Oh, thank you! Here is the crate. Make sure [Nesiff] sends me back a new invoice. [Lieutenant Dagarok] would have my head if he found out this happened again!");
		e.other:SummonItem(13925); -- Crate of Defective Arrows
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18824})) then -- Slip of Parchment
		e.self:Say("Thank you so much for the favor. Please be careful here in Qeynos. I have come to suspect that even some of my fellow guards are not to be trusted - Lieutenant Dagarok, for one.");
		local random_cp = math.random(8);
		e.other:Ding();
		e.other:Faction(262,10,0); -- Guards of Qeynos
		e.other:Faction(219,10,0); -- Antonius Bayle
		e.other:Faction(223,-20,0); -- Circle Of Unseen Hands
		e.other:Faction(230,-20,0); -- Corrupt Qeynos Guards
		e.other:Faction(291,10,0); -- Merchants of Qeynos
		e.other:AddEXP(8000);
		e.other:GiveCash(random_cp,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 8) then
		e.self:Say("Argh. Not again. This whole crate needs to be returned!");
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

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

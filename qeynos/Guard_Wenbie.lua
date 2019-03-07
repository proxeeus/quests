function event_combat(e)

	local racesplural = require("races_plural");

	e.self:Say( eq.ChooseRandom( string.format("It's %s like you who have ruined your own lands. You'll not ruin mine!",racesplural.GetPlural(e.other:GetRace())), 
								 string.format("%s have no place in our realm!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("%s like you are better left dead than alive!",racesplural.GetPlural(e.other:GetRace())),
								 string.format("Time to die %s.",racesplural.GetSingle(e.other:GetRace()))
								)
			   );

end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, "..e.other:GetName()..". What brings you to Qeynos? Must be the mighty fine muffins over at [Voleen's Bakery]. I just love those muffins!",e.other:GetName()));
	elseif(e.message:findi("voleen's bakery")) then
		e.self:Say("Oh, it will be easier for us both if I just show you where it is. Follow me. But be quick about it, because I have to get back to my patrol.");
	end
end

function event_trade(e)
	local muffin = 0;
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13014,item2 = 13014,item3 = 13014,item4 = 13014})) then
			muffin = 4;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13014,item2 = 13014,item3 = 13014})) then
			muffin = 3;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13014,item2 = 13014})) then
			muffin = 2;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13014})) then
			muffin = 1;
	end
	if(muffin > 0) then
		repeat
			e.self:Say("Oh, thank you so much. I do get hungry on patrol. Here, please take this reward for your kindness.");
			e.other:Ding();
			e.other:Faction(262,5,0);
			e.other:Faction(219,5,0);
			e.other:Faction(291,5,0);
			e.other:Faction(230,-5,0);
			e.other:Faction(223,-10,0);
			e.other:AddEXP(10);
			muffin = muffin - 1;
		until muffin == 0
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

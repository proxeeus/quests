function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! Spend your time wisely in the city of Qeynos. Do not let your mind wander to thoughts of bravado or crime. My guards can easily put to rest any outbreaks. Good day to you, citizen!");
	end
end

function event_signal(e)
	e.self:Say("Ah.  Good.  You have arrived.  Executioner, could you please visit McNeal Jocub at Fish's Tavern.  He has violated our laws and the sentence is death.");
	eq.signal(1202);
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915, item3 = 13915, item4 = 13915})) then -- Gnoll Fang x 4
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(219,4,0); -- Antonius Bayle
		e.other:Faction(223,-4,0); -- Circle of Unseen Hands
		e.other:Faction(230,-4,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,4,0); -- Guards of Qeynos
		e.other:Faction(291,4,0); -- Merchants of Qeynos
		e.other:AddEXP(20000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915, item3 = 13915})) then -- Gnoll Fang x 3
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(219,3,0); -- Antonius Bayle
		e.other:Faction(223,-3,0); -- Circle of Unseen Hands
		e.other:Faction(230,-3,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,3,0); -- Guards of Qeynos
		e.other:Faction(291,3,0); -- Merchants of Qeynos
		e.other:AddEXP(15000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915, item2 = 13915})) then -- Gnoll Fang x 2
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(219,2,0); -- Antonius Bayle
		e.other:Faction(223,-2,0); -- Circle of Unseen Hands
		e.other:Faction(230,-2,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,2,0); -- Guards of Qeynos
		e.other:Faction(291,2,0); -- Merchants of Qeynos
		e.other:AddEXP(10000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13915})) then -- Gnoll Fang
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(10070); -- Moonstone
		e.other:Ding();
		e.other:Faction(219,1,0); -- Antonius Bayle
		e.other:Faction(223,-1,0); -- Circle of Unseen Hands
		e.other:Faction(230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,1,0); -- Guards of Qeynos
		e.other:Faction(291,1,0); -- Merchants of Qeynos
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18815})) then
		e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
		e.other:SummonItem(13305);
		e.other:Ding();
		e.other:Faction(219,1,0); -- Antonius Bayle
		e.other:Faction(223,-1,0); -- Circle of Unseen Hands
		e.other:Faction(230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,1,0); -- Guards of Qeynos
		e.other:Faction(291,1,0); -- Merchants of Qeynos
		e.other:AddEXP(500);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(10));
		eq.spawn2(1202,62,0,-412,75,-24,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18912})) then
		e.self:Say("So, an assassin has been sent to Qeynos! I shall have my guards keep an eye out for any suspicious looking visitors. As for you... you should speak with the Surefall Glade ambassador. Ambassador Gash is staying at the Lion's Mane Inn here in South Qeynos. Inform him that [an assassin has been sent to kill] him. Do not let the assassin near him!");
		e.other:Ding();
		e.other:Faction(219,1,0); -- Antonius Bayle
		e.other:Faction(223,-1,0); -- Circle of Unseen Hands
		e.other:Faction(230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(262,1,0); -- Guards of Qeynos
		e.other:Faction(291,1,0); -- Merchants of Qeynos
		e.other:AddEXP(500);
		e.other:GiveCash(math.random(10),math.random(10),math.random(10),math.random(10));
	end
	item_lib.return_items(e.self, e.other, e.trade)
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
-- END of FILE Zone:qeynos  ID:1077 -- Captain_Tillin

function event_say(e)
	if(e.message:findi("nadox")) then
		e.self:Say("How am I supposed to know? Sounds like some darn troll lair. You're the adventurer, why don't you go investigate it. I will stay here to look for more clues.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 55003})) then
		e.self:Say("Yes, what is it, citizen?' Bribbely reads the note from Jasmine. 'Great, just what I need.' Guard Bribbely sighs. 'I have been a member of the guard for twenty years, investigating countless thefts and other crimes against Freeport and you think you can just waltz in here and solve this? You adventurers are all the same. Ok, 'investigator', if you think you are so smart, here is what we know so far: After the trolls attacked the ship, one of them was left behind and captured by us. After being beat, er questioned, the troll eventually told us that they were from Broken Skull Rock and that is probably where they took our captured ship. He didn't know about any mail, but says that any loot onboard was most likely taken to the [Crypts of Nadox] to await distribution by treasure sorters to the trolls there as payment. Further questioning revealed that a ship on the shores of Stonebrunt can take people to Broken Skull.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)
	if(e.joined) then
		local say = eq.ChooseRandom(true, false);
		if(say == true) then
			e.self:Say(eq.ChooseRandom(
										"Die, dog!!",
										"That's it, swine! You're outta here!",
										string.format("Time to die, %s.", e.other:GetName())
									  ));
		else
			e.self:Emote(string.format("smacks the flat of his blade against the palm of his hand and says, 'You want a taste of this, %s?!!",e.other:GetName()));
		end
	end
end

function event_death(e)
	e.self:Say(eq.ChooseRandom(
								"My comrades will avenge my death.",
								"Your name shall be added to the most wanted list of the Freeport Militia!!"
							   ));
end

function event_slay(e)
	e.self:Say("Let your death be a warning to all who dare oppose the Freeport Militia!");
end
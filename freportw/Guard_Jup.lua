function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, Citizen. In this time of piracy on the high seas, your [duty] is clear, is it not?");
	elseif(e.message:findi("duty")) then
		e.self:Say("What duty? To your state and your fellow man, that is what duty! These attacks must be stopped, before all order is lost and the city falls to [vermin]! We must strike them down first, with strength and determination; this could get out of hand.");
	elseif(e.message:findi("vermin")) then
		e.self:Say("The pirates of Broken Skull Rock are uncouth and relentless. They take whatever they may want, ruining trade lines without regard to the might of such established cities as Freeport. The rotten thieves are all thrown and mixed together in filthy shantytowns from what I hear, so striking at their heart should not be terribly difficult. Your [mission] is clear.");
	elseif(e.message:findi("mission")) then
		e.self:Say("Go to Broken Skull Rock! Slay these impudent pirates and wreak havoc on their plans. Some of them carry a seal that grants passage about their society, bring me ten of these such seals and your duty to your city shall be fulfilled. We might even have some form of [reward] for you.");
	elseif(e.message:findi("reward")) then
		e.self:Say("First the seals, then the reward! Take this to transport them in.");
		e.other:SummonItem(17174);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 54010})) then
		e.self:Say(string.format("Excellent work, %s!  This will teach the pirates of Broken Skull a lesson and help our cause in repelling them.  Here is your reward.",e.other:GetName()));
		e.other:SummonItem(54024);
		e.other:Ding();
		e.other:AddEXP(10000);
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
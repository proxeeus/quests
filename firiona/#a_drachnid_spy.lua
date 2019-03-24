function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks upon you with evil eyes and you hear a horrid chatter. Hairs rise from the spider's thorax. 'Greetings, creature. What a fine meal you would make!'");
		e.self:AddToHateList(e.other);
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("You shall not take the tome from me!! I shall snack upon your blood-drained corpse.");
	end
end

function event_death_complete(e)
	eq.signal(84319, 1);
	eq.spawn2(84411,0,0,-1886,597,148,194);
end
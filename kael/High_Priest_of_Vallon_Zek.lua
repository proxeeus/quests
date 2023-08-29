function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Emote("If you seek the high prophet, return another time, " .. e.other:Race() .. ".");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end
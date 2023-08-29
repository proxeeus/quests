function event_combat(e)
	if(e.joined) then
		e.self:Say("I will gut you like a fish when I am done.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Say("Another fine day for ice fishing here in Kael.");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("fishing")) then
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Say("You should get a rod and fish, too.  It can be very relaxing.");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end
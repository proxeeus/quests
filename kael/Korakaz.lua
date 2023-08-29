function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("I will cut them all down! Every last one of [them]!");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("them")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("The dragons and the Coldain! All of the infidels! They must be crushed! They must be smashed!");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("crush")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("Leave me be or I will crush you too!");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end
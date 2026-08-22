function event_combat(e)
	if(e.joined) then
		local roll = math.random(2);
		if(roll == 1) then
			e.self:Say("Ooooh, you don't know what Froggy's gonna do to you!");
		else
			e.self:Say("FOCUS FOCUS FOCUS!");
		end
	end
end

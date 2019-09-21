function event_combat(e)

	if(e.joined == true) then
		e.self:Say("You are almost beneath notice, but our master commands your death.");
	end
	
end

function event_slay(e)
	e.self:Emote("snorts in contempt, not at all surprised at the ease of her victory.");
end

function event_death_complete(e)
	local random_result = math.random(100);
	e.self:Say("blinks in confusion, obviously surprised that she has met her end at the hands of mere mortals.");
	-- 30% chance of spawning Thought Destroyer for Paladin's Epic
	if(random_result <= 30) then
		eq.spawn2(76070,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end
function event_combat(e)

	if(e.joined == true)
		e.self:Say("I shall defeat you with my superior skill and style!");
	end
	
end

function event_slay(e)
	e.self:Say("You are weak!");
end

function event_death_complete(e)
	e.self:Say("My form was weak, your style was excellent. I hate you!");
end
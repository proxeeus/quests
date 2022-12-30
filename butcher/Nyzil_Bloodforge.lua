function event_combat(e)
	if(e.joined) then
		e.self:Say("Now you shall know the skill of a member of the Bloodforge Brigade!!");
	end
end

function event_death_complete(e)
	e.self:Say("My brothers of the Stormguard shall avenge me!!  Your days are numbered!");
end

function event_slay(e)
	e.self:Say("Yet another victory for Kaladim and the Bloodforge Brigade!");
end
function event_combat(e)
	if(e.joined) then
		e.self:Emote("gives an unearthly hiss and attacks!");
	end
end

function event_death_complete(e)
	e.self:Emote("writhes, releasing its grasp on order, dissolving into entropy");
end

function event_slay(e)
	e.self:Emote("has hastened another into entropy.");
end

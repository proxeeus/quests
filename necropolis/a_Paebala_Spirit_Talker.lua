function event_combat(e)
	if(e.joined) then
		e.self:Say("Wikiwikiwiki!");
	end
end

function event_death_complete(e)
	e.self:Say("Neeeeeeeee........");
end

function event_slay(e)
	e.self:Emote("gnashes its teeth in victory.");
end

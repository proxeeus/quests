function event_combat(e)
	if e.joined then
		e.self:Emote("drifts threateningly toward its enemies.");
	end
end

function event_death(e)
	e.self:Emote("wails as his corpse is torn free.");
end

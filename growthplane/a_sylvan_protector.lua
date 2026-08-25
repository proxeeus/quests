function event_combat(e)
	if (e.joined) then
		e.self:Say("We will use your body to grow new trees!");
	elseif not e.joined then
		e.self:Emote("growls as it races away.");
	end
end

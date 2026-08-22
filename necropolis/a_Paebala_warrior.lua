function event_combat(e)
	if(e.joined) then
		e.self:Say("Viyiyiyi!");
	end
end

function event_death_complete(e)
	e.self:Say("poit....narfnarf...erp!");
end

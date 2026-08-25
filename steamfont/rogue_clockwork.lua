function event_combat(e)
	if (e.joined) then
		e.self:Say("Click.. Whirr..  Warning. Enemy.. Attack. Destroy. Kill.");
	end
end

function event_death_complete(e)
	e.self:Say("This unit is terminally damaged..  Tick..  Broadcasting violation to other units.");
end

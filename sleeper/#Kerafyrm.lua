function event_cast_begin(e)
	if(e.spell:ID() == 982) then
		e.self:Shout(e.self:GetTarget():GetCleanName() .. "!");
	end
end

function event_waypoint_arrive(e)
	if ( e.wp == e.self:GetMaxWp() - 1 ) then
		eq.signal(114508, 1);                   -- A Guardian of the Shrine (Skyshrine)
		eq.debug("Sleeper at end waypoint");
		eq.depop();
	end
end

function event_slay(e)
    e.self:Shout("Begone insect, I have much slaying yet to do!");
end
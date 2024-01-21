-- Kerafyrm's "Rampage through Skyshrine" script

function event_cast_begin(e)
	if(e.spell:ID() == 982) then
		e.self:Shout(e.self:GetTarget():GetCleanName() .. "!");
	end
end

function event_waypoint_arrive(e)
	if ( e.wp == 59 ) then
		e.self:GMMove(-1079, 1590, 16.20, 0);
		
	elseif ( e.wp == 61 ) then
		e.self:GMMove(660, -60, 6.20, 0);
		
	elseif ( e.wp == 158 ) then
		e.self:GMMove(1198, 1231, 6.20, 0);		
	
	elseif ( e.wp == 200) then
		eq.depop();
	end
end

function event_slay(e)
    e.self:Shout("Begone insect, I have much slaying yet to do!");
end


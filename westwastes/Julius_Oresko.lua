function event_death_complete(e)
    e.self:Say("This can not be!  I have been bested by a ".. e.other:GetRaceName() .. "! Rallos forgive me!  I have failed you!");
end



function event_combat(e)
	if(e.joined) then
		e.self:Say("My blades have slain dragons! A ".. e.other:GetRaceName() .. " like you does not have a chance of survival!");
	end
end
function event_combat(e)
	if(e.joined) then
		e.self:Say("Darkness and decay shall claim your flesh!");
	end
end

function event_death_complete(e)
	e.self:Say("HA! FOOLS! Your gift of rage has been most appreciated. My evil shall live forever, thanks to you. Bertoxxulous shall be pleased. ...argh... Hhhsssss...");

	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local hloc = e.self:GetHeading();

	eq.spawn2(4190,105,0,xloc,yloc,zloc,hloc);
end

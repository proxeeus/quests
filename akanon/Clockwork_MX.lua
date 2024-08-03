function event_death_complete(e)
	e.self:Say("Click... Tick... City violation. Code 5150. This unit is authorized to execute punishment. Please stand still. Thank you.");
	local rand = math.random(2);
	if(rand == 1) then
		eq.spawn2(55019,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
	if(rand == 2) then
		eq.spawn2(55019,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.spawn2(55019,0,0,e.self:GetX()+10,e.self:GetY()+10,e.self:GetZ(),e.self:GetHeading());
	end
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Bzzzz... Click... This unit is terminally damaged. Destruction of city property is a violation of city code 22468. All units shall be notified of your offense...");
    end
  end
  
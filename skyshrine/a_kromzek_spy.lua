function event_combat(e) 
    if(e.joined == true) then
        eq.spawn2(114141,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),389);
        eq.depop_with_timer();
    end
end
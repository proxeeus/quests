function event_combat(e)
  if(e.joined == true) then
    e.self:Say("Guardians, there is an invader amongst us!  We must destroy them!");
  end
end

-- Spawns "The lifeless velium figure" for the death emote, purely cosmetic.
function event_death_complete(e)
  eq.spawn2(114589,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end


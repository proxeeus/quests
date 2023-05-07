function event_combat(e)
  if(e.joined == true) then
    e.self:Say("Foul being, you have trifled with one of the kin and now you will die!");
  end
end


function event_death_complete(e)
  e.self:Say("My life is extinguished, but my life force will live on to aid the shrine!");
end


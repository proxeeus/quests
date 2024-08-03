function event_death_complete(e)
	e.self:Say("Bzzzz... Click... This unit is terminally damaged. Destruction of city property is a violation of city code 22468. All units shall be notified of your offense...");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Click... Tick... City violation. Code 5150. This unit is authorized to execute punishment. Please stand still. Thank you.");
    end
  end
  
  function event_spawn(e)
    eq.set_timer("poke",4200000);
  end
  
  function event_timer(e)
    e.self:Say("Do not poke, shoot, or enchant the animals.");
  end
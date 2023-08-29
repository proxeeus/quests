function event_combat(e)
	if(e.joined) then
		e.self:Say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("watches you but does not say a word.");
	end
end

function event_signal(e)

	if (e.signal == 1) then
	
		local kyenka = eq.get_entity_list():GetMobByNpcTypeID(113133);
		
		eq.follow(kyenka:GetID());
	end
end
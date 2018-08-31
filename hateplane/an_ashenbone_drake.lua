function event_combat(e)

	if(e.joined == true)
		e.self:Say("Feel the rage of our master!");
	end
end

function event_slay(e)
	e.self:Say("One less foe to trouble our lord and master!");
end

function event_death_complete(e)
	e.self:Say("This is no victory for you!  Your hate grows with every kill!");
end
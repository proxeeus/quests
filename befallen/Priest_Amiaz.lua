function event_death_complete(e)
	e.self:Say("You may have won this battle, my friend, but I shall rise again... and one day, all shall know the true power of the Burning Dead!");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("HAH! Someone as weak as yourself wouldn't even make a decent slave! You're better off dead, I say!");
	end
end

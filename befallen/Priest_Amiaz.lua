function event_death_complete(e)
	e.self:Say("You may have won this battle, my friend, but I shall rise again... and one day, all shall know the true power of the Burning Dead!");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("HAH! Someone as weak as yourself wouldn't even make a decent slave! You're better off dead, I say!");
	end
end

function event_slay(e)
	e.self:Say("You should feel honored that your soul shall finally be made useful. I will donate its energy to the hungry Marnek, so that he may soon walk the face of Antonica once again.");
end
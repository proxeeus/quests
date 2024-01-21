function event_combat(e)
	if(e.joined) then
		e.self:Say("Go back to whence you came, nothing but death lies within. If the guardians of this tomb do not kill you, The Sleeper surely will.");
	end
end

function event_death_complete(e)
	e.self:Shout("Progenitor, one has fallen, a replacement is needed.")
end

function event_slay(e)
	e.self:Say("One has performed well. The Sleeper must not wake.");
end
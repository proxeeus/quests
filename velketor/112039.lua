-- an_Icepaw_Champion (capital C)

function event_combat(e)
	if(e.joined) then
		e.self:Emote("howls and lunges.");
	end
end
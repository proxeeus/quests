function event_combat(e)

	if(e.joined == true)
		e.self:Say("Hssst.bFoolish mortal! You can not kill the dead!");
	end
end

function event_slay(e)
	e.self:Say("Die!");
end

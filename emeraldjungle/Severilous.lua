function event_combat(e)
	if e.joined then
		e.self:Say("Very cute, mortal.  Please, please, don't kill me.  Hah!  Tell me, are you immune to poison?  I certainly hope so.  I am.")
	end
end

function event_death_complete(e)
	e.self:Say("This cannot be!  How did one such as you slay me?  I curse you,  your children, and your children's children.  All here will pay!")
end

function event_slay(e)
	e.self:Say(string.format("Ahah!  What did I tell you, %s?  As your life slips away, you may hear me laugh at you.  Ha ha, ha ha, ha ha.  There, now you have learned your lesson.  A pity it is far too late.", e.other:GetName()))
end

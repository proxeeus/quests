function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("smells of fine scents and has very oily, shiny skin. 'Greetings!  Who are you?  If you came to speak with the Haggle Baron, you must have matters of heavy coin to discuss. Ha ha! I love heavy coin!'");
	end
end

function event_death_complete(e) 
	e.self:Say("All Iksar residents... shall learn... of my demise. Ungghh!");
end

function event_combat(e)
    if(e.joined == true) then
      e.self:Say("Troopers! Help!");
    end
end
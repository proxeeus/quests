function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Arrrgh ! Help ! They're tryin' ta kill me !");
	end
end

function event_death_complete(e)
	eq.spawn2(29095, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! Da name's Frenegan, I be a strong warrior of Gro..of Halas! All hail errr..da Tribunal! Wut? Why are ye givin' Frenegan this [odd] look?");
	elseif(e.message:findi("odd")) then
		e.self:Say("Ye! You look at Frenegan odd! What did Frenegan [do] to yus?!");
	elseif(e.message:findi("do")) then
		e.self:Say("Dentar-- Frenegan did nuthin' wrong, hear me?! Nuthin'! Now leave Frenegan be or else me call guards!!");
	end
end
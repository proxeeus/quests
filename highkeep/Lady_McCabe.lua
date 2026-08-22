function event_say(e)
  if(e.message:findi("hail")) then
      e.self:Say(string.format("Pleasure to meet you, %s. What brings you to High Hold? You do not appear to be the gambling type. Then again, you are speaking with me. That is quite a gamble in itself. I just love high rollers. Really, I do!", e.other:GetName());
  elseif(e.message:findi("battle staff")) then
      e.self:Say("I have no idea what you are talking about. Battle staff.. Hmmm.. No, it does not ring a bell.");
  end
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("Guards!  Guards!  Help me!!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

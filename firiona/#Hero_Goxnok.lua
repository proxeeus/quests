function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sighs slowly, seeing the confusion on your face. He says, 'Yes, "..e.other:GetName()..", I am the traitor. What I can gain by giving up this tome outweighs any patriotic obligations I may have once had. That city is dead, it is now time for us to grasp at our own destinies. I now give you two choices, Iksar. You can walk away and never speak of this to anyone......or you can die. What will it be?");
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Die by the power of Greenmist!!");
	end
end

function event_death_complete(e)
	e.self:Say("You shall now be a wanted man.. The Union of Vie shall punish you.");
end
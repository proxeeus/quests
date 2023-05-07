function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do not tread to the halls behind me mortals. Beyond this point is the holy shrine dedicated to Veeshan. You have no business beyond here unless you wish to simply lose your life.");
	end
end

function event_combat(e)
	if (e.joined) then
		e.self:Emote("lets out a piercing roar as it charges!");
	end
end
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("shifts his glance from "..e.other:GetName().." and returns his stern glare to the plains beyond, 'My master is a high priest of the Dark Father. He is my mentor, and I his pupil. Nothing further need be spoken on the subject, as it has no importance to you and your own existence. I stress once more, move along, "..e.other:GetName()..". The Captain is not one to tolerate his men being disrupted at their posts.'");
	end
end
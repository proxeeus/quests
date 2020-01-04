function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, "..e.other:GetName()..".");
	elseif(e.message:findi("eldreth")) then
		e.self:Say("Eldreth is not here right now. *chuckle* He went to find work, but if you know Eldreth, you would know that 'Eldreth working' is an oxymoron! Sometimes I wonder why I still share this tower with him. I suppose I get lonely on this lake, and Jebeker here never has much to say. But I digress. Eldreth will be back sooner rather than later, I would think. You are welcome to stay here and keep me company until he returns, or you can check back later. He is seldom gone more than a few days.");
	end
end
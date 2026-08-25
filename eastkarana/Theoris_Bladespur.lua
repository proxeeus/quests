function event_combat(e)
	if(e.joined) then
		e.self:Emote("curls his lip and draws his blades in a professional, intimidating quickness, 'You will soon know to regret the arrogance of your ways, little one -- and how unfortunate that your regret will be so short lived in the last seconds of your life.'");
	end
end

function event_death_complete(e)
	e.self:Emote("drops his weapons and gives a brief, muffled growl that sprays a light mist of blood from his lips as he falls dead to the ground.");
end

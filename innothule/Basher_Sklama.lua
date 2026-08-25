function event_combat(e)
	if (e.joined) then
		e.self:Say("I shall pluck you limb from limb!!");
	end
end

function event_death_complete(e)
	e.self:Say("Curse you!! Da bashers will have yer head.");
end

function event_slay(e)
	e.self:Say("Those who play with da Basher always gets bashed good!!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Me hear dat dere are humans, elves and other weaklings hunting in da swamp.");
	end
end

-- END of FILE Zone:innothule  ID:228 -- Basher_Sklama


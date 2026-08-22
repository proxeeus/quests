-- Merged emote pool for najena "a_magician" NPCs (44005/14/22/26/72/75/87/88/89).
-- Multiple templates share this name in DB; combat/death picks a random line.

local combat_lines = {
	"Ugly creature near my feet, me thinks that you'll be good to eat!",
}

local death_lines = {
	"My comrades will avenge my death.",
	"I wiggled my fingers and waved my hands.  But there is no glory in failed last stands!",
}

function event_combat(e)
	if(e.joined) then
		local roll = math.random(2);
		if(roll == 1) then
			e.self:Say(combat_lines[1]);
		else
			e.self:Say(string.format("Time to die %s.", e.other:GetName()));
		end
	end
end

function event_death_complete(e)
	e.self:Say(death_lines[math.random(#death_lines)]);
end

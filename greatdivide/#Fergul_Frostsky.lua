function event_spawn(e)
	-- runs as soon as he spawns, in middle of combat
	e.self:SetRunning(true);
	eq.start(67);	-- Grid ported from P2002 on 23/08/2026
end

function event_waypoint_arrive(e)
	-- if reached the end of his path, send signal to shardwurm to depop with timer and Gralk to depop.
	if(e.wp == 4) then
		eq.signal(118086,2); -- Gralk_Dwarfkiller
		eq.signal(118040,2); -- shardwurm_broodmother
	end
end

function event_death_complete(e)
	-- upon death, send signal to shardwurm to depop with timer and Gralk to depop.
	eq.signal(118086,2);
	eq.signal(118040,2);
end

function event_combat(e)
	if(e.joined) then
		e.self:Emote("howls in anger as claws and teeth slash their way through Kromrif flesh. He bolts, his mind set on returning to Kael and assistance.");
	end
end

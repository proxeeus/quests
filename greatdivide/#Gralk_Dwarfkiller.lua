function event_signal(e)
	-- signal from Broodmother to walk out to front of fort to meet her.
	if(e.signal == 1) then
		e.self:Say("The broodmother approaches. Come Fergul, we must defend the fort!");
		eq.start(66);	-- Grid ported from P2002 on 23/08/2026
	-- signal to depop from Fergul Frostsky once he either reaches end of path or dies
	elseif (e.signal == 2) then
		eq.depop();
	end
end

function event_combat(e)
	if(e.joined) then
		e.self:Emote("roars in anger and flings himself at the draconic beast.");
	end
end

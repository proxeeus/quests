function event_spawn(e)
  e.self:Shout("YAP! YAP! YAP! In the way of my father, I claim your blood for the glory of Blackburrow!! WOOOOOOOF!!");
  e.self:SetRunning(true);
end

function event_combat(e)
	e.self:Say(
		(eq.ChooseRandom("YAP! YAP! YAP! In the way of my father, I claim your blood for the glory of Blackburrow!! WOOOOOOOF!!",
				"You have trespassed long enough on Sabertooth land!")));
end

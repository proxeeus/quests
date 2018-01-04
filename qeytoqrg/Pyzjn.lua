-- Hailing should test against faction.
-- If friendly :Pyzjn says 'Hail, Arkytz . Pyzjn is working for Master Varsoon. If Pyzjn do good work maybe Master Varsoon tell Master Bruax he is worthy. Pyzjn must go now. All glory to the Plaguebringe! May you die a painful, oozing death.
-- otherwise keep the same text

function event_say(e)
	e.self:Say("I didn’t know Slime could speak common..go back to the sewer before I lose my temper.");
end

function event_combat(e)
	e.self:Say("Hmm. You offend Pyzjn. Your death come soon. Hail, Bertoxxulous!");
end

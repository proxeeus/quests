-- "Emote" NPC used on various Guardian deaths.
-- Flavor text is "The lifeless velium figure falls to the ground, unable to serve the shrine any longer.", then depops.

function event_spawn(e)
  e.self:Emote("falls to the ground, unable to serve the shrine any longer.")
  e.self:Depop();
end
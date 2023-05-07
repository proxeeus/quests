-- "Emote" NPC used on various Sentries deaths.
-- Flavor text is "The velium golem crumbles to the floor, broken and no longer useful to the shrine.", then depops.

function event_spawn(e)
  e.self:Emote("crumbles to the floor, broken and no longer useful to the shrine.")
  e.self:Depop();
end
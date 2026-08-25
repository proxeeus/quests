sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Orc stomp, orc kill - orc weapons, your blood will spill.");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Argh! Clan Deathfist will spill blood for my death!");
}

# EOF Zone: sro NPC: Erg_Bluntbruiser

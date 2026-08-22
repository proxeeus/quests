sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("May the unholy peace of Innoruuk be with you!!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Start digging your grave.  The Indigo Brotherhood shall find you.");
}

sub EVENT_SLAY {
  quest::say("Hardly a worthy adversary.  A member of the Indigo Brotherhood deserves a much better opponent.");
}

# EOF Zone: overthere ID: 93124 NPC: Dragoon_Barber_W`Selo

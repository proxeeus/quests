sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("How dare you!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

# EOF Zone: oot ID: 69019 NPC: Glendl_Vargnus

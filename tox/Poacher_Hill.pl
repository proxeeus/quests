sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Time to die $name.");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Time to die $name.");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}
#END of FILE Zone:qcat  ID:45046 -- an_exhausted_guard

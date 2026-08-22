sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Guards!  Guards!  Help me!!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}
#END of FILE Zone:qcat  ID:45001 -- a_courier

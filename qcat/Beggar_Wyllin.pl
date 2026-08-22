sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Guards! Guards! Help me!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Fear the Deepwater Knights. My brothers shall avenge me.");
}
#END of FILE Zone:qcat  ID:45115 -- Beggar_Wyllin

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Ugly creature near my feet, me thinks that you'll be good to eat!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("I wiggled my fingers and waved my hands.  But there is no glory in failed last stands!");
}

# EOF Zone: oot NPC: a_goblin_headmaster

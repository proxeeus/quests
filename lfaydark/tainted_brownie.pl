sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::say("You not gonna escape from da taint, tall freak!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(57117,0,0,$x,$y,$z,$h);
}
sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(92,703,38,262,true);
	}
	if($signal==2) {
		quest::moveto(20,534,68,0,true);
	}
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}


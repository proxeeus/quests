sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I have no time to answer questions, whelp!  Now, leave this place before the sting of death finds the life in your veins!"); }
}


sub EVENT_DEATH_COMPLETE {
	quest::say("My comrades will avenge my death.");
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("That was not a very intelligent thing to do.");
  }
}

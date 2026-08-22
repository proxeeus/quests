sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("King Tormax must be stopped, no matter what the cost."); }
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(117,701,38,256,true);
	}
	if($signal==2) {
		quest::moveto(30,533,68,0,true);
	}
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

#END of FILE Zone:thurgadinb  ID:129032 -- Councilor_Icepike


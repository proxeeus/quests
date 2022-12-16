sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I am here to make sure no one flees the arena as a coward."); }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Your bones will be crushed by the Kromzek of Kael Drakkel!");
  }
}
#END of FILE Zone:kael  ID:113041 -- a_storm_giant_gladiator 


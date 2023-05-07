sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is assumed that the froglok stronghold is well defended. None of the troopers sent from this garrison to find it have ever returned.  At least, not in one piece."); }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Fear the blades of the Iksar!!");
  }
}

sub EVENT_DEATH_COMPLETE {
    quest::say("You have not won. Consider yourself wanted by the Legion of Cabilis.");
}

sub EVENT_SLAY {
    quest::say("Another victory for the Legion of Cabilis.");
}
#END of FILE Zone:swampofnohope  ID:83066 -- Trooper_Lorgen 


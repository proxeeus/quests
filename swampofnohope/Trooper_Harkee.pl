sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("If you find yourself deep in the swamp and starving, try foraging.  I am sure you'll find something to eat.  If not, there are always froglok tongues."); }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::say("Fear the blades of the Iksar!!");
  }
}

sub EVENT_DEATH_COMPLETE {
    quest::say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
}

sub EVENT_SLAY {
    quest::say("Another victory for the Legion of Cabilis.");
}
#END of FILE Zone:swampofnohope  ID:83065 -- Trooper_Harkee 


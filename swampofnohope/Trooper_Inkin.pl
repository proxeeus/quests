sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Many frogloks in here.  Beware!  They can be a sneaky bunch. I hear tales of a froglok village nearby."); }
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
#END of FILE Zone:swampofnohope  ID:83063 -- Trooper_Inkin 


sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("My father once dove to the depths of the lake.  He said there were many dangers. but reported seeing structures still standing and glints of treasure in the muck below."); }
}

sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::say("Fear the blades of the Iksar!!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("You have not won.  Consider yourself wanted by the Legion of Cabilis.");
}

sub EVENT_SLAY {
  quest::say("Another victory for the Legion of Cabilis.");
}

#END of FILE Zone:lakeofillomen  ID:5121 -- Trooper_Kylpog


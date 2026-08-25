sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Ye need a swig of some fine dwarven ale!"); }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

#END of FILE Zone:thurgadina  ID:115163 -- Durgan_Bottlenip


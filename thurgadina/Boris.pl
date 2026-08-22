sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Hey. you der! Dis privot propertee! Is you here to do sumthin bad to me master Valdicar?"); }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

#END of FILE Zone:thurgadina  ID:115078 -- Boris


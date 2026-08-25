sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I've found it at last! By calculating the aerodynamic plane of the shaft and measuring it against the wind resistance and downward pull of the head I've managed to create the perfect arrow! I suggest ye take advantage of my stock while it lasts, $name. it sure as Brell won't be around for long.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

#END of FILE Zone:thurgadina  ID:Not_Found -- Tavir
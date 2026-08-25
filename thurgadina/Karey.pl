sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Oh hello there! I'm sorta new here so I ask ye to be patient with me heheh. What kin I get fer ya, $name?");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

#END of FILE Zone:thurgadina  ID:Not_Found -- Karey
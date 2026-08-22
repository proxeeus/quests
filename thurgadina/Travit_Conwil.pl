sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Uuuhh, this be a private room, me friend. Mayhap ye should leave before somethin' unfortunate happens.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
  quest::say("My comrades will avenge my death.");
}

#END of FILE Zone:thurgadina  ID:Not_Found -- Travit_Conwil
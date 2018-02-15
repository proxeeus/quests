sub EVENT_SAY {

    quest::say("You will have to excuse me, I am quite busy."); #Text made up
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this.");
  plugin::return_items(\%itemcount);
}

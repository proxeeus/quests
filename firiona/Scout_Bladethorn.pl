sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings! Keep an eye out for invaders. We may patrol the outpost, but every now and then a goblin or two manages to sneak in.");
  }
}

sub EVENT_DEATH_COMPLETE {
    quest::say("You shall now be a wanted man... The Union of Vie shall punish you.");
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:firiona  ID:84126 -- Scout_Bladethorn
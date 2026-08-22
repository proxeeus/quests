#########################################################
# Tal Godin (ID:50010)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: Deepwater Knight combat / death shouts
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("Foolish being! You dare attack a Deepwater knight! You shall perish for such audacity.");
   }
}

sub EVENT_DEATH_COMPLETE {
   quest::say("My comrades will avenge my death.");
}

#########################################################
# Zepin Winsle (ID:50291)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: Trophy hunter combat / death shouts
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("Your head shall make a fine trophy upon my mantle!");
   }
}

sub EVENT_DEATH_COMPLETE {
   quest::say("My comrades will avenge my death.");
}

#########################################################
# Peltin Funter (ID:50292)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: House of Funter combat / death shouts
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("Die!  Another trophy for the House of Funter!");
   }
}

sub EVENT_DEATH_COMPLETE {
   quest::say("My comrades will avenge my death.");
}

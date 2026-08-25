#########################################################
# Gwynn Marthank (ID:50280)
# Zone:   Rathe Mountains (rathemtn)
# Flavor: House Marthank hunter combat / death shouts
#########################################################

sub EVENT_COMBAT {
   if ($combat_state == 1) {
      quest::say("What sport it shall be to hunt you. Run, while you can!");
   }
}

sub EVENT_DEATH_COMPLETE {
   quest::say("My comrades will avenge my death.");
}
